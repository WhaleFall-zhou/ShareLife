package com.dao;

import com.pojo.Comment;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

public interface CommentMapper {
    public int insert(Comment comment);
    public Comment findById(int id);
    public List<Comment> findAll(int id);
    public int update(Comment comment);
    public int deleteById(int id);
    public List<Comment> findByVid(int vid);
    public long findFocusNum(@Param("vid") int vid,@Param("type") int type);
}
