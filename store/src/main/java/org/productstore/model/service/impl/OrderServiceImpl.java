package org.productstore.model.service.impl;

import org.productstore.model.entity.*;
import org.productstore.model.service.IOrderService;
import org.productstore.common.pojo.BSResult;
import org.productstore.common.utils.BSResultUtil;
import org.productstore.common.utils.IDUtils;
import org.productstore.model.dao.ProductInfoMapper;
import org.productstore.model.dao.OrderDetailMapper;
import org.productstore.model.dao.OrdersMapper;
import org.productstore.model.dao.OrderShippingMapper;
import org.productstore.model.entity.*;
import org.productstore.model.entity.custom.Cart;
import org.productstore.model.entity.custom.CartItem;
import org.productstore.model.dao.custom.CustomMapper;
import org.productstore.model.entity.custom.OrderCustom;
import org.productstore.pay.PayContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements IOrderService {

    @Autowired
    private CustomMapper customMapper;

    @Autowired
    private OrdersMapper orderMapper;

    @Autowired
    private OrderShippingMapper orderShippingMapper;

    @Autowired
    private OrderDetailMapper orderDetailMapper;

    @Autowired
    private ProductInfoMapper productInfoMapper;

    //未完成状态，比如未付款等
    private final int NOT_COMPLETED = 0;

    private final int COMPLETED = 1;

    //未发货
    private final int NOT_POST = 2;
    //已发货
    private final int POSTED = 3;

    //确认收货
    private final int CONFIRM_REVEIVE = 4;

    @Override
    public List<OrderCustom> findOrdersByUserId(int userId) {
        return customMapper.findOrdersByUserId(userId);
    }

    @Override
    public List<OrderCustom> findOrdersByStoreId(int storeId) {
        return customMapper.findOrdersByStoreId(storeId);
    }

    /**
     * 创建订单
     *
     * @param cart
     * @param user
     * @return
     */
    @Override
    @Transactional
    public BSResult createOrder(Cart cart, User user, String express, int payMethod) {
        Map<Integer, CartItem> cartItems = cart.getCartItems();

        if(cartItems.size() > 0){
            Orders order = new Orders();
            String orderId = IDUtils.genOrderId();
            order.setOrderId(orderId);
            order.setUserId(user.getUserId());
            order.setCreateTime(new Date());
            order.setUpdateTime(new Date());
            order.setBuyerRate(NOT_COMPLETED);
            order.setShippingName(express);
            order.setOrderMount(cartItems.size());
            order.setPayment(String.format("%.2f", cart.getTotal()));
            order.setPaymentType(payMethod);
            order.setStatus(NOT_COMPLETED);
            order.setBuyerRate(NOT_COMPLETED);
            order.setPostFee("0.00");//邮费
            orderMapper.insert(order);

            OrderShipping orderShipping = new OrderShipping();
            orderShipping.setOrderId(orderId);
            orderShipping.setCreated(new Date());
            orderShipping.setUpdated(new Date());
            orderShipping.setReceiverAddress(user.getDetailAddress());
            orderShipping.setReceiverMobile(user.getPhone());
            orderShipping.setReceiverName(user.getUsername());
            orderShipping.setReceiverZip(user.getZipCode());
            orderShipping.setReceiverState("广东");
            orderShipping.setReceiverCity("广州");
            orderShipping.setReceiverDistrict("海珠区");
            orderShippingMapper.insert(orderShipping);

            List<OrderDetail> orderDetails = new ArrayList<>();
            for (Map.Entry<Integer, CartItem> cartItemEntry : cartItems.entrySet()) {

                CartItem cartItem = cartItemEntry.getValue();
                if (cartItem.getBuyNum() > 0 && cartItem.isChecked()) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrderId(orderId);
                    orderDetail.setProductId(cartItemEntry.getKey());
                    orderDetail.setMount(cartItem.getBuyNum());
                    orderDetail.setOrderNumber(orderId);
                    orderDetail.setPostStatus(NOT_COMPLETED + "");
                    orderDetail.setReceiveStatus(NOT_COMPLETED + "");
                    orderDetail.setStoreId(cartItem.getProductInfo().getStoreId());
                    orderDetail.setTotalPrice(BigDecimal.valueOf(cartItem.getSubTotal()));
                    orderDetail.setUnitPrice(cartItem.getProductInfo().getPrice());
                    orderDetail.setImageUrl(cartItem.getProductInfo().getImageUrl());
                    orderDetail.setProductName(cartItem.getProductInfo().getName());
                    orderDetails.add(orderDetail);
                    orderDetailMapper.insert(orderDetail);
                }
            }
            return BSResultUtil.success(order);
        }else
            return BSResultUtil.build(400, "没有选中的购物项，创建订单失败!");
    }

    /**
     * 通过订单号查询订单
     * @param orderId
     * @return
     */
    @Override
    public BSResult findOrderById(String orderId) {
        Orders orders = orderMapper.selectByPrimaryKey(orderId);
        return BSResultUtil.success(orders);
    }

    @Override
    @Transactional
    public BSResult deleteOrder(String orderId) {

        Example example = new Example(OrderDetail.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("orderId", orderId);
        orderDetailMapper.deleteByExample(example);

        orderMapper.deleteByPrimaryKey(orderId);
        orderShippingMapper.deleteByPrimaryKey(orderId);

        return BSResultUtil.success();
    }

    /**
     * 支付后
     * @param payContext
     */
    @Override
    public void updateOrderAfterPay(PayContext payContext) {
        //更新订单
        Orders order = payContext.getOrders();
        order.setUpdateTime(new Date());
        order.setPaymentTime(new Date());
        order.setStatus(COMPLETED);
        order.setPaymentTime(new Date());
        orderMapper.updateByPrimaryKey(order);

        //更新库存
        List<ProductInfo> products = payContext.getProductInfos();

        Example example = new Example(OrderDetail.class);
        Example.Criteria criteria = example.createCriteria();


        products.forEach(productInfo -> {
            example.clear();
            criteria.andEqualTo("productId", productInfo.getProductId());
            List<OrderDetail> orderDetails = orderDetailMapper.selectByExample(example);
            if(orderDetails != null && !orderDetails.isEmpty()){
                productInfo.setStoreMount(productInfo.getStoreMount()-orderDetails.get(0).getMount());
                productInfo.setDealMount(productInfo.getDealMount()+orderDetails.get(0).getMount());
            }
            productInfoMapper.updateByPrimaryKey(productInfo);
        });

    }

    @Override
    public BSResult postOrder(String orderId) {
        Orders orders = new Orders();
        orders.setOrderId(orderId);
        try {
            orders.setStatus(POSTED);
            orderMapper.updateByPrimaryKeySelective(orders);
        } catch (Exception e) {
            orders.setStatus(NOT_POST);
            orderMapper.updateByPrimaryKeySelective(orders);
            e.printStackTrace();
            return BSResultUtil.build(500, "发货失败");
        }
        return BSResultUtil.success();
    }

    @Override
    public OrderCustom findOrderCustomById(String orderId) {
        OrderCustom orderCustom = new OrderCustom();
        Orders orders = orderMapper.selectByPrimaryKey(orderId);
        Example example = new Example(OrderDetail.class);
        example.createCriteria().andEqualTo("orderId", orderId);
        List<OrderDetail> orderDetails = orderDetailMapper.selectByExample(example);
        OrderShipping orderShipping = orderShippingMapper.selectByPrimaryKey(orderId);
        orderCustom.setOrder(orders);
        orderCustom.setOrderDetails(orderDetails);
        orderCustom.setOrderShipping(orderShipping);
        return orderCustom;
    }

    @Override
    public BSResult updateOrder(OrderCustom orderCustom) {
        orderMapper.updateByPrimaryKeySelective(orderCustom.getOrder());
        orderShippingMapper.updateByPrimaryKeySelective(orderCustom.getOrderShipping());
        return BSResultUtil.success();
    }

    @Override
    public BSResult confirmReceiving(String orderId) {
        Orders order = new Orders();
        order.setOrderId(orderId);
        order.setStatus(CONFIRM_REVEIVE);
        int i = orderMapper.updateByPrimaryKeySelective(order);
        if(i > 0){
            return BSResultUtil.success();
        }
        return BSResultUtil.build(400, "确认收货失败!");
    }
}
