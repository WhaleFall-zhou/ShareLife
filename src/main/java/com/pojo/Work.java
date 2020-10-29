package com.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Work {
    private int id;
    private int user_id;
    private String title;
    private String cover_pic;
    private String content;
    private Date time;
    private int statue;
    private int type;
    private int label_id;
    private int focus;
    private String introduction;

    private User user;
    private int commentNum;
    private String timeForm;

}
