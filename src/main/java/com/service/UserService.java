package com.service;

import com.pojo.User;
import com.pojo.Work;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    default User findById(int id){ return null; }
    default int insertUser(User user){return 0;}

    default User findByUsernameAndPassword(@Param("username") String username, @Param("password") String password) {
        return null;
    }

    default int deleteById(int id) {
        return 0;
    }

    default int update(User user) {
        return 0;
    }

    default List<User> findAll(@Param("pn") Integer pn,@Param("pagesize") Integer pagesize) {
        return null;
    }

    default boolean isExitUserName(String username) {
        return false;
    }

    default long countALL() {
        return 0;
    }
    default List<Work> findAllWork(@Param("pn") Integer pn, @Param("pagesize") Integer pagesizeint, Integer user_id) {
        return null;
    }
}
