package com.dao;

import com.pojo.Appeal;
import com.pojo.User;

import java.util.List;

public interface AppealMapper {
    public int insert(Appeal appeal);
    public Appeal findById(int id);
    public List<Appeal> findAll(int id);
    public int update(Appeal appeal);
    public int deleteById(int id);
}
