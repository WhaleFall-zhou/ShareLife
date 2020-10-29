package com.service.impl;

import com.dao.OrderMapper;
import com.pojo.Order;
import com.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public int deleteById(int id) {
        return orderMapper.deleteById(id);
    }

    @Override
    public Order findById(int id) {
        return orderMapper.findById(id);
    }

    @Override
    public int insert(Order order) {
        return orderMapper.insert(order);
    }

    @Override
    public int update(Order order) {
        return orderMapper.update(order);
    }

    @Override
    public List<Order> findAll(int user_id) {
        return orderMapper.findAll(user_id);
    }

    @Override
    public long countALL() {
        return orderMapper.countALL();
    }
}
