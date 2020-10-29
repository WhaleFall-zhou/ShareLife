package com.service;

import com.pojo.Reply;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReplyService {
    default int insert(Reply reply) {
        return 0;
    }

    default List<Reply> findBYComment(int comment_id) {
        return null;
    }

    default int update(Reply reply) {
        return 0;
    }

    default int deleteById(int id) {
        return 0;
    }

    default int findFocusNum(@Param("vid") int vid, @Param("type") int type) {
        return 0;
    }

    default Reply findById(int id) {
        return null;
    }
}
