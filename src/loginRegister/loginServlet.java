package loginRegister;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.omg.PortableServer.POAPackage.WrongAdapter;

import com.ldu.util.*;
import java.sql.*;

public class loginServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setCharacterEncoding("GBK");	//防止out.print 乱码
		PrintWriter out=response.getWriter();
		
		//获取提交的登录信息
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
            String url="jdbc:mysql://localhost:3306/ctms?useUnicode=true&characterEncoding=gbk&useSSL=false";
            con=DriverManager.getConnection(url,"root","ren123456");
            st=con.createStatement();
            
            String query="select * from user where stunum='" + stunum + "'";
            rs=st.executeQuery(query);
            int N=0;
            int P=0;
            while(rs.next()){
                if(stunum.equals(rs.getString("stunum"))){
                	N=1;
                	if(passwordMD5.equals(rs.getString("password"))){
                		P=1;
                		//获取session
                    	HttpSession session=request.getSession();
                    	//设置session  记录登录用户，进行登录检测
    					session.setAttribute("userName",rs.getString("username"));	//设置session userName 其他页面进行身份识别
    					session.setAttribute("usernum",rs.getString("stunum"));		//设置session usernum
                        response.sendRedirect("/ctms/main.jsp");
                	}
                }	
            }
            if(N == 0) {
                //用户错误
            	out.print("<script language='javascript'>");	
            	out.print("alert('用户不存在!');");	
            	out.print("window.location.href='/ctms/login.html';");	
            	out.print("</script>");		
            }
            else if(P == 0) {
                //密码错误
                out.print("<script language='javascript'>");	
                out.print("alert('密码错误，登录失败!');");	
                out.print("window.location.href='/ctms/login.html';");	
                out.print("</script>");	
            }

          }catch(Exception e){
              e.printStackTrace();
          }   
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
