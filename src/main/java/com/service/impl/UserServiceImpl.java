package com.service.impl;

import com.dao.UserMapper;
import com.github.pagehelper.PageHelper;
import com.pojo.User;
import com.pojo.Work;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public User findByUsernameAndPassword(String username, String password) {
        return userMapper.findByUsernameAndPassword(username, password);
    }

    @Override
    public int insertUser(User user) {
        return userMapper.insertUser(user);
    }


    public User findById(int id) {
        return userMapper.findById(id);
    }

    @Override
    public boolean isExitUserName(String username) {
        String userName = userMapper.isExitUserName(username);
        if(userName.length()>0){
            return true;
        }
        return false;
    }

    @Override
    public int deleteById(int id) {
        return userMapper.deleteById(id);
    }

    @Override
    public int update(User user) {
        return userMapper.update(user);
    }

    @Override
    public List<User> findAll(Integer pn, Integer pagesize) {
        PageHelper.startPage(pn,pagesize);
        return userMapper.findAll();
    }

    @Override
    public long countALL() {
        return userMapper.countALL();
    }
    @Override
    public List<Work> findAllWork(Integer pn, Integer pagesizeint, Integer user_id) {
        PageHelper.startPage(pn,pagesizeint);
        return userMapper.findAllWork(user_id);
    }
}
