package org.productstore.model.service.impl;

import org.productstore.common.pojo.BSResult;
import org.productstore.common.utils.BSResultUtil;
import org.productstore.model.entity.ProductInfo;
import org.productstore.model.entity.custom.Cart;
import org.productstore.model.entity.custom.CartItem;
import org.productstore.model.service.ICartService;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class CartServiceImpl implements ICartService {

    @Override
    public BSResult addToCart(ProductInfo productInfo, Cart cart, int buyNum) {

        //购物车为空，新建一个
        if (cart == null) {
            cart = new Cart();
        }
        Map<Integer, List<CartItem>> cartItemMaps = cart.getCartItems();
        List<CartItem> cartItemList =new ArrayList<>();
        double total = 0;
        if (cartItemMaps.containsKey(productInfo.getStoreId())) {
            cartItemList = cartItemMaps.get(productInfo.getStoreId());
            for(int i=0;i<cartItemList.size();i++){
                CartItem cartItem = cartItemList.get(i);
                if(productInfo.getProductId().equals(cartItem.getProductInfo().getProductId())){
                    cartItem.setBuyNum(cartItem.getBuyNum() + buyNum);
                    cartItem.setSubTotal(cartItem.getBuyNum() * productInfo.getPrice().doubleValue());
                    //cartItem.setProductInfo(productInfo);
                    break;
                }else{
                    CartItem cartItem1 = new CartItem();
                    cartItem1.setBuyNum(buyNum);
                    cartItem1.setProductInfo(productInfo);
                    cartItem1.setSubTotal(productInfo.getPrice().doubleValue() * buyNum);
                    cartItemList.add(cartItem1);
                }
            }
        } else {
            CartItem cartItem1 = new CartItem();
            cartItem1.setBuyNum(buyNum);
            cartItem1.setProductInfo(productInfo);
            cartItem1.setSubTotal(productInfo.getPrice().doubleValue() * buyNum);
            cartItemList.add(cartItem1);
            cartItemMaps.put(productInfo.getStoreId(),cartItemList);
        }
        for(Map.Entry<Integer, List<CartItem>> cartItemEntry : cartItemMaps.entrySet()) {
            for (CartItem cartItem : cartItemEntry.getValue()) {
                total += cartItem.getSubTotal();
            }
        }
        cart.setTotal(total);

        return BSResultUtil.success(cart);

    }

    @Override
    public BSResult clearCart(HttpServletRequest request, String sessionName) {
        request.getSession().removeAttribute(sessionName);
        return BSResultUtil.success();
    }

    @Override
    public BSResult deleteCartItem(int productId, HttpServletRequest request) {

        Cart cart = (Cart) request.getSession().getAttribute("cart");
        Map<Integer, List<CartItem>> cartItemMaps = cart.getCartItems();
        for(Map.Entry<Integer, List<CartItem>> cartItemEntry : cartItemMaps.entrySet()) {
            List<CartItem> cartItemList =  cartItemEntry.getValue();
            for(int i=0;i<cartItemList.size();i++){
                if (productId == (cartItemList.get(i).getProductInfo().getProductId())) {
                    CartItem cartItem = cartItemList.get(i);
                    cart.setTotal(cart.getTotal() - cartItem.getSubTotal());
                    cartItemList.remove(productId);
                    break;
                }
            }
            if(cartItemList==null || cartItemList.size()<=0) {
                cartItemMaps.remove(cartItemEntry.getKey());
            }
        }
        request.getSession().setAttribute("cart", cart);
        return BSResultUtil.success();
    }

    @Override
    public BSResult updateBuyNum(int productId, int newNum, HttpServletRequest request) {

        Cart cart = (Cart) request.getSession().getAttribute("cart");
        Map<Integer, List<CartItem>> cartItemMaps = cart.getCartItems();
        for(Map.Entry<Integer, List<CartItem>> cartItemEntry : cartItemMaps.entrySet()) {
            List<CartItem> cartItemList =  cartItemEntry.getValue();
            for(int i=0;i<cartItemList.size();i++) {
                //取出订单项所对应的书籍，根据新的购买数量重新计算小计
                CartItem cartItem = cartItemList.get(i);
                //不知道是加还是减去商品的数量，所以先减去原来的购物项小计，最后再加新的小计
                if(productId == cartItem.getProductInfo().getProductId()) {
                    cart.setTotal(cart.getTotal() - cartItem.getSubTotal());
                    ProductInfo productInfo = cartItem.getProductInfo();
                    cartItem.setSubTotal(
                            productInfo.getPrice().doubleValue() * newNum);

                    cartItem.setBuyNum(newNum);
                    cart.setTotal(cart.getTotal() + cartItem.getSubTotal());
                    break;
                }
            }
        }

        request.getSession().setAttribute("cart", cart);
        return BSResultUtil.success();
    }

    @Override
    public BSResult checkedOrNot(Cart cart, int productId) {
        Map<Integer, List<CartItem>> cartItemMaps = cart.getCartItems();
        boolean exist = false;

        for(Map.Entry<Integer, List<CartItem>> cartItemEntry : cartItemMaps.entrySet()) {
            List<CartItem> cartItemList =  cartItemEntry.getValue();
            for(int i=0;i<cartItemList.size();i++) {
                //取出订单项所对应的书籍，根据新的购买数量重新计算小计
                CartItem cartItem = cartItemList.get(i);
                //不知道是加还是减去商品的数量，所以先减去原来的购物项小计，最后再加新的小计
                if(productId == cartItem.getProductInfo().getProductId()) {
                    if (cartItem.isChecked()) {
                        //如果之前是true，那就设为false
                        cartItem.setChecked(false);
                        cart.setTotal(cart.getTotal() - cartItem.getSubTotal());
                        cartItem.setSubTotal(0.00);
                    } else {
                        //如果之前是false，那就设为true
                        cartItem.setChecked(true);
                        cartItem.setSubTotal(cartItem.getBuyNum() * cartItem.getProductInfo().getPrice().doubleValue());
                        cart.setTotal(cart.getTotal() + cartItem.getSubTotal());
                    }
                    exist=true;
                    break;
                }
            }
        }
        if(exist){
            return BSResultUtil.success();
        } else {
            return BSResultUtil.build(400, "购物车没有这本书籍!");
        }
    }

}
