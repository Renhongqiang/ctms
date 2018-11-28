package loginRegister;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ldu.util.*;
import java.sql.*;

public class resetPswServlet extends HttpServlet {


	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			response.setCharacterEncoding("GBK");	//防止out.print 乱码
			PrintWriter out=response.getWriter();
		
			//获取注册信息
			String password=request.getParameter("password");
			String mailAddress=request.getParameter("mailAddress");
		
			String passwordMD5 = md5.MD5Encode(password,"utf8");
		
			Connection con = null;
			PreparedStatement st = null;
			ResultSet rs = null;

			try {
				Class.forName("com.mysql.jdbc.Driver");
				String url="jdbc:mysql://localhost:3306/ctms?useUnicode=true&characterEncoding=gbk";
				con=DriverManager.getConnection(url,"root","ren123456");

				String sql ="update user set password=? where email=?";
				st=con.prepareStatement(sql);
				st.setString(1,passwordMD5); 
				st.setString(2,mailAddress); 
				int rtn=st.executeUpdate();
			
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}

				out.print("<script language='javascript'>");	
				out.print("alert('修改成功!');");	
				out.print("window.location.href='/ctms/login.html';");	
				out.print("</script>");				
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
