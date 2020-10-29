package com.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int id;
    private String username;
    private String email;
    private String password;
    //用户账号状态 0：正常 1：不可用
    private int statue;
    //账号等级 0：普通用户 1：管理员
    private int degree;
    //用户状态：0：离线 1：在线
    private int is_online;
    private String pic;
}
