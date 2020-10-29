package com.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reply {
    private int id;
    private int comment_id;
    private int replyor_id;
    private String content;
    private Date time;
    private int focus;
    //状态：0 ，正常，1：被举报，2.不可见
    private int statue;
    private User user;
    private String timeForm;


}
