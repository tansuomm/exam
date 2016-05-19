<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>大华学员考试系统 - 后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<style type="text/css">
	#div1,#div2,#div3,#div4{
	
	visibility:hidden;
	}
</style>
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
						| <a id="lbtnExit" href="loginPre">安全退出</a>
					</div>
					<a class="logo">KHcms Logo</a>
				</div>
			</div>
			<!--左边-->
			<div position="left" title="管理菜单" id="global_left_nav">
				<div style="dispaly:none" id="div1"  title="权限管理" iconcss="menu-icon-model" class="l-scroll">
					<ul id="global_channel_tree" style="margin-top: 3px;">

								<li url="right_list"><span>权限列表</span></li>
								<li url="userRight_list"><span>用户权限</span></li>

					</ul>
				</div>
				<div  id="div2" title="题库管理" iconcss="menu-icon-plugins">
					<ul id="global_plugins" class="nlist">
						<li><a class="l-link"
							href="javascript:f_addTab('tkj','题库集管理','tkj_list')">题库集管理</a></li>
						<li><a class="l-link"
							href="javascript:f_addTab('tk','题库管理','tk_list')">题库管理</a></li>
						<li><a class="l-link"
							href="javascript:f_addTab('tm','题目管理','tm_list')">题目管理</a></li>
					</ul>
				</div>
				<div  id="div3" title="试卷管理" iconcss="menu-icon-setting">
					<ul class="nlist">
						<li><a class="l-link"
							href="javascript:f_addTab('sys_model','考试管理','tkcl_addPre')">试卷出题</a></li>
						<li><a class="l-link"
							href="javascript:f_addTab('sys_tkcl','试卷列表','tkcl_list')">试卷列表</a></li>
						<li><a class="l-link"
							href="javascript:f_addTab('sys_mark','手工判卷','tkcl_markPre')">手工判卷</a></li>	
						<li><a class="l-link"
							href="javascript:f_addTab('sys_config','统计分析','tkcl_analysePre')">统计分析</a></li>
					</ul>
				</div>
				<div  id="div4" title="考生管理" iconcss="menu-icon-member">
					<ul class="nlist">
						<li><a class="l-link"
							href="javascript:f_addTab('sys_model','学生管理','clerk_list')">学生管理</a></li>
						<li><a class="l-link"
							href="javascript:f_addTab('sys_config','班级管理','organ_list')">班级管理</a></li>
					</ul>
				</div>
			</div>
			<div position="center" id="framecenter" toolsid="tab-tools-nav">
				<div tabid="home" title="管理中心" iconcss="tab-icon-home"
					style="height: 300px">
					<iframe frameborder="0" name="sysMain" src="<%=path%>/html/Admin/center.html"></iframe>
				</div>
			</div>
			<div position="bottom" class="footer">
				<div class="copyright">Copyright &copy; 2015 - 2016.
					KHcms.net. All Rights Reserved.</div>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">
/* 1 5 9 13显示对应的权限 */
	$(document).ready(function(){
		
		$.ajax({
			url:'bigRight',
			
			type:'POST',
			
			success:function(msg){
					
					var json = eval("("+$.trim(msg)+")").right;
					
					for(var i=0;i<json.length;i++){
						var obj = json[i];
						if(obj.rightId==1){
							$("#div3").css("visibility","visible");
							
						}else if(obj.rightId==5){
							$("#div2").css("visibility","visible");
						}else if(obj.rightId==9){
							$("#div1").css("visibility","visible");
						}else if(obj.rightId==13){
							$("#div4").css("visibility","visible");
						}
					} 	
			}			
			
		});
	});

</script>
</html>
