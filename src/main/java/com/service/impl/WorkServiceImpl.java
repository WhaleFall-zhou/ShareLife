package com.service.impl;

import com.dao.WorkMapper;
import com.github.pagehelper.PageHelper;
import com.pojo.Label;
import com.pojo.User;
import com.pojo.Work;
import com.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class WorkServiceImpl implements WorkService {
    @Autowired
    private WorkMapper workMapper;

    @Override
    public long countALL() {
        return workMapper.countALL();
    }

    @Override
    public int deleteById(int id) {
        return workMapper.deleteById(id);
    }

    @Override
    public Work findById(int id) {
        return workMapper.findById(id);
    }

    @Override
    public int insert(Work work) {
        return workMapper.insert(work);
    }

    @Override
    public int update(Work work) {
        return workMapper.update(work);
    }

    @Override
    public List<Label> findAllLabel() {
        return workMapper.findLabel();
    }

    @Override
    public List<Work> findByLabelAndType(int label_id, int type) {
        return workMapper.findByLabelAndType(label_id,type);
    }

    @Override
    public List<Work> findByDescAndType(int label_id,int type) {
        return workMapper.findByDescAndType(label_id,type);
    }

    @Override
    public List<Work> findByDesc(int type) {
        return workMapper.findByDesc(type);
    }

    @Override
    public long findCommentNum(int vid) {
        return workMapper.findCommentNum(vid);
    }

    @Override
    public List<Work> findAllTypeDesc(int type) {
        return workMapper.findAllTypeDesc(type);
    }

    @Override
    public User findOwner(int id) {
        return workMapper.findOwner(id);
    }

    @Override
    public int findFocusNum(int vid,int type) {
        return (int)workMapper.findFocusNum(vid,type);
    }

    @Override
    public List<Work> findByTitle(String title) {
        return workMapper.findByTitle(title);
    }
}
