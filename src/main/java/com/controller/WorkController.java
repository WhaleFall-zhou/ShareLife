package com.controller;

import com.alibaba.fastjson.JSONObject;
import com.pojo.Label;
import com.pojo.User;
import com.pojo.Work;
import com.service.UserService;
import com.service.WorkService;
import com.util.Mcode;
import com.util.Msg;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller

public class WorkController {
    @Autowired
    private WorkService workService;
    @Autowired
    private UserService userService;
    @RequestMapping("/")
    public String turn(){
        return "forward:/index";
    }
    @RequestMapping("/index")
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView();
        List<Label> labels = workService.findAllLabel();
        List<List<Work>> type1 = new ArrayList<>();
        List<List<Work>> type2 = new ArrayList<>();
        SimpleDateFormat format = new SimpleDateFormat();
        for(Label l:labels){
            List<Work> byLabelAndType = workService.findByLabelAndType(l.getId(), 1);
            for(Work t:byLabelAndType){
               t.setUser(userService.findById(t.getUser_id()));
               t.setTimeForm(format.format(t.getTime()));
            }
            List<Work> byLabelAndType1 = workService.findByLabelAndType(l.getId(), 2);
            for(Work t:byLabelAndType1){
                t.setUser(userService.findById(t.getUser_id()));
                t.setTimeForm(format.format(t.getTime()));
            }
            type1.add(byLabelAndType);
            type2.add(byLabelAndType1);
        }
        modelAndView.addObject("type1",type1);
        modelAndView.addObject("type2",type2);
        modelAndView.addObject("label",labels);
        modelAndView.setViewName("shareindex");
        return modelAndView;
    }
    @RequestMapping("/show")
    public ModelAndView showWork(){
        List<Label> label = workService.findAllLabel();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("label",label);
        modelAndView.setViewName("editor_page");
        return  modelAndView;
    }
    @RequestMapping("/showViedo")
    public ModelAndView showViedo(){
        List<Label> label = workService.findAllLabel();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("label",label);
        modelAndView.setViewName("video_up");
        return  modelAndView;
    }

    @RequestMapping(value = "/artile",method = RequestMethod.POST)
    @ResponseBody
    public Msg artile(Work work,MultipartFile pic, HttpSession session){
        String savePath = "C:\\Users\\lenovo\\IdeaProjects\\ShareLife\\src\\main\\webapp\\resource\\md"; //存储路径
        File file = new File(savePath);
        if(!file.exists()){
            file.mkdirs();
        }

        FileWriter out = null;
        String v=Mcode.verifyCode(8);
        String path="\\demo"+v+".md";
        StringBuffer sb=new StringBuffer(savePath);
        sb.append(path);
        String sPath = sb.toString();
        try {
            out = new FileWriter(sPath);
            out.write(work.getContent());
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
            return Msg.fail();
        }
        String name=pic.getOriginalFilename();
        //获取图片的后缀
        String suffix=name.substring(name.lastIndexOf("."));
        String picName = Mcode.verifyCode(6);
        String fileName="C:\\Users\\lenovo\\IdeaProjects\\ShareLife\\src\\main\\webapp\\resource\\user_pic\\"+picName+suffix;
        System.out.println(work);
        try {
            //开始上传
            pic.transferTo(new File(fileName));
            work.setCover_pic("/resource/user_pic/"+picName+suffix);
            work.setId(0);
            Date date = new Date();
            work.setTime(date);
            User user = (User)session.getAttribute("user");
            work.setUser_id(user.getId());
            work.setType(1);
            work.setContent(sPath);
            System.out.println(work);
            workService.insert(work);
            return Msg.success();
        } catch (IOException e) {
            e.printStackTrace();
            return Msg.fail();
        }
    }
    @ResponseBody
    @RequestMapping(value = "/uploadfile", method = RequestMethod.POST)
    public JSONObject hello(HttpServletRequest request, HttpServletResponse response,
                            @RequestParam(value = "editormd-image-file", required = false) MultipartFile attach) {

        JSONObject jsonObject=new JSONObject();
        try {
            request.setCharacterEncoding("utf-8");
            response.setHeader("Content-Type", "text/html");

            String rootPath = "C:\\Users\\lenovo\\IdeaProjects\\ShareLife\\src\\main\\webapp\\resource\\user_pic\\";

            File realFile = new File(rootPath + attach.getOriginalFilename());
            FileUtils.copyInputStreamToFile(attach.getInputStream(), realFile);
            jsonObject.put("success", 1);
            jsonObject.put("message", "上传成功");
            jsonObject.put("url", "/resource/user_pic/"+attach.getOriginalFilename());
        } catch (Exception e) {
            jsonObject.put("success", 0);
        }
        return jsonObject;
    }
    @RequestMapping("/vedio")
    @ResponseBody
    public Msg vedioUpload(MultipartFile[] files,Work work,HttpSession session) {
        System.out.println(files.length);
        System.out.println(files[0].getOriginalFilename());
        try {
            for(int i=0;i<files.length;i++){
                MultipartFile file=files[i];
                String fileName=file.getOriginalFilename();
                String[] split = fileName.split("\\.");
                //判断是否是图片
                if(!split[1].equalsIgnoreCase("mp4")){
                    String name="C:\\Users\\lenovo\\IdeaProjects\\ShareLife\\src\\main\\webapp\\resource\\user_pic\\"+fileName;
                    System.out.println(name);
                    file.transferTo(new File(name));
                    work.setCover_pic("/resource/user_pic/"+fileName);
                }else{
                    String picName = Mcode.verifyCode(6);
                    String name="C:\\Users\\lenovo\\IdeaProjects\\ShareLife\\src\\main\\webapp\\resource\\video\\"+picName+split[split.length-1];
                    System.out.println(name);
                    file.transferTo(new File(name));
                    work.setContent("/resource/video/"+fileName);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            return Msg.fail();
        }
        work.setId(0);
        User user = (User)session.getAttribute("user");
        work.setUser_id(user.getId());
        work.setType(2);
        Date date = new Date();
        work.setTime(date);
        workService.insert(work);
        return Msg.success();
    }

    @RequestMapping("/home/{type}/{id}")
    public ModelAndView read(@PathVariable("id") Integer id,@PathVariable("type") String type){
        ModelAndView modelAndView = new ModelAndView();
        List<Work> works=new ArrayList<>();
        List<Work> Ranking;
        if(id!=0) {
            if(type.equals("artile")){
                works = workService.findByLabelAndType(id, 1);
                Ranking = workService.findByDescAndType(id, 1);
            }else {
                works=workService.findByLabelAndType(id,2);
                Ranking=workService.findByDescAndType(id,2);
            }
            modelAndView.addObject("works", works);

        }else {
            if(type.equals("artile")) {
                works = workService.findByDesc(1);
                Ranking = workService.findAllTypeDesc(1);
            }else{
                works = workService.findByDesc(2);
                Ranking = workService.findAllTypeDesc(2);
            }
            modelAndView.addObject("works",works);
        }
        int t=0;
        if(type.equals("artile")){
            modelAndView.setViewName("artileTotal");
            t=1;
        }else {
            t=2;
            modelAndView.setViewName("videolist");
        }
        SimpleDateFormat format = new SimpleDateFormat();
        for(Work temp:works){
            int commentNum = (int)workService.findCommentNum(temp.getId());
            User owner = workService.findOwner(temp.getUser_id());
            temp.setUser(owner);
            temp.setCommentNum(commentNum);
            temp.setFocus(workService.findFocusNum(temp.getId(),t));
            temp.setTimeForm(format.format(temp.getTime()));
        }
        modelAndView.addObject("label",id);
        modelAndView.addObject("Ranking", Ranking);

        return modelAndView;
    }
    @RequestMapping("/search")
    public ModelAndView search(String title){
        List<Work> works = workService.findByTitle(title);
        ModelAndView modelAndView = new ModelAndView();
        SimpleDateFormat format = new SimpleDateFormat();
        if(works!=null){
            for(Work temp:works){
                User byId = userService.findById(temp.getUser_id());
                temp.setTimeForm(format.format(temp.getTime()));
                temp.setUser(byId);
            }
            modelAndView.addObject("message","success");
            modelAndView.addObject("work",works);

            modelAndView.setViewName("result");
        }else {
            modelAndView.addObject("message","fail");
        }
        return modelAndView;
    }
}
