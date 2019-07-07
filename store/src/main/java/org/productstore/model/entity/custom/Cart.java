package org.productstore.model.entity.custom;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 购物车实体类
 */
public class Cart {

    private Map<Integer,List<CartItem>> cartItems = new HashMap<>();

    private double total;

    private String storeId;

    public Map<Integer,List<CartItem>> getCartItems() {
        return cartItems;
    }

    public void setCartItems(Map<Integer, List<CartItem>> cartItems) {
        this.cartItems = cartItems;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getStoreId() {
        return storeId;
    }

    public void setStoreId(String storeId) {
        this.storeId = storeId;
    }
}
