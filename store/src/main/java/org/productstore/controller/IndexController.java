package org.productstore.controller;


import com.github.pagehelper.PageInfo;
import org.productstore.crawl.WriteToMysql;
import org.productstore.model.entity.Store;
import org.productstore.model.service.IProductCateService;
import org.productstore.model.service.IProductInfoService;
import org.productstore.crawl.URLEntity;
import org.productstore.model.entity.ProductCategory;
import org.productstore.model.entity.ProductInfo;
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.productstore.model.service.IStoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import java.util.Random;

@Controller
public class IndexController {

    @Autowired
    private IProductInfoService productInfoService;

    @Autowired
    private IProductCateService cateService;

    @Autowired
    private IStoreService storeService;

    @Autowired
    private WriteToMysql writeToMysql;

    @Value("${product.category}")
    private String PRODUCT_CATEGORY;

    private List<ProductCategory> categoryList;


    /**
     * 第一次访问首页首页
     *
     * @return
     */
    @RequestMapping({"", "/", "/index"})
    public String index( @RequestParam(defaultValue = "1", required = false) int page,
                         @RequestParam(defaultValue = "15", required = false) int pageSize,Model model) {

        //获得商品列表
        PageInfo<ProductInfo> productPageInfo = productInfoService.findAllProductList(page, pageSize);

        model.addAttribute("productPageInfo", productPageInfo);

        //获得店铺列表
        List<Store> stores = storeService.findStores();
        model.addAttribute("stores", stores);

        return "index";
    }


    /**
     * 点击首页导航栏分类后来到这个handler
     *
     * @param cateId
     * @param model
     * @return
     */
    @RequestMapping("/index/category/{cateId}")
    public String bookListByCategoryId(@PathVariable("cateId") int cateId, Model model) {


        List<ProductInfo> productInfos = productInfoService.findProductListByCateId(cateId, new Random().nextInt(3), 18);
        model.addAttribute("productInfos", productInfos);
        model.addAttribute("cateId", cateId);
        return "index";
    }

    /**
     * 爬取当当网书籍列表数据，并将数据插入到本地mysql数据库中
     *
     * @param url
     * @throws IOException
     * @throws ParseException
     * @throws SQLException
     */
    @PostMapping("/write")
    public void write(String url) throws IOException, ParseException, SQLException {
        HttpClient httpclient = new DefaultHttpClient(); //创建HttpClient
        //先去书籍列表页列表页
        List<ProductInfo> products = URLEntity.URLParse(httpclient, url, PRODUCT_CATEGORY); //通过URLEntity获取实体中的信息
        //mysql_control.executeInsert(books);  //数据库添加数据

        writeToMysql.executeInsert(products);
    }
}
