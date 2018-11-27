package com.ldu.mail;

import java.util.*; 
import javax.mail.*;
import javax.mail.internet.*;

public class sendMail {
	String smtphost = "smtp.163.com"; // 发送邮件服务器
	String user = "renhong_qiang@163.com"; // 邮件服务器登录用户名
	String password = "159486ren"; // 邮件服务器登录密码 授权码！！！
	String from = "renhong_qiang@163.com"; // 发送人邮件地址
	String to = "1745012159@qq.com"; // 接受人邮件地址
	String subject = "CTMS社团管理紫铜"; // 邮件标题
	String body = "JavaMail 电子邮件发送系统"; // 邮件内容
	String num;		//随机验证码
	public sendMail(String to,String num)
	{
		this.to = to;
		this.num = num;
		this.body = to + "您本次的验证码为：\"" + num + "\" 请妥善保管！";  //邮件内容
	}
	public void sendBody()
	{
		try {
			Properties props = new Properties();
			props.put("mail.smtp.host", smtphost);
			props.put("mail.smtp.auth","true");
			Session ssn = Session.getInstance(props, null);

			MimeMessage message = new MimeMessage(ssn);

			InternetAddress fromAddress = new InternetAddress(from);
			message.setFrom(fromAddress);
			InternetAddress toAddress = new InternetAddress(to);
			message.addRecipient(Message.RecipientType.TO, toAddress);

			message.setSubject(subject);
			message.setText(body);

			Transport transport = ssn.getTransport("smtp");
			transport.connect(smtphost, user, password);
			transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
			//transport.send(message);
			transport.close();

		} catch(Exception m) {
			m.printStackTrace();
		}
	}
}
