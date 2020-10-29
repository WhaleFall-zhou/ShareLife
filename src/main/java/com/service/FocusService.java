package com.service;

import com.pojo.Focus;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FocusService {
    default int insert(Focus focus) {
        return 0;
    }

    default List<Focus> findByVidAndType(@Param("vid") int vid, @Param("type") int type) {
        return null;
    }

    default int deleteByUer_id(@Param("vid") int vid,@Param("user_id") int user_id,@Param("type") int type) {
        return 0;
    }

    default Focus findByUser_id(@Param("vid") int vid,@Param("user_id") int user_id,@Param("type") int type) {
        return null;
    }


}
