<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.ldu.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'registerCheck.jsp' starting page</title>
    
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
   			request.setCharacterEncoding("utf-8");
       
   			String stunum=request.getParameter("stunum");
   			String username=request.getParameter("username");
   			String password=request.getParameter("password");
   			String mailAddress=request.getParameter("mailAddress");
   			
   			String passwordMD5 = md5.MD5Encode(password,"utf8");
   			
   			Connection con = null;

    		Class.forName("com.mysql.jdbc.Driver");

    		String url="jdbc:mysql://localhost:3306/ctms?useUnicode=true&characterEncoding=gbk";
    		con=DriverManager.getConnection(url,"root","ren123456");
     
    		String sql ="insert into user(username,stunum,password,email)values(?,?,?,?)";
    		PreparedStatement st=con.prepareStatement(sql);
    		st.setString(1,username);
    		st.setString(2,stunum);
    		st.setString(3,passwordMD5); 
    		st.setString(4,mailAddress); 
    		int rtn=st.executeUpdate();
    		st.close();
    		con.close();
    		//response.sendRedirect("login.html");
    		out.print("<script language='javascript'>alert('注册成功');window.location.href='login.html';</script>");
    %>
  </body>
</html>
