package org.productstore.controller.admin;

import org.apache.commons.lang.StringUtils;
import org.productstore.common.utils.IDUtils;
import org.productstore.model.entity.ProductInfo;
import org.productstore.model.entity.Store;
import org.productstore.model.entity.User;
import org.productstore.model.service.IStoreService;
import org.productstore.model.service.IUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/admin/store")
@RequiresPermissions("store-manage")
public class StoreController {

    @Value("${image.url.prefix}")
    private String urlPrefix;

    @Autowired
    private IStoreService storeService;

    @Autowired
    private IUserService userService;

    @Value("${business.role-id}")
    private String business;

    @RequestMapping("/list")
    @RequiresPermissions("store-list")
    public String storeList(Model model){

        List<Store> stores = storeService.findStores();

        model.addAttribute("stores", stores);

        return "admin/store/list";
    }

    @GetMapping("/toAddition")
    @RequiresPermissions("store-add")
    public String addStore(Model model){
        List<User> users = userService.findBusinesses(Integer.parseInt(business));
        model.addAttribute("users", users);
        return "admin/store/add";
    }


    @RequestMapping("/{storeId}")
    @RequiresPermissions("store-edit")
    public String toEdit(@PathVariable("storeId") int storeId, Model model){

        Store store = storeService.findById(storeId);

        model.addAttribute("store", store);

        return "admin/store/edit";
    }

    @RequestMapping("/edit")
    @RequiresPermissions("store-edit")
    public String editStore(Store store, MultipartFile pictureFile,HttpServletRequest request,Model model) throws Exception{
        uploadPicture(store, pictureFile, request);
        storeService.updateStore(store);
        model.addAttribute("saveMsg", "保存成功");
        return "forward:"+store.getStoreId();
    }

    @RequestMapping("/deletion/{storeId}")
    @RequiresPermissions("store-delete")
    public String deleteStore(@PathVariable("storeId") int storeId){
        storeService.deleteStore(storeId);
        return "redirect:/admin/store/list";
    }

    @RequestMapping("/addition")
    @RequiresPermissions("store-add")
    public String addStore(Store store){
        storeService.addStore(store);
        return "redirect:/admin/store/list";
    }

    private void uploadPicture(Store store, MultipartFile pictureFile, HttpServletRequest request) throws IOException {
        if(pictureFile != null){
            if (StringUtils.isNotBlank(pictureFile.getOriginalFilename())) {
                String realPath = request.getSession().getServletContext().getRealPath("/" + urlPrefix + "/store");
                //原始文件名称
                String pictureFileName = pictureFile.getOriginalFilename();
                //新文件名称
                String newFileName = IDUtils.genShortUUID() + pictureFileName.substring(pictureFileName.lastIndexOf("."));

                //上传图片
                File uploadPic = new File(realPath + "/" + newFileName);

                //向磁盘写文件
                pictureFile.transferTo(uploadPic);
                store.setWeixinUrl(urlPrefix + "/store/" + newFileName);
            }
        }
    }

}
