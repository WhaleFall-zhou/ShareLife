package com.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    private int id;
    private User user;
    //购买的产品
    private Goods goods;
    //数量
    private int number;
    //订单时间
    private Date time;
    //1:未付款 2:已付款 4:已完成
    private int status;
    //总价钱
    private float total;
    //假删除 0：用户可见 1：用户不可见
    private int degree;
    //支付方式 1：支付宝 2：微信
    private int paytype;
    private int user_id;
    private int good_id;

    private String phone;
    private  String name;

    private String timeForm;
}
