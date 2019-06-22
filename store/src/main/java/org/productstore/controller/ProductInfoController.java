package org.productstore.controller;


import com.github.pagehelper.PageInfo;
import org.productstore.exception.BSException;
import org.productstore.model.dao.ProductDescMapper;
import org.productstore.model.entity.ProductDesc;
import org.productstore.model.entity.ProductInfo;
import org.productstore.model.service.IProductInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductInfoController {



    @Autowired
    private IProductInfoService productInfoService;

    @Autowired
    private ProductDescMapper productDescMapper;

    /**
     * 查询某一本书籍详情
     *
     * @param productId
     * @param model
     * @return
     */
    @RequestMapping("/info/{productId}")
    public String productInfo(@PathVariable("productId") Integer productId, Model model) throws BSException {
        //查询书籍
        ProductInfo productInfo = productInfoService.findById(productId);
        //查询书籍推荐列表
        List<ProductInfo> recommendBookList = productInfoService.findProductListByCateId(productInfo.getProductId(), 1, 5);
        //查询书籍详情
        ProductDesc productDesc = productDescMapper.selectByPrimaryKey(productId);
        //增加访问量
        productInfoService.addLookMount(productInfo);
        Collections.shuffle(recommendBookList);
        model.addAttribute("productInfo", productInfo);
        model.addAttribute("productDesc", productDesc);
        model.addAttribute("recommendBookList", recommendBookList);
        return "book_info";
    }


    /**
     * 通过关键字和书籍分类搜索书籍列表
     *
     * @param keywords
     * @return
     */
    @RequestMapping("/list")
    public String bookSearchList(@RequestParam(defaultValue = "", required = false) String keywords,
                                 @RequestParam(defaultValue = "0", required = false) int cateId,//分类Id，默认为0，即不按照分类Id查
                                 @RequestParam(defaultValue = "0", required = false) int storeId,
                                 @RequestParam(defaultValue = "1", required = false) int page,
                                 @RequestParam(defaultValue = "6", required = false) int pageSize,
                                 Model model) {
        keywords = keywords.trim();
        PageInfo<ProductInfo> productPageInfo = productInfoService.findProductListByCondition(keywords, cateId, page, pageSize,storeId);//storeId为0，不按照商店Id查询

        model.addAttribute("productPageInfo", productPageInfo);

        model.addAttribute("keywords", keywords);

        model.addAttribute("cateId", cateId);

        model.addAttribute("storeId", storeId);

        return "book_list";
    }

}
