package org.productstore.model.service;

import org.productstore.common.pojo.ZTreeNode;
import org.productstore.common.pojo.BSResult;
import org.productstore.model.entity.Privilege;

import java.util.List;

public interface IPrivilegeService {


    List<ZTreeNode> getZTreeNodes();

    BSResult findById(int privId);

    BSResult updatePrivilege(Privilege privilege);

    BSResult addPrivilege(Privilege privilege);

    BSResult deleteById(int privId);

    List<ZTreeNode> getRolePrivileges(int roleId);
}
