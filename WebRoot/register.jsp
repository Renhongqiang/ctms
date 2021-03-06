<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
		<meta charset="utf-8">
		<title>注册界面</title>
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/common.css" />
	</head>
	<body>
		<div class="wrap login_wrap">
			<div class="content">
				
				<div class="logo"></div>
				
				<div class="login_box">	
					
					<div class="login_form">
						<div class="login_title">
							用户注册
						</div>
						
						<form action="loginRegister/registerServlet" onsubmit="return validateCode()" class="form1" method="post">
							<div class="form_text_ipt">
								<input name="stunum" id="stunum" type="text" placeholder="学号">
							</div>
							<div class="ececk_warning"><span>学号不能为空</span></div>
							<div class="form_text_ipt">
								<input name="username" id="username" type="text" placeholder="姓名">
							</div>
							<div class="ececk_warning"><span>姓名不能为空</span></div>
							<div class="form_text_ipt">
								<input name="password" id="password" type="password" placeholder="密码">
							</div>
							<div class="ececk_warning"><span>密码不能为空</span></div>
							<div class="form_text_ipt">
								<input name="repassword" id="repassword" type="password" placeholder="确认密码">
							</div>
							<div class="ececk_warning"><span>密码不能为空</span></div>

							
								<div class="form_text_ipt">
									<input class="mailAddress" name="mailAddress" type="text" placeholder="邮箱">
								</div>
								<div class="ececk_warning"><span>邮箱不能为空</span></div>
								<div class="code">
									<input id="codeText" name="code" type="text" placeholder="邮件验证码">
									<input id="codebtn" type="button" onclick="sendMessages()" value="获取验证码">
								</div>
								<font id="errMsg2" color="red" style="display:none; position:absolution; top:2rem;"></font>
								<div class="ececk_warning"><span>验证码不能为空</span></div>
														
							
							<div class="form_btn">
								<button type="submit">注册</button>
							</div>
							<div class="form_reg_btn">
								<span>已有帐号？</span><a href="login.html">马上登录</a>
							</div>
						</form>
						<br><br>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="js/jquery.min.js" ></script>
		<script type="text/javascript" src="js/common.js" ></script>
	<script type="text/javascript">

         var InterValObj; //timer变量，控制时间 
         var count = 50; //间隔函数，1秒执行 
         var curCount; //当前剩余秒数 
         var codeLength = 6; //验证码长度 
         var code = ""; //验证码
         function sendMessages() {
            curCount = count;
            var mailAddress = $(".mailAddress").val();
            if(mailAddress != "") {
               //设置button效果，开始计时 
               $("#codebtn").attr("disabled", "true");
               $("#codebtn").val(curCount + "秒");
               $("#codebtn").css({"background": "#B3B4B9"});
               InterValObj = window.setInterval(SetRemainTimes, 1000); //启动计时器，1秒执行一次 
               //向后台发送处理数据 
               $.ajax({
                  //url: "vCodeSend.jsp",
                  url: "loginRegister/vCode",	//随机验证码servlet
                  dataType: "text",
                  type: "post",
                  async:true,    //或false,是否异步
                  data: {mailAddress:mailAddress},
                  success: function(data,textStatus,jqXHR) {
                      	code = data;
                  }
               });
            } else {
               alert("邮箱不能为空！");
            }
            
         }
         //timer处理函数 
         function SetRemainTimes() {
            if(curCount == 0) {
               window.clearInterval(InterValObj); //停止计时器 
               $("#codebtn").removeAttr("disabled"); //启用按钮 
               $("#codebtn").css({"background": "#31BAEF"});
               $("#codebtn").val("重新发送");
               code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效   
            } else {
               curCount--;
               $("#codebtn").val(curCount + "秒");
            }
         }
         
         //验证码非空和错误验证
         function validateCode() {
            var rpcode = $("#codeText").val();
            
			if($("#stunum").val() == "") {
            	alert("请填写学号！");
               return false;
            }
            if($("#username").val() == "") {
            	alert("请填写姓名！");
               return false;
            }
            if($("#password").val() == "") {
            	alert("请填写密码！");
               return false;
            }
            if($("#repassword").val() == "") {
            	alert("请填写确认密码！");
               return false;
            }
            if($("#repassword").val() != $("#password").val()) {
            	alert("两次密码不同！");
               return false;
            }

            if(code == "") {
            	alert("请先获取验证码！");
               return false;
            }
            if(code != rpcode) {
            	alert("验证码错误！");
               return false;
            }
               return true;
         }
    </script>
	</body>
</html>
