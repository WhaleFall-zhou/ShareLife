package com.service;

import com.pojo.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentService {
    default List<Comment> findByVid(int vid) {
        return null;
    }

    default int update(Comment comment) {
        return 0;
    }

    default int insert(Comment comment) {
        return 0;
    }

    default Comment findById(int id) {
        return null;
    }

    default int findFocusNum(@Param("vid") int vid,@Param("type") int type) {
        return 0;
    }
}
