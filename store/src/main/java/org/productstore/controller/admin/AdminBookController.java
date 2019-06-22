package org.productstore.controller.admin;

import com.github.pagehelper.PageInfo;
import org.productstore.exception.BSException;
import org.productstore.model.dao.ProductDescMapper;
import org.productstore.model.entity.ProductDesc;
import org.productstore.model.entity.ProductInfo;
import org.productstore.model.service.IProductInfoService;
import org.productstore.common.utils.IDUtils;
import org.productstore.model.entity.Store;
import org.productstore.model.service.IStoreService;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("/admin/product")
@RequiresPermissions("book-manage")
public class AdminBookController {

    @Autowired
    private IProductInfoService productInfoService;

    @Autowired
    private ProductDescMapper productDescMapper;

    @Autowired
    private IStoreService storeService;

    @Value("${image.url.prefix}")
    private String urlPrefix;

    @RequestMapping("toAddition")
    @RequiresPermissions("book-add")
    public String toAddition(){
        return "admin/product/add";
    }

    @RequestMapping("/addition")
    @RequiresPermissions("book-add")
    public String addBook(ProductInfo productInfo, String productDesc, MultipartFile pictureFile, HttpServletRequest request) throws Exception {

        uploadPicture(productInfo, pictureFile, request);
        productInfoService.saveProduct(productInfo, productDesc);

        return "redirect:/admin/product/list";
    }

    @RequestMapping(value = "/list")
    @RequiresPermissions("book-query")
    public String bookList(@RequestParam(defaultValue = "", required = false) String keywords,
                          @RequestParam(value = "page",defaultValue = "1",required = false) int page,
                          HttpSession session,
                          Model model) {
        keywords = keywords.trim();
        Store store = (Store)session.getAttribute("loginStore");

        if(store != null){
            PageInfo<ProductInfo> products = productInfoService.findProductListByCondition(keywords,0,page,10,store.getStoreId());
            model.addAttribute("productPageInfo", products);
            model.addAttribute("keywords", keywords);
        }else {
            model.addAttribute("exception", "您请求的资源不存在");
            return "exception";
        }

        return "admin/product/list";
    }

    /**
     * 更新页面回显
     * @param productId
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/echo")
    @RequiresPermissions("book-edit")
    public String echo(int productId,Model model) throws BSException {

        ProductInfo productInfo = productInfoService.adminFindById(productId);

        ProductDesc productDesc = productDescMapper.selectByPrimaryKey(productInfo.getProductId());

        model.addAttribute("productInfo", productInfo);

        model.addAttribute("productDesc", productDesc);

        return "admin/product/edit";
    }

    @RequestMapping("/update")
    @RequiresPermissions("book-edit")
    public String updateProduct(ProductInfo productInfo, String bookDesc, String keywords,MultipartFile pictureFile, HttpServletRequest request,RedirectAttributes ra) throws Exception {

        uploadPicture(productInfo, pictureFile, request);
        productInfoService.updateProduct(productInfo, bookDesc);
        ra.addAttribute("keywords", keywords);
        return "redirect:/admin/product/list";
    }

    @RequestMapping("/deletion/{productId}")
    @RequiresPermissions("book-delete")
    public String deletion(@PathVariable("productId") int productId, String keywords, RedirectAttributes ra){
        productInfoService.deleteProduct(productId);
        ra.addAttribute("keywords", keywords);
        return "redirect:/admin/product/list";
    }

    @RequestMapping("/shelf")
    @RequiresPermissions("book-shelf")
    public String productOffShelf(int productId, int isShelf, String keywords,RedirectAttributes ra){

        productInfoService.changeShelfStatus(productId,isShelf);
        ra.addAttribute("keywords", keywords);
        return "redirect:/admin/product/list";
    }

    private void uploadPicture(ProductInfo productInfo, MultipartFile pictureFile, HttpServletRequest request) throws IOException {
        if(pictureFile != null){
            if (StringUtils.isNotBlank(pictureFile.getOriginalFilename())) {
                String realPath = request.getSession().getServletContext().getRealPath("/" + urlPrefix);
                //原始文件名称
                String pictureFileName = pictureFile.getOriginalFilename();
                //新文件名称
                String newFileName = IDUtils.genShortUUID() + pictureFileName.substring(pictureFileName.lastIndexOf("."));

                //上传图片
                File uploadPic = new File(realPath + "/" + newFileName);

                //向磁盘写文件
                pictureFile.transferTo(uploadPic);
                productInfo.setImageUrl(urlPrefix + "/" + newFileName);
            }
        }
    }

}
