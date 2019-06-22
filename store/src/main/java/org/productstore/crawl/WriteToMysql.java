package org.productstore.crawl;

import org.productstore.model.dao.ProductInfoMapper;
import org.productstore.model.entity.ProductInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.SQLException;
import java.util.List;

@Component
public class WriteToMysql {

    @Autowired
    private ProductInfoMapper productInfoMapper;

    public void executeInsert(List<ProductInfo> productdatas) throws SQLException
    {
        long start = System.currentTimeMillis() / 1000;
        System.out.println(start);
        for (ProductInfo productdata : productdatas) {

        }
        for (ProductInfo productdata : productdatas) {
            productInfoMapper.insert(productdata);
        }

        System.out.println("成功插入" + productdatas.size() + "条");
        System.out.println(System.currentTimeMillis() / 1000);
        System.out.println(System.currentTimeMillis() / 1000 - start);
    }

}
