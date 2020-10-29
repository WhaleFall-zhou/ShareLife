package com.controller;

import com.github.pagehelper.PageInfo;
import com.pojo.Goods;
import com.pojo.Order;
import com.pojo.User;
import com.service.GoodsService;
import com.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class GoodsController {
    @Autowired
    private GoodsService goodsService;
    @RequestMapping("/goods")
    @ResponseBody
    public ModelAndView getGoods(){
        List<Goods> goods = goodsService.showAll();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("goods",goods);
        modelAndView.setViewName("objectList");
        return modelAndView;
    }
    @RequestMapping("/detail/{id}")
    public ModelAndView objectDetail(@PathVariable("id") Integer id){
        ModelAndView modelAndView = new ModelAndView();
        Goods goods = goodsService.findById(id);
        modelAndView.addObject("goods",goods);
        modelAndView.setViewName("objectDetail");
        return modelAndView;
    }
    @RequestMapping("/order")
    public ModelAndView order(String id, String number, HttpSession session){
        int i = Integer.parseInt(id);
        Goods goods = goodsService.findById(i);
        Order order = new Order();
        User user = (User)session.getAttribute("user");
        order.setUser(user);
        order.setGoods(goods);
        int i1 = Integer.parseInt(number);
        order.setNumber(i1);
        order.setTotal(i1*goods.getPrice());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("order",order);
        modelAndView.setViewName("order");
        session.setAttribute("order",order);
        return modelAndView;
    }
    @RequestMapping("/goodsSearch")
    public ModelAndView search(String goods_name){
        List<Goods> byName = goodsService.findByName(goods_name);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("goods",byName);
        modelAndView.setViewName("orderlist");
        return modelAndView;
    }
}
