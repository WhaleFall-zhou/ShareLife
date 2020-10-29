package com.service.impl;

import com.dao.FocusMapper;
import com.pojo.Focus;
import com.service.FocusService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FocusServiceImpl implements FocusService {
    @Autowired
    private FocusMapper focusMapper;

    @Override
    public Focus findByUser_id(int vid,  int user_id,  int type) {
        return focusMapper.findByUser_id(vid, user_id, type);
    }

    @Override
    public int deleteByUer_id(int vid, int user_id, int type) {
        return focusMapper.deleteByUer_id(vid, user_id, type);
    }

    @Override
    public int insert(Focus focus) {
        return focusMapper.insert(focus);
    }

    @Override
    public List<Focus> findByVidAndType(int vid, int type) {
        return focusMapper.findByVidAndType(vid, type);
    }


}
