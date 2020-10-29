package com.dao;

import com.pojo.Order;

import java.util.List;

public interface OrderMapper {
    public int insert(Order order);
    public Order findById(int id);
    public List<Order> findAll(int user_id);
    public int update(Order order);
    public int deleteById(int id);
    public long countALL();

}
