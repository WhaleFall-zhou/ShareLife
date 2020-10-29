package com.util;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.Date;

public class MailUtil {
    public static String emailAccount = "1640830027@qq.com";
    public static String emailPassword = "rhhqpqvxicffcegh";
    public static String emailSMTPHost = "smtp.qq.com";
    public static String receiveMailAccount = "";

    public static MimeMessage creatMimeMessage(Session session, String sendMail, String receiveMail, String html) throws UnsupportedEncodingException, MessagingException {
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(sendMail, "发件人昵称", "UTF-8"));
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "尊敬的用户", "UTF-8"));
        message.setSubject("邮箱验证","UTF-8");
        message.setContent(html,"text/html;charset=UTF-8");
        message.setSentDate(new Date());
        message.saveChanges();
        return message;
    }
}
