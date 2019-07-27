package org.productstore.controller;

import org.productstore.model.entity.Orders;
import org.productstore.model.entity.Store;
import org.productstore.model.service.IOrderDetailService;
import org.productstore.model.service.IOrderService;
import org.productstore.model.service.IStoreService;
import org.productstore.common.pojo.BSResult;
import org.productstore.model.entity.ProductInfo;
import org.productstore.pay.PayContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/payment")
public class PayController {

    @Autowired
    private IOrderService orderService;

    @Autowired
    private IOrderDetailService orderDetailService;

    @Autowired
    private IStoreService storeService;

    @RequestMapping("/{orderId}")
    public String paymentPage(@PathVariable("orderId") String orderId, HttpServletResponse response, Model model){


        BSResult bsResult = orderService.findOrderById(orderId);
        Orders order = ((List<Orders>)bsResult.getData()).get(0);
        List<ProductInfo> products = orderDetailService.findProductsByOrderId(order.getOrderId());
        Store store = storeService.findById(order.getStoreId());

        /*PayContext payContext = new PayContext();
        payContext.setResponse(response);
        payContext.setOrders(order);
        payContext.setProductInfos(products);*/

        /*
        try {
            alipay.pay(payContext);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("exception", "支付出错了!");
            return "exception";
        }
        return "pay_success";
        */
        model.addAttribute("order", order);
        model.addAttribute("store", store);
        return "saoma";
    }

    @RequestMapping("ok/{orderId}")
    public String paymentOk(@PathVariable("orderId") String orderId, HttpServletResponse response, Model model){

        BSResult bsResult = orderService.findOrderById(orderId);
        Orders order = ((List<Orders>)bsResult.getData()).get(0);
        order.setStatus(1);
        List<ProductInfo> products = orderDetailService.findProductsByOrderId(order.getOrderId());

        PayContext payContext = new PayContext();
        payContext.setResponse(response);
        payContext.setOrders(order);
        payContext.setProductInfos(products);

        orderService.updateOrderAfterPay(payContext);
        return "redirect:/order/list";
    }

    @RequestMapping("/return")
    public String returnUrl(String out_trade_no,String total_amount,String body,
                            Model model){

        model.addAttribute("body", body);
        model.addAttribute("total_amount", total_amount);


        BSResult bsResult = orderService.findOrderById(out_trade_no);
        Orders order = (Orders)bsResult.getData();

        List<ProductInfo> books = orderDetailService.findProductsByOrderId(order.getOrderId());

        PayContext payContext = new PayContext();
        payContext.setOrders(order);
        payContext.setProductInfos(books);

        orderService.updateOrderAfterPay(payContext);


        return "pay_success";
    }

    @RequestMapping("/notify")
    public void notifyUrl(){

        System.out.println("notify--------------------------");



    }

}
