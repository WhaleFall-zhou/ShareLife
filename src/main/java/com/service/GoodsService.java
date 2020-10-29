package com.service;

import com.pojo.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsService {
    default int insert(Goods goods) {
        return 0;
    }

    default Goods findById(int id) {
        return null;
    }

    default List<Goods> findAll(@Param("pn") Integer pn, @Param("pagesize") Integer pagesize) {
        return null;
    }

    default int update(Goods goods) {
        return 0;
    }

    default int deleteById(int id) {
        return 0;
    }

    default List<Goods> showAll() {
        return null;
    }
    default List<Goods> findByName(String goods_name) {
        return null;
    }
}
