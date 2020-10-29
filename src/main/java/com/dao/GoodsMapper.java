package com.dao;

import com.pojo.Goods;

import java.util.List;

public interface GoodsMapper {
    public int insert(Goods goods);
    public Goods findById(int id);
    public List<Goods> findAll();
    public int update(Goods goods);
    public int deleteById(int id);
    public List<Goods> findByName(String goods_name);
}
