package com.service.impl;

import com.dao.GoodsMapper;
import com.github.pagehelper.PageHelper;
import com.pojo.Goods;
import com.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public Goods findById(int id) {
        return goodsMapper.findById(id);
    }

    @Override
    public int deleteById(int id) {
        return goodsMapper.deleteById(id);
    }

    @Override
    public int insert(Goods goods) {
        return goodsMapper.insert(goods);
    }

    @Override
    public int update(Goods goods) {
        return goodsMapper.update(goods);
    }

    @Override
    public List<Goods> findAll(Integer pn, Integer pagesize) {
        PageHelper.startPage(pn,pagesize);
        return goodsMapper.findAll();
    }

    @Override
    public List<Goods> showAll() {
        return goodsMapper.findAll();
    }

    @Override
    public List<Goods> findByName(String goods_name) {
        return goodsMapper.findByName(goods_name);
    }
}
