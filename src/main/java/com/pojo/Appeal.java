package com.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Appeal {
    private int id;
    private User user;
    //被申诉内容的id
    private int appealed_id;
    //被举报的类型/申诉类型 1：视频 2：文章 3：评论
    private int type;
    //申诉/举报的受理状态 0：受理中 1：受理通过 2：受理驳回
    private int status;
    private String content;
}
