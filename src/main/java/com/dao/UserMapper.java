package com.dao;

import com.pojo.User;
import com.pojo.Work;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    public int insertUser(User user);
    public int update(User user);
    public List<User> findAll();
    public User findById(int id);
    public int deleteById(int id);
    public User findByUsernameAndPassword(@Param("username") String username, @Param("password") String password);
    public String isExitUserName(String username);
    public long countALL();
    public List<Work> findAllWork(int user_id);
}
