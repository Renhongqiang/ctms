# ctms

#### 项目介绍
jsp大作业，社团管理系统

#### 软件架构
系统目录:  

1.package -> src :    

    1. admin.applyHandle  
		1.1 deleteLeaveServlet.java : 删除请假记录Servlet，使用ajax请求
		1.2 deleteOutApply.java : 删除退团请求Servlet，使用ajax请求
		1.3 deleteUnnameApply.java : 删除匿名信息Servlet,使用ajax请求
		1.4 handleLeaverServlet.java : 给请假信息添加同意或拒绝字段，使用ajax请求
		1.5 handleOutServlet,java :  给退团信息添加同意或拒绝字段，使用ajax请求
	2. admin.stuHandle
		2.1 deleteStudentServlet.java : 删除学生Servlet
		2.2 findStudentServlet.java : 查找成员信息Servlet
		2.3 findFreeTimeTable.java ：查看空课表
		2.4 User.java : 查找成员信息结果集JavaBean 
	3. admin.login
		3.1 adminLoginServlet.java : 管理员用户登录表单处理Servlet
	4. admin.sign
		4.1 startSignServlet.java : 发起签到Servlet
		4.2 stopSignServlet.java : 停止签到Servlet ajax请求
	5. admin.stupublic
		5.1 changeNoticeServlet.java : 重新发布公告（修改）
		5.2 deleteNoticeServlet.java : 删除公告
		5.3 sendNoticeServlet.java : 发布新公告

***

    3. applyCenter
		3.1 applyLeaveServlet.java : 用户请假申请表单处理Servlet
		3.2 applyOutServlet.java : 用户退团申请表单处理Servlet
		3.3 applyUnnameServlet.java : 处理匿名申请表单Servlet  

	4. com.ldu.mail
		4.1 sendMail.java : 验证码邮件发送

	5. com.ldu.util
		5.1 md5.java : 密码加密工具
		5.2 sqlConnection.java : 连接数据库JavaBean，数据库入口
		5.3 sqlSearch.java : 按条件查询 tableName 表中一条数据
		5.4 sqlSearchTable.java : 查询 tableName 中某学号的记录，返回  ResultSet
		5.5 sqlUpdate.java : 按条件更新表中符合条件数据
		5.6 sqlSearchMsg.java : 包含两个方法 getMsgNum（）获取用户某种类型信息（即某表中）未读信息数量、getMsg（）获取用户某种类型信息未读信息的结果集ResultSet
	
	6. loginRegister
		6.1 loginServlet.java : 用户登录表单处理Servlet
		6.2 registerServlet.java : 用户注册表单处理Servlet
		6.3 resetPswServlet.java : 用户找回密码表单处理Servlet
		6.4 vCode.java : 验证码Servlet，接受调用界面Ajax请求，生成验证码，根据接收邮箱地址发送验证码，回送验证码

	7. personalCenter
		7.1 changeTimeTableServlet.java : 修改课表表单处理Servlet
		7.2 lookTimeTable.java : 查看课表servlet
		7.3 myInfoServlet.java : 查看个人信息Servlet
		7.4 resetPassword.java : 修改密码Servlet
		7.5 uploadeServlet.java : 上传头像Servlet
		7.6 readMsg.java : 处理读取信息，用户点击链接发送要读取消息的数据，对数据库中该条信息进行已读处理(ifread字段置为yes)
	8. signCenter
		8.1 singnServlet.java : 用户签到Servlet

2.WebRoot
	
	1. "css" css样式文件夹
	2. "font" 阿里矢量图标文件件
	3. "images" 系统图片资源文件夹
	4. "js" JavaScript文件夹
	5. "WEB-INF"
		5.1 "lib" 系统外部jar包
		5.2 web.xml 系统配置文件 

	6. "adminPage" 管理员界面文件夹
		6.1 "applyPage" 查看用户请求模块页面文件夹
			6.1.1 lookLeave.jsp 查看请假信息页面
			6.1.2 lookOut.jsp 查看退团信息页面
			6.1.3 lookUnname.jsp 查看匿名信息页面
		6.2 publicPage 公共管理模块页面
			6.2.1 changenotice.jsp 修改重新发布公告
			6.2.2 looknotice.jsp 查看公告
			6.2.3 notice.jsp 发布公告页面
		6.3 stuPage 人员管理模块页面
			6.3.1 findstudent.jsp 查找人员信息
			6.3.2 lookstudent.jsp 查看全部人员列表
			6.3.3 lookFreeTimeTable.jsp 查看空课表页面
			6.3.4 deletestudent.jsp 删除学生页面
		6.4 signPage
			6.4.1 looksign.jsp 查看历史签到页面
			6.4.2 signIn.jsp 发起签到页面
		6.5 adminMain.jsp 管理员界面导航栏

***

	7. "applyCenter" 用户申请中心模块页面文件夹
		7.1 applyLeave.jsp 请假申请页面
		7.2 applyOut.jsp 退团申请页面
		7.3 applyunname.jsp 匿名投诉页面
		7.4 lookLeave.jsp 查看请假本人申请
		7.5 lookOut.jsp 查看本人退团申请
	8. "personalCenter" 个人中心模块文件夹
		8.1 changeTimeTable.jsp 修改课表页面
		8.2 lookTimeTable.jsp 查看我的课表页面
		8.3 myInfo.jsp 个人信息页面
		8.4 resetPassword.jsp 修改密码页面
		8.5 newMsg.jsp 查看通知消息页面
	9. "publicCenter" 公共模块
		9.1 readnotice.jsp 查看公告页面
	10. "signCenter" 签到模块
		10.1 looksign.jsp 查看签到记录页面
		10.2 sign.jsp 用户签到页面

***

	9. 根目录下的jsp页面
		login.html			普通用户登录页面	
		out.jsp				普通用户退出处理jsp
		main.jsp			普通用户登录主页面（导航栏）
		register.jsp		普通用户注册页面
		resetPassword.jsp	普通用户忘记密码页面

		adminlogin.html		管理员后天登录页面
		adminout.jsp		管理员退出处理jsp

