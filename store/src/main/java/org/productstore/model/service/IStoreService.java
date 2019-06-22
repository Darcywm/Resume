package org.productstore.model.service;

import org.productstore.common.pojo.BSResult;
import org.productstore.model.entity.Store;

import java.util.List;

public interface IStoreService {
    Store findStoreByUserId(Integer userId);

    Store findById(int storeId);

    List<Store> findStores();

    BSResult updateStore(Store store);

    BSResult deleteStore(int storeId);

    BSResult addStore(Store store);
}
