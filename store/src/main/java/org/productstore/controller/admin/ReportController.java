package org.productstore.controller.admin;

import org.productstore.common.pojo.Bar;
import org.productstore.model.entity.Store;
import org.productstore.model.service.IProductInfoService;
import org.productstore.common.pojo.Pie;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/admin/report")
@RequiresPermissions("store-manage")
public class ReportController {

    @Autowired
    private IProductInfoService productInfoService;

    /**
     * 商店书籍访问量排行饼图
     * @return
     */
    @RequestMapping("/views/pie")
    public List<Pie> getBookViewsPieJson(HttpSession session){
        Store loginStore = (Store) session.getAttribute("loginStore");
        if(loginStore == null){
            return new ArrayList<>();
        }
        return productInfoService.getProductViewsPiesByStoreId(loginStore.getStoreId());
    }

    @RequestMapping("/sales/bar")
    public Bar getBookSalesBarJson(HttpSession session){
        Store loginStore = (Store) session.getAttribute("loginStore");
        if(loginStore == null){
            return null;
        }
        return productInfoService.getProductSalesBarJson(loginStore.getStoreId());
    }


}
