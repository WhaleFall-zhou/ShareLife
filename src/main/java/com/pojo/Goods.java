package com.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Goods {
    private int id;
    private String goods_name;
    private String details;
    private float price;
    private int stock;
    private String pic;
    private String date;
}
