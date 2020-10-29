package com.service;

import com.pojo.Order;

import java.util.List;

public interface OrderService {
    default int insert(Order order) {
        return 0;
    }

    default Order findById(int id) {
        return null;
    }

    default List<Order> findAll(int user_id) {
        return null;
    }

    default int update(Order order) {
        return 0;
    }

    default int deleteById(int id) {
        return 0;
    }

    default long countALL() {
        return 0;
    }


}
