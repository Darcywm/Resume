package org.productstore.controller.admin;

import com.github.pagehelper.PageInfo;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.productstore.common.pojo.BSResult;
import org.productstore.common.utils.ExcelSheetSettingEnum;
import org.productstore.model.entity.*;
import org.productstore.model.entity.custom.OrderCustom;
import org.productstore.model.service.IOrderService;
import org.productstore.model.service.IUserService;
import org.productstore.common.utils.BSResultUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.productstore.view.ExcelView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("admin/order")
@RequiresPermissions("order-manage")
public class AdminOrderController {

    @Autowired
    private IOrderService orderService;

    @Autowired
    private IUserService userService;


    @RequestMapping("/list")
    @RequiresPermissions("order-list")
    public String orderList(@RequestParam(value = "page",defaultValue = "1",required = false) int page, HttpServletRequest request){

        Store loginStore = (Store) request.getSession().getAttribute("loginStore");

        PageInfo<OrderCustom> orderCustoms = orderService.findOrdersByCondition(0,5,loginStore.getStoreId());

        request.setAttribute("orderCustoms", orderCustoms);

        return "admin/order/list";
    }

    /**
     * 更新订单
     * @param orderId
     * @return
     */
    @RequestMapping("/toUpdate/{orderId}")
    @RequiresPermissions("order-edit")
    public String updateOrder(@PathVariable("orderId") String orderId, Model model) {

        OrderCustom orderCustom = orderService.findOrderCustomById(orderId);

        User buyer = userService.findById(orderCustom.getOrder().getUserId());
        model.addAttribute("orderCustom", orderCustom);
        model.addAttribute("buyer", buyer);
        return "admin/order/edit";
    }

    @RequestMapping("/download/{orderId}")
    @RequiresPermissions("order-edit")
    public ModelAndView downloadOrder(@PathVariable("orderId") String orderId, Model model) {

        OrderCustom orderCustom = orderService.findOrderCustomById(orderId);

        User buyer = userService.findById(orderCustom.getOrder().getUserId());

        String filename= orderCustom.getOrderShipping().getReceiverName()+"_"+orderId;

        String [] sheetNames={"订单详情"};

        String[] titles={buyer.getUsername()};

        String[][] headers =new String[][]{
                {"序号", "商品编号","商品名称", "单价", "数量","总价"}
        };

        //List sheet = null;
        List<List<String>> sheet = new ArrayList<>();
        List<String>  array2 = new ArrayList<>();

        for(int i=0;i<orderCustom.getOrderDetails().size();i++) {
            OrderDetail orderDetail =orderCustom.getOrderDetails().get(i);
            String[] array ={String.valueOf(i+1),
                    orderDetail.getProductName() ,
                    orderDetail.getProductNum() ,
                    String.valueOf(orderDetail.getUnitPrice()),
                    String.valueOf(orderDetail.getMount()),
                    String.valueOf(orderDetail.getTotalPrice())
            };
            sheet.add(Arrays.asList(array));
        }
        //sheet = new ArrayList(list);

        List<List<List<String>>> sheets = Arrays.asList(sheet);

        Map<String, Object> map = new HashMap<>();
        map.put("ExcelSheetSetting", new ExcelSheetSettingEnum("download",filename,sheetNames,titles,headers));
        map.put("data", sheets);
        map.put("total", orderCustom.getOrder().getPayment());
        map.put("receiverName",orderCustom.getOrderShipping().getReceiverName());
        map.put("receiverMobile",orderCustom.getOrderShipping().getReceiverMobile());
        map.put("receiverAddr",orderCustom.getOrderShipping().getReceiverAddress());

        ExcelView excelView = new ExcelView();
        return new ModelAndView(excelView, map);


        //model.addAttribute("orderCustom", orderCustom);
       // model.addAttribute("buyer", buyer);
       // return "admin/order/edit";
    }

    @RequestMapping("/update")
    @RequiresPermissions("order-edit")
    public String updateOrder(Orders order, OrderShipping orderShipping, Model model) {

        OrderCustom orderCustom = new OrderCustom();
        orderCustom.setOrder(order);
        orderCustom.setOrderShipping(orderShipping);
        orderService.updateOrder(orderCustom);
        model.addAttribute("saveMsg", "保存成功");
        return "forward:toUpdate/"+order.getOrderId();
    }

    @RequestMapping("/deletion/{orderId}")
    @RequiresPermissions("order-delete")
    public String deletion(@PathVariable("orderId") String orderId) {

        BSResult bsResult = orderService.deleteOrder(orderId);

        if (bsResult.getCode() == 200) {
            return "redirect:/admin/order/list";
        }
        return "exception";
    }

    /**
     * 发货
     * @param orderId
     * @return
     */
    @RequiresPermissions("order-edit")
    @RequestMapping("/confirm/{orderId}")
    public String postOrder(@PathVariable("orderId") String orderId){
        BSResult bsResult =  orderService.postOrder(orderId);
        if (bsResult.getCode() == 200) {
            return "redirect:/admin/order/list";
        }
        return "exception";
    }

    /**
     * 查看买家信息
     * @param userId
     * @param model
     * @return
     */
    @RequestMapping("/buyer/{userId}")
    @ResponseBody
    @RequiresPermissions("order-list")
    public BSResult buyerInfo(@PathVariable("userId") Integer userId,Model model){
        User buyer = userService.findById(userId);
        return BSResultUtil.success(buyer);
    }
}
