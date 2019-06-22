package org.productstore;

import org.productstore.model.dao.UserMapper;
import org.productstore.model.dao.custom.CustomMapper;
import org.productstore.model.entity.Privilege;
import org.productstore.model.entity.Role;
import org.productstore.model.service.IUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ProductstoreApplicationTests {

    @Autowired
    private CustomMapper customMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private IUserService userService;

    @Value("${return_url}")
    String a;
    @Test
    public void contextLoads() {
        System.out.println("---------------------");
        System.out.println(customMapper);
        System.out.println(a);
        List<Role> rolesByUserId = customMapper.findRolesByUserId(1);
        List<Privilege> privilegeByRoleId = customMapper.findPrivilegesByRoleId(1);
        System.out.println();
        //List<OrderCustom> ordersByUserId = customMapper.findOrdersById(1);
    }



}
