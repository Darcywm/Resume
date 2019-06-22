package org.productstore.model.service;

import org.productstore.model.entity.custom.Cart;
import org.productstore.common.pojo.BSResult;
import org.productstore.model.entity.ProductInfo;

import javax.servlet.http.HttpServletRequest;

public interface ICartService {

    BSResult addToCart(ProductInfo productInfo, Cart cart, int buyNum);

    BSResult clearCart(HttpServletRequest request,String sessionName);

    BSResult deleteCartItem(int productId, HttpServletRequest request);

    BSResult updateBuyNum(int productId, int newNum, HttpServletRequest request);

    BSResult checkedOrNot(Cart cart,int bookId);

}
