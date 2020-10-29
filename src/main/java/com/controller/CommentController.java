package com.controller;

import com.pojo.Comment;
import com.pojo.Reply;
import com.pojo.User;
import com.pojo.Work;
import com.service.CommentService;
import com.service.ReplyService;
import com.service.UserService;
import com.service.WorkService;
import com.util.Msg;
import org.pegdown.PegDownProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;
    @Autowired
    private ReplyService replayService;
    @Autowired
    private WorkService workService;
    @Autowired
    private UserService userService;

    @RequestMapping("/read/{type}/{id}")
    @ResponseBody
    public ModelAndView read(@PathVariable("id") int id,@PathVariable("type")String type, HttpServletResponse response) throws IOException {
        Work work = workService.findById(id);
        ModelAndView modelAndView = new ModelAndView();
        if(type.equals("artile")){
            File file = new File(work.getContent());
            char[] chars = new char[(int) file.length()];
            FileReader fileReader = new FileReader(file);
            String content = null;
            while(fileReader.read(chars)!=-1){
                content = new String(chars);
            }
            PegDownProcessor pdp = new PegDownProcessor(Integer.MAX_VALUE);
            content = pdp.markdownToHtml(content);
            modelAndView.addObject("content",content);
        }

        Date time = work.getTime();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        work.setTimeForm(simpleDateFormat.format(time));
        List<Comment> commentList = commentService.findByVid(id);
        for(Comment temp:commentList){
            List<Reply> replyList = replayService.findBYComment(temp.getId());
            Date time2 = temp.getTime();
            temp.setTimeForm(simpleDateFormat.format(time2));
            for(Reply reply:replyList){
                reply.setUser(userService.findById(reply.getReplyor_id()));
                Date time1 = reply.getTime();
                reply.setTimeForm(simpleDateFormat.format(time1));
            }
            temp.setUser(userService.findById(temp.getCommentor_id()));
            temp.setReplyList(replyList);
        }
        work.setUser(userService.findById(work.getUser_id()));

        modelAndView.addObject("work",work);
        modelAndView.addObject("commentList",commentList);
        if(type.equals("artile")){
            modelAndView.setViewName("artileDetail");
        }else{
            modelAndView.setViewName("videoDetail");
        }

        modelAndView.addObject("label",work.getLabel_id());
        return modelAndView;
    }

    @RequestMapping("/comment/{type}")
    @ResponseBody
    public Msg comment(@PathVariable("type") String type, Integer id, String content , HttpSession session)
    {
        User user = (User)session.getAttribute("user");
        if(type.equals("replay")){
            Reply reply = new Reply();
            reply.setId(0);
            reply.setComment_id(id);
            reply.setReplyor_id(user.getId());
            reply.setContent(content);
            reply.setTime(new Date());
            reply.setFocus(0);
            reply.setStatue(0);
            replayService.insert(reply);
            return Msg.success();
        }else {
            Comment comment = new Comment();
            comment.setId(0);
            comment.setCommentor_id(user.getId());
            comment.setVid(id);
            comment.setContent(content);
            comment.setTime(new Date());
            comment.setFocus(0);
            comment.setStatue(0);
            commentService.insert(comment);
            return Msg.success();
        }
    }
}
