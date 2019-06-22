package org.productstore.model.service;

import org.productstore.model.entity.ProductCategory;

import java.util.List;

public interface IProductCateService {
    List<ProductCategory> getCategoryList();
}
