package com.dao;


import com.pojo.Label;
import com.pojo.User;
import com.pojo.Work;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface WorkMapper {
    public int insert(Work work);
    public Work findById(int id);
    public int update(Work work);
    public int deleteById(int id);
    public long countALL();
    public List<Label> findLabel();
    public List<Work> findByLabelAndType(@Param("label_id") int label_id, @Param("type") int type);
    //根据分类、点赞最高的前10
    public List<Work> findByDescAndType(@Param("label_id") int label_id,@Param("type") int type);
    public List<Work> findByDesc(int type);
    public long findCommentNum(int id);
    public List<Work> findAllTypeDesc(int type);
    public User findOwner(int id);
    //查点赞数
    public long findFocusNum(@Param("vid") int vid,@Param("type") int type);

    public List<Work> findByTitle(String title);
}
