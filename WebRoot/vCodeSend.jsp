<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.ldu.mail.sendMail"%>
<%@page import="java.io.*"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'vCodeSend.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <%
     	String mailAddress = request.getParameter("mailAddress");	

           		if(mailAddress==""){
           			out.print("<script language='javascript'>alert('请填写正确的邮箱地址!');window.location.href='javascript:history.back(-1)';</script>");
           		} else{
          	//生成5位随机数
           			Random random = new Random();
           			String result="";
           			for (int i=0;i<5;i++)
           			{
           				result+=random.nextInt(10);
           			}
           			
           			sendMail send = new sendMail(mailAddress,result);
           			send.sendBody();	//发送邮件
           			session.setAttribute("codenum",result); //设置session记录验证码
					

           			//response.sendRedirect("javascript:history.back(-1)");
           		}
     %>
  </body>
</html>
