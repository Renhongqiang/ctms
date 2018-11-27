<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<meta charset="utf-8">
    <title>CTMS</title>
	
    <link rel="stylesheet" type="text/css" href="css/nav.css">
    <link rel="stylesheet" type="text/css" href="font/iconfont.css">
    <link rel="stylesheet" type="text/css" href="font/iconfont1.css">
	
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/nav.js"></script>
  </head>
  
<body>
	<% String user=(String)session.getAttribute("User");
		if(user == null || user.equalsIgnoreCase("no")){
			out.print("<script language='javascript'>alert('请先登录!');window.location.href='login.html';</script>"); 
     	}
	%>
	
    <div class="nav">
        <div class="nav-top">
            <div id="mini" style="border-bottom:1px solid rgba(255,255,255,.1)">
                <img src="images/mini.png" >
                <span id="top-span" class="top-span">任洪强</span>
            </div>
        </div>
        <ul>
            <li class="nav-item">
                <a href="javascript:;">
                    <i class="iconfont icon-shouyetianchong"></i><span>首页</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="javascript:;"><i class="iconfont icon-diqiu"></i><span>社团动态</span><i class="my-icon nav-more"></i></a>
                <ul>
                    <li><a href="javascript:;"><span>社团简介</span></a></li>
                    <li><a href="javascript:;"><span>社团活动</span></a></li>
                    <li><a href="javascript:;"><span>通知公告</span></a></li>
                    <li><a href="javascript:;"><span>缴费AA</span></a></li>
                </ul>
            </li>
            <li class="nav-item">
                <a href="javascript:;"><i class="iconfont icon-xiai"></i><span>交友互动</span><i class="my-icon nav-more"></i></a>
                <ul>
                    <li><a href="javascript:;"><span>全部动态</span></a></li>
                    <li><a href="javascript:;"><span>朋友心情</span></a></li>
                    <li><a href="javascript:;"><span>失物招领</span></a></li>
                    <li><a href="javascript:;"><span>二手买卖</span></a></li>
                    <li><a href="javascript:;"><span>时间囊</span></a></li>
                </ul>
            </li>
            <li class="nav-item">
                <a href="javascript:;"><i class="iconfont icon-changyonggoupiaorenbianji"></i><span>申请中心</span><i class="my-icon nav-more"></i></a>
                <ul>
                    <li><a href="javascript:;"><span>申请加入</span></a></li>
                    <li><a href="javascript:;"><span>申请退团</span></a></li>
                    <li><a href="javascript:;"><span>成为社长</span></a></li>
                    <li><a href="javascript:;"><span>成为部长</span></a></li>
                    <li><a href="javascript:;"><span>请假申请</span></a></li>
                    <li><a href="javascript:;"><span>匿名投诉</span></a></li>
                </ul>
            </li>
            <li class="nav-item">
                <a href="javascript:;"><i class="iconfont icon-qiandao1"></i><span>出勤签到</span><i class="my-icon nav-more"></i></a>
                <ul>
                    <li><a href="javascript:;"><span>定位签到</span></a></li>
                    <li><a href="javascript:;"><span>验证码</span></a></li>
                </ul>
            </li>
            <li class="nav-item">
                <a href="javascript:;">
                    <i class="iconfont icon-shezhi"></i><span>个人中心</span>
                    <i class="my-icon nav-more"></i>
                </a>
                <ul>
                    <li><a href="javascript:;"><span>个人信息</span></a></li>
                    <li><a href="javascript:;"><span>我的课表</span></a></li>
                    <li><a href="javascript:;"><span>通知消息</span></a></li>
                    <li><a href="javascript:;"><span>修改信息</span></a></li>
                    <li><a href="out.jsp"><span>退&nbsp;&nbsp;&nbsp;出</span>&nbsp;<i class="iconfont icon-tuichu1"></i></a></li>
                </ul>
            </li>
        </ul>
    </div>
</body>
</html>
