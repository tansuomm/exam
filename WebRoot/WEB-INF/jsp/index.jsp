<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>大华学员考试系统 - 后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/html/scripts/ui/skins/Aqua/css/ligerui-all.css"
	rel="stylesheet" type="text/css" />
<link href="<%=path%>/html/images/style.css" rel="stylesheet"
	type="text/css" />
<script src="<%=path%>/html/scripts/jquery/jquery-1.3.2.min.js"
	type="text/javascript"></script>
<script src="<%=path%>/html/scripts/ui/js/ligerBuild.min.js"
	type="text/javascript"></script>
<script src="<%=path%>/html/js/function.js" type="text/javascript"></script>
<script src="<%=path%>/html/js/index.js" type="text/javascript"></script>
</head>
<body style="padding: 0px;">
	<form name="form1" method="post" action="####" id="form1">
		<div class="pageloading_bg" id="pageloading_bg"></div>
		<div id="pageloading">数据加载中，请稍等...</div>
		<div id="global_layout" class="layout" style="width: 100%">
			<!--头部-->
			<div position="top" class="header">
				<div class="header_box">
					<div class="header_right">
						<span><b>${user.userName}</b>您好，欢迎光临</span> <br /> <a
							href="javascript:f_addTab('home','管理中心','/html/Admin/center.html')">管理中心</a>
						| <a href="####">预览网站</a> | <a id="lbtnExit" href="####">安全退出</a>
					</div>
					<a class="logo">KHcms Logo</a>
				</div>
			</div>
			<!--左边-->
			<div position="left" title="管理菜单" id="global_left_nav">
				<div title="权限管理" iconcss="menu-icon-model" class="l-scroll">
					<ul id="global_channel_tree" style="margin-top: 3px;">
						<li isexpand="false"><span>资讯动态</span>
							<ul>
								<li url="Intro/ClassList.html"><span>内容类别</span></li>
								<li url="Intro/IntroList.html"><span>内容页</span></li>
							</ul></li>
					</ul>
				</div>
				<div title="题目管理" iconcss="menu-icon-plugins">
					<ul id="global_plugins" class="nlist">
						<li><a class="l-link"
							href="javascript:f_addTab('tkj','题库集管理','####')">题库集管理</a></li>
						<li><a class="l-link"
							href="javascript:f_addTab('tk','题库管理','####')">题库管理</a></li>
						<li><a class="l-link"
							href="javascript:f_addTab('tm','题目管理','tm_list')">题目管理</a></li>
					</ul>
				</div>
				<div title="考试管理" iconcss="menu-icon-setting">
					<ul class="nlist">
						<li><a class="l-link"
							href="javascript:f_addTab('sys_model','考试管理','Intro/ClassList.html')">考试管理</a></li>
						<li><a class="l-link"
							href="javascript:f_addTab('sys_model','试卷管理','Intro/ClassList.html')">内容类别</a></li>
						<li><a class="l-link"
							href="javascript:f_addTab('sys_config','统计分析','Intro/IntroList.html')">内容页</a></li>
					</ul>
				</div>
				<div title="考生管理" iconcss="menu-icon-member">
					<ul class="nlist">
						<li><a class="l-link"
							href="javascript:f_addTab('sys_model','考生录入','Intro/ClassList.html')">内容类别</a></li>
						<li><a class="l-link"
							href="javascript:f_addTab('sys_config','考生信息维护','Intro/IntroList.html')">内容页</a></li>
					</ul>
				</div>
			</div>
			<div position="center" id="framecenter" toolsid="tab-tools-nav">
				<div tabid="home" title="管理中心" iconcss="tab-icon-home"
					style="height: 300px">
					<iframe frameborder="0" name="sysMain" src="center.html"></iframe>
				</div>
			</div>
			<div position="bottom" class="footer">
				<div class="copyright">Copyright &copy; 2015 - 2016.
					KHcms.net. All Rights Reserved.</div>
			</div>
		</div>
	</form>
</body>
</html>
