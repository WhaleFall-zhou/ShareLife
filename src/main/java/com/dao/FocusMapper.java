package com.dao;

import com.pojo.Focus;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FocusMapper {
    public int insert(Focus focus);
    public List<Focus> findByVidAndType(@Param("vid") int vid,@Param("type") int type);
    public int deleteByUer_id(@Param("vid") int vid,@Param("user_id") int user_id,@Param("type") int type);
    public Focus findByUser_id(@Param("vid") int vid,@Param("user_id") int user_id,@Param("type") int type);

}
