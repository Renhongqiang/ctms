<%@page import="java.sql.*"%>
<%@page import="com.ldu.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>数据处理页面</title>
    </head>
    <body>
        <%
            String stunum =new String(request.getParameter("stunum").getBytes("ISO-8859-1"),"UTF-8");
            String password =new String(request.getParameter("password").getBytes("ISO-8859-1"),"UTF-8");
            //MD5加密
            String passwordMD5 = md5.MD5Encode(password,"utf8");
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            if(stunum.equals("")) {
                response.sendRedirect("login.html");
            }
            try{
                Class.forName("com.mysql.jdbc.Driver");
                /*url后面加的?useUnicode=true&characterEncoding=gbk，是为了处理向数据库中添加数据时出现乱码的问题。*/
                String url="jdbc:mysql://localhost:3306/ctms?useUnicode=true&characterEncoding=gbk";
                con=DriverManager.getConnection(url,"root","ren123456");
                st=con.createStatement();
                String query="select * from user where stunum='" + stunum + "'";
                rs=st.executeQuery(query);
                if(rs.next()){
                    String query2 ="select * from user where password='" + passwordMD5 + "'";
                    rs=st.executeQuery(query2);
                    if(rs.next()){
                    	//设置session User 记录登录用户，进行登录检测
						session.setAttribute("User",rs.getString("username"));
                        response.sendRedirect("main.jsp");
                    }else{
                    	//密码错误
                    	//session.setAttribute("User","no");
                    	out.print("<script language='javascript'>alert('密码错误!');window.location.href='login.html';</script>");
                        //response.sendRedirect("login.jsp");
                    }
                } else {
                	//用户错误
                	//session.setAttribute("User","no");
                	out.print("<script language='javascript'>alert('用户不存在!');window.location.href='login.html';</script>"); 
                	//response.sendRedirect("login.jsp");
                }
              }catch(Exception e){
                  e.printStackTrace();
              }finally{
                  rs.close();
                  st.close();
                  con.close();
             }
        %>
    </body>
</html>
