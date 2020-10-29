package com.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
    private int id;
    private int commentor_id;
    private int vid;
    private String content;
    private Date time;
    private int focus;
    private int statue;
    private User user;

    private String timeForm;
    private List<Reply> replyList;
}
