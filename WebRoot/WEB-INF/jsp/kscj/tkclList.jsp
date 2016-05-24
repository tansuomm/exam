<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>判卷状态列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link type="text/css" rel="stylesheet"
	href="<%=path%>/html/scripts/ui/skins/Aqua/css/ligerui-all.css" />
<link type="text/css" rel="stylesheet"
	href="<%=path%>/html/images/style.css" />
<script type="text/javascript"
	src="<%=path%>/html/scripts/jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/html/scripts/ui/js/ligerBuild.min.js"></script>
<script type="text/javascript" src="<%=path%>/html/js/function.js"></script>

</head>
<body class="mainbody">
	<form name="form1" method="post" action="" id="form1">
		<div class="navigation">首页 &gt; 控制面板 &gt; 试卷管理</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="msgtable">
			<tr>
				
				<th width="15%">考生学号</th>
				<th width="15%">考生姓名</th>
				<th width="10%">基础题得分</th>
				<th width="10%">问答题得分</th>
				<th width="15%">判卷状态</th>
				<th width="20%">判卷人</th>
				<!-- 如果已判卷，判卷人可以选择再行判卷 -->
				<th width="15%">操作</th>
			</tr>
			<s:if test="#request.clerkKscjList != null">
				<s:iterator value="#request.clerkKscjList" var="clerkKscj">
					<tr>
						<!-- 未设置主外键 -->
						<td align="center">${clerk.clerkName}</td>
						<td align="center">${clerk.name}</td>
						<td align="center">${clerkXzdf}</td>
						<td align="center">${clerkWddf}</td>
						
						<td align="center">
							<s:if test="#clerkKscj.clerkKsStatus==2">
								已判卷
							</s:if>
							<s:else>
								未判卷
							</s:else>
						</td>	
						<td align="center">${clerkPj}</td>
						<td align="center"><a href="kscj_markPre?clerkGdksTm.clerkKscjId=${clerkKscjId}&tkClId=${tkClId}">判卷
						</a></td>
					</tr>
				</s:iterator>
			</s:if>
		</table>

		<div class="line10"></div>
		
	</form>
</body>
</html>
