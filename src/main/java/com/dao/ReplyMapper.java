package com.dao;


import com.pojo.Reply;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReplyMapper {
    public int insert(Reply reply);
    public Reply findById(int id);
    public List<Reply> findBYComment(int comment_id);
    public int update(Reply reply);
    public int deleteById(int id);
    public long findFocusNum(@Param("vid") int vid, @Param("type") int type);
}
