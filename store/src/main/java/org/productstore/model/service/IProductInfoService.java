package org.productstore.model.service;

import com.github.pagehelper.PageInfo;
import org.productstore.common.pojo.BSResult;
import org.productstore.common.pojo.Bar;
import org.productstore.common.pojo.Pie;
import org.productstore.exception.BSException;
import org.productstore.model.entity.ProductInfo;

import java.util.List;

public interface IProductInfoService {

    List<ProductInfo> findAllProductList(int currentPage, int pageSize);

    List<ProductInfo> findProductListByCateId(int cateId, int currentPage, int pageSize);

    ProductInfo findById(Integer productId) throws BSException;

    PageInfo<ProductInfo> findProductListByCondition(String keywords, int cateId, int page, int pageSize,int storeId);

    ProductInfo queryProductAvailable(int productId);

    BSResult saveProduct(ProductInfo productId,String productDescStr);

    BSResult updateProduct(ProductInfo productInfo, String productDesc);

    BSResult changeShelfStatus(int productId,int shelf);

    ProductInfo adminFindById(int productId) throws BSException;

    BSResult deleteProduct(int productId);

    int addLookMount(ProductInfo productInfo);

    List<Pie> getProductViewsPiesByStoreId(Integer storeId);

    Bar getProductSalesBarJson(Integer storeId);
}
