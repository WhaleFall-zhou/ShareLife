package com.service.impl;

import com.dao.ReplyMapper;
import com.pojo.Reply;
import com.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService {
    @Autowired
    private ReplyMapper replyMapper;
    @Override
    public int deleteById(int id) {
        return replyMapper.deleteById(id);
    }

    @Override
    public int insert(Reply reply) {
        return replyMapper.insert(reply);
    }

    @Override
    public int update(Reply reply) {
        return replyMapper.update(reply);
    }

    @Override
    public List<Reply> findBYComment(int comment_id) {
        return replyMapper.findBYComment(comment_id);
    }

    @Override
    public int findFocusNum(int vid, int type) {
        return(int) replyMapper.findFocusNum(vid,type);
    }

    @Override
    public Reply findById(int id) {
        return replyMapper.findById(id);
    }
}
