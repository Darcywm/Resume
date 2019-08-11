package org.productstore.model.dao.custom;

import org.productstore.model.entity.custom.OrderCustom;
import org.productstore.model.entity.Privilege;
import org.productstore.model.entity.Role;
import org.productstore.model.entity.User;

import java.util.HashMap;
import java.util.List;

/**
 * 自定义mapper
 */

public interface CustomMapper {

    List<OrderCustom> findOrdersByUserId(int userId);

    List<OrderCustom> findOrdersByStoreId(int storeId);

    List<Role> findRolesByUserId(int userId);

    List<Privilege> findPrivilegesByRoleId(int roleId);

    List<User> findBusinesses(int roleId);

    List<OrderCustom> findOrdersByStoreIdandConfirmStatus(HashMap map);
}
