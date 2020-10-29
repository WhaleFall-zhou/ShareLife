package com.controller;


import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeAppMergePayRequest;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.config.AlipayConfig;
import com.pojo.Goods;
import com.pojo.Order;
import com.pojo.User;
import com.service.GoodsService;
import com.service.OrderService;
import com.util.Msg;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private GoodsService goodsService;
    @RequestMapping("/ailpay")
    public void alipay(HttpSession session, HttpServletResponse response, String name, String phone, HttpServletRequest request) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        Order order =(Order) session.getAttribute("order");

        order.setUser_id(order.getUser().getId());
        order.setGood_id(order.getGoods().getId());
        order.setTime(new Date());
        order.setPaytype(1);
        order.setStatus(2);
        Goods goods = goodsService.findById(order.getGood_id());
        goods.setStock(goods.getStock()-order.getNumber());
        goodsService.update(goods);
        order.setName(name);
        order.setPhone(phone);
        session.removeAttribute("order");
        int v = (int)(Math.random() * 1000 + 1);

        AlipayClient alipayClient=new DefaultAlipayClient(AlipayConfig.URL,AlipayConfig.APPID,AlipayConfig.RSA_PRIVATE_KEY,AlipayConfig.FORMAT,AlipayConfig.CHARSET,AlipayConfig.ALIPAY_PUBLIC_KEY,AlipayConfig.SIGNTYPE);
        //创建API对应的request
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        //在公共参数中设置回跳和通知地址
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
        //填充业务参数

        //必填
        //商户订单号，需保证在商户端不重复
        String out_trade_no =String.valueOf(v);
        order.setId(v);
        //销售产品码，与支付宝签约的产品码名称。目前仅支持FAST_INSTANT_TRADE_PAY
        String product_code = "FAST_INSTANT_TRADE_PAY";
        //订单总金额，单位为元，精确到小数点后两位，取值范围[0.01,100000000]。
        String total_amount = String.valueOf(order.getTotal());
        //订单标题
        String subject = "支付宝付款";

        //选填
        //商品描述，可空
        String body = "商品描述";

        alipayRequest.setBizContent("{" +
                "\"out_trade_no\":\"" + out_trade_no + "\"," +
                "\"product_code\":\"" + product_code + "\"," +
                "\"total_amount\":\"" + total_amount + "\"," +
                "\"subject\":\"" + subject + "\"," +
                "\"body\":\"" + body + "\"}" );
        //请求
        String form = "";
        try {
            form = alipayClient.pageExecute(alipayRequest).getBody();//调用SDK生成表单

        } catch (AlipayApiException e) {
            e.printStackTrace();
            response.getWriter().write("捕获异常出错");
            response.getWriter().flush();
            response.getWriter().close();
        }
        response.setContentType("text/html;charset=" + AlipayConfig.CHARSET);
        response.getWriter().write(form);//直接将完整的表单html输出到页面
        response.getWriter().flush();
        response.getWriter().close();
        orderService.insert(order);

    }
    @RequestMapping("/weChat")
    public void weChat(HttpSession session, HttpServletResponse response, String name, String phone, HttpServletRequest request) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        Order order =(Order) session.getAttribute("order");
        order.setPhone(phone);
        order.setName(name);
        session.removeAttribute("order");
        order.setId(0);
        order.setUser_id(order.getUser().getId());
        order.setGood_id(order.getGoods().getId());
        order.setTime(new Date());
        order.setPaytype(2);
        order.setStatus(2);
        orderService.insert(order);

    }
    @RequestMapping("/AllOrder")
    public ModelAndView getAll(HttpSession session){
        User user =(User) session.getAttribute("user");
        List<Order> orderList = orderService.findAll(user.getId());
        SimpleDateFormat format = new SimpleDateFormat();
        for(Order temp:orderList){
            Goods goods = goodsService.findById(temp.getGood_id());
            temp.setGoods(goods);
            temp.setTimeForm(format.format(temp.getTime()));
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("orderList",orderList);
        modelAndView.setViewName("orderlist");
        return modelAndView;
    }
    @RequestMapping(value = "/orderComfirm",method = RequestMethod.POST)
    @ResponseBody
    public Msg comfirm(String id,String status){
        Order order = orderService.findById(Integer.parseInt(id));
        order.setStatus(Integer.parseInt(status));
        System.out.println(order);
        int update = orderService.update(order);
        if(update>0){
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

}
