package org.productstore.model.service.impl;

import org.productstore.model.service.IOrderDetailService;
import org.productstore.model.dao.ProductInfoMapper;
import org.productstore.model.dao.OrderDetailMapper;
import org.productstore.model.entity.ProductInfo;
import org.productstore.model.entity.OrderDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class OrderDetailServiceImpl implements IOrderDetailService {

    @Autowired
    private OrderDetailMapper orderDetailMapper;

    @Autowired
    private ProductInfoMapper productInfoMapper;

    @Override
    public List<ProductInfo> findProductsByOrderId(String orderId) {

        Example example = new Example(OrderDetail.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("orderId", orderId);
        List<OrderDetail> orderDetails = orderDetailMapper.selectByExample(example);

        List<ProductInfo> productInfos = orderDetails.stream()
                .map(orderDetail -> productInfoMapper.selectByPrimaryKey(orderDetail.getProductId()))
                .collect(Collectors.toList());

        return productInfos;
    }

}
