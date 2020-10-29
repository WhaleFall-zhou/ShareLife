package com.dao;

import com.pojo.Chat;

import java.util.List;

public interface ChatMapper {
    public int insert(Chat chat);
    public Chat findById(int id);
    public List<Chat> findAll(int id);
    public int update(Chat chat);
    public int deleteById(int id);
}
