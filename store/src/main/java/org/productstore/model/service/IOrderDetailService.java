package org.productstore.model.service;

import org.productstore.model.entity.ProductInfo;

import java.util.List;

public interface IOrderDetailService {

    List<ProductInfo> findProductsByOrderId(String orderId);
}
