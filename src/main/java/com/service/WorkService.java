package com.service;

import com.pojo.Label;
import com.pojo.User;
import com.pojo.Work;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface WorkService {
    default int insert(Work work) {
        return 0;
    }

    default Work findById(int id) {
        return null;
    }

    default int update(Work work) {
        return 0;
    }

    default int deleteById(int id) {
        return 0;
    }

    default long countALL() {
        return 0;
    }
    default List<Label> findAllLabel() {
        return null;
    }

    default List<Work> findByLabelAndType(@Param("label_id") int label_id,@Param("type") int type) {
        return null;
    }

    default List<Work> findByDescAndType(@Param("label_id") int label_id,@Param("type") int type) {
        return null;
    }

    default List<Work> findByDesc(int type) {
        return null;
    }

    default long findCommentNum(int vid) {
        return 0;
    }

    default List<Work> findAllTypeDesc(int type) {
        return null;
    }

    default User findOwner(int id) {
        return null;
    }

    default int findFocusNum(@Param("vid") int vid,@Param("type") int type) {
        return 0;
    }

    default List<Work> findByTitle(String title) {
        return null;
    }
}
