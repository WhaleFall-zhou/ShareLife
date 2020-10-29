package com.service.impl;

import com.dao.CommentMapper;
import com.pojo.Comment;
import com.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentMapper commentMapper;

    @Override
    public int insert(Comment comment) {
        return commentMapper.insert(comment);
    }

    @Override
    public int update(Comment comment) {
        return commentMapper.update(comment);
    }

    @Override
    public List<Comment> findByVid(int vid) {
        return commentMapper.findByVid(vid);
    }

    @Override
    public Comment findById(int id) {
        return commentMapper.findById(id);
    }

    @Override
    public int findFocusNum(int vid, int type) {
        return (int)commentMapper.findFocusNum(vid, type);
    }
}
