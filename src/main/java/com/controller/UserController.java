package com.controller;

import com.pojo.User;
import com.service.UserService;
import com.util.MailUtil;
import com.util.Mcode;
import com.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import java.util.Properties;


@Controller
public class UserController {
    @Autowired
    private UserService userService;
    //用户登入
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public ModelAndView userLogin(String username, String password, HttpSession session){
        User user = userService.findByUsernameAndPassword(username, password);
        ModelAndView modelAndView = new ModelAndView();
        if(user!=null){
            user.setIs_online(1);
            userService.update(user);
            session.setAttribute("user",user);
            modelAndView.addObject("msg","success");
            modelAndView.setViewName("forward:/index");
        }else {
            modelAndView.addObject("msg","fail");
        }
       return modelAndView;
    }
    //用户注册
    @RequestMapping(value = "/register/{code}")
    @ResponseBody
    public Msg register(User user, @PathVariable("code") String code, HttpSession session){
        String code1 = (String)session.getAttribute("code");
        if(code1.equals(code)){
            int l = (int)userService.countALL();
            user.setId(l+1);
            user.setIs_online(0);
            user.setStatue(0);
            int v = (int)(Math.random() * 9 + 1);
            String path="//resource//user_pic//default_"+v+".jpg";
            user.setPic(path);
            int insertUser = userService.insertUser(user);
            if(insertUser>0){
                return Msg.success();
            }
        }
        return Msg.fail();
    }
    @RequestMapping(value = "/sendCode")
    @ResponseBody
    public Msg sendCode(String email, HttpSession session)  {
        try {
            MailUtil.receiveMailAccount = email; // 给用户输入的邮箱发送邮件

            // 1、创建参数配置，用于连接邮箱服务器的参数配置
            Properties props = new Properties();
            // 开启debug调试
            props.setProperty("mail.debug", "true");
            // 发送服务器需要身份验证
            props.setProperty("mail.smtp.auth", "true");
            // 设置右键服务器的主机名
            props.setProperty("mail.host", MailUtil.emailSMTPHost);
            // 发送邮件协议名称
            props.setProperty("mail.transport.protocol", "smtp");

            // 2、根据配置创建会话对象，用于和邮件服务器交互
            Session session1 = Session.getInstance(props);
            // 设置debug，可以查看详细的发送log
            session1.setDebug(true);
            // 3、创建一封邮件
            String code = Mcode.verifyCode(6);
            System.out.println("邮箱验证码：" + code);
            String html = "Email地址验证<br/>"+
                    "你收到这封邮件是进行新用户注册或者用户修改Email使用这个地址。<br/>"+
                    "账号激活声明<br/>"+
                    "请将下面的验证码输入到提示框即可：<h3 style='color:red;'>" + code + "</h3><br/>";
            MimeMessage message = MailUtil.creatMimeMessage(session1, MailUtil.emailAccount,
                    MailUtil.receiveMailAccount, html);

            // 4、根据session获取邮件传输对象
            Transport transport = session1.getTransport();
            // 5、使用邮箱账号和密码连接邮箱服务器emailAccount必须与message中的发件人邮箱一致，否则报错
            transport.connect(MailUtil.emailAccount, MailUtil.emailPassword);
            // 6、发送邮件,发送所有收件人地址
            transport.sendMessage(message, message.getAllRecipients());
            // 7、关闭连接
            transport.close();
            //  写入session
            session.setAttribute("code",code);
            ModelAndView mv = new ModelAndView();
            return Msg.success();
        } catch (Exception e) {
            e.printStackTrace();
            return Msg.fail();
        }
    }
    @RequestMapping("/leave")
    public String leave(HttpSession session){
        session.removeAttribute("user");
        return "forward:/index";
    }

}
