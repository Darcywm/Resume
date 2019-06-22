package org.productstore.model.service.impl;

import org.productstore.model.dao.ProductCategoryMapper;
import org.productstore.model.entity.ProductCategory;
import org.productstore.model.service.IProductCateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 书籍分类服务
 */
@Service
public class ProductCateServiceImpl implements IProductCateService {


    @Autowired
    private ProductCategoryMapper productCategoryMapper;


    @Override
    public List<ProductCategory> getCategoryList() {
        return productCategoryMapper.selectAll();
    }
}
