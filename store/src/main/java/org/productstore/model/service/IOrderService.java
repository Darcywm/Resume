package org.productstore.model.service;

import org.productstore.common.pojo.BSResult;
import org.productstore.model.entity.custom.Cart;
import org.productstore.model.entity.User;
import org.productstore.model.entity.custom.OrderCustom;
import org.productstore.pay.PayContext;

import java.util.List;

public interface IOrderService {

    List<OrderCustom> findOrdersByUserId(int userId);

    List<OrderCustom> findOrdersByStoreId(int storeId);

    BSResult createOrder(Cart cart, User user, String express, int payMethod);

    BSResult findOrderById(String orderId);

    BSResult deleteOrder(String orderId);

    void updateOrderAfterPay(PayContext payContext);

    BSResult postOrder(String orderId);

    OrderCustom findOrderCustomById(String orderId);

    BSResult updateOrder(OrderCustom orderCustom);

    BSResult confirmReceiving(String orderId);
}
