package com.controller;

import com.pojo.*;
import com.service.CommentService;
import com.service.FocusService;
import com.service.ReplyService;
import com.service.WorkService;
import com.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class FocusController {
    @Autowired
    private FocusService focusService;
    @Autowired
    private WorkService workService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private ReplyService replyService;
    @RequestMapping("/click")
    @ResponseBody
    public Msg click(int vid, int type, HttpSession session){
        User user = (User) session.getAttribute("user");
        Focus focus = focusService.findByUser_id(vid,user.getId(),type);

        if(focus==null){
            Focus focus1 = new Focus();
            focus1.setType(type);
            focus1.setUser_id(user.getId());
            focus1.setVid(vid);
            focusService.insert(focus1);
            int focusNum=0;
            if(type==1){
                Work work = workService.findById(vid);
                focusNum= workService.findFocusNum(work.getId(),type);
                work.setFocus(focusNum);
                workService.update(work);
            }else if(type==2){
                Comment comment=commentService.findById(vid);
                focusNum=commentService.findFocusNum(comment.getId(),type);
                comment.setFocus(focusNum);
                commentService.update(comment);
            }else if(type==3){
                Reply reply=replyService.findById(vid);
                focusNum=replyService.findFocusNum(reply.getId(),type);
                reply.setFocus(focusNum);
                replyService.update(reply);
            }

            return Msg.success().add("num",focusNum);
        }else{
            focusService.deleteByUer_id(vid,user.getId(),type);
            int focusNum=0;
            if(type==1){
                Work work = workService.findById(vid);
                focusNum = workService.findFocusNum(work.getId(),type);
                work.setFocus(focusNum);
                workService.update(work);
            }else if(type==2){
                Comment comment = commentService.findById(vid);
                focusNum = commentService.findFocusNum(comment.getId(),type);
                comment.setFocus(focusNum);
                commentService.update(comment);
            }else if(type==3){
                Reply reply=replyService.findById(vid);
                focusNum=replyService.findFocusNum(reply.getId(),type);
                reply.setFocus(focusNum);
                replyService.update(reply);
            }

            return Msg.fail().add("num",focusNum);
        }



    }
}
