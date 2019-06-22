package org.productstore.controller;

import org.productstore.model.service.IProductInfoService;
import org.productstore.common.pojo.BSResult;
import org.productstore.model.entity.custom.Cart;
import org.productstore.model.entity.ProductInfo;
import org.productstore.model.service.ICartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private IProductInfoService productInfoService;

    @Autowired
    private ICartService cartService;

    //返回购物差页面
    @GetMapping("/items")
    public String showCart() {
        return "cart";
    }

    /**
     * 加入购物车
     *
     * @param productId
     * @param request
     * @return
     */
    @RequestMapping("/addition")
    public String addToCart(@RequestParam(value = "productId",defaultValue = "0") int productId,
                            @RequestParam(required = false,defaultValue = "0") int buyNum,
                            HttpServletRequest request) {

        Cart cart = (Cart) request.getSession().getAttribute("cart");
        //根据要加入购物车的bookId查询bookInfo
        ProductInfo productInfo = productInfoService.queryProductAvailable(productId);

        if (productInfo != null) {
            //这本书在数据库里
            BSResult bsResult = cartService.addToCart(productInfo, cart, buyNum);
            request.getSession().setAttribute("cart", bsResult.getData());
            request.setAttribute("productInfo", productInfo);
        } else {
            //数据库里没有这本书,或库存不足
            request.setAttribute("productInfo", null);
        }
        return "addcart";
    }

    @GetMapping("/clear")
    public String clearCart(HttpServletRequest request) {
        cartService.clearCart(request,"cart");
        return "cart";
    }

    @GetMapping("/deletion/{productId}")
    public String deleteCartItem(@PathVariable("productId") int productId,HttpServletRequest request){
        cartService.deleteCartItem(productId, request);
        return "redirect:/cart/items";
    }

    /**
     * 更新某个购物车项的购买数量
     * @param productId
     * @param newNum
     * @param request
     * @return
     */
    @PostMapping("/buy/num/update")
    @ResponseBody
    public BSResult updateBuyNum(int productId, int newNum, HttpServletRequest request){
        return cartService.updateBuyNum(productId, newNum, request);
    }

    @PostMapping("/checkOne")
    @ResponseBody
    public BSResult checkACartItem(int bookId,HttpServletRequest request){
        Cart cart = (Cart)request.getSession().getAttribute("cart");
        return cartService.checkedOrNot(cart, bookId);
    }
}
