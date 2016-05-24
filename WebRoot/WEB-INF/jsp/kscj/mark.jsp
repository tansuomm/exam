<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>答卷判分</title>
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
<style>
#leftdiv {
	width: 49%;
	float: left;
	clear: left;
}

#rightdiv {
	width: 49%;
	float: right;
	clear: right;
}

#headerdiv {
	width: 100%;
	height: auto;
}
</style>
</head>
<body class="mainbody">
	<div>


		<form name="form1" method="post" action="kscj_mark" id="form1">
			<div class="navigation">首页 &gt; 控制面板 &gt; 试卷管理 &gt; 手工判分</div>
			<!-- 正确答案 -->
			<div id="leftdiv">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="msgtable">
					<tr>
						<th width="25%">题号</th>
						<th width="25%">标题</th>
						<th width="25%">分数</th>
						<th width="25">正确答案</th>

					</tr>
					<s:if test="#request.gdsjList != null">
						<s:iterator value="#request.gdsjList" var="gdsj">
							<tr>
								<td align="center">${tmId}</td>
								<td align="center">${tmNr}</td>
								<td align="center">${tmFs}</td>
								<td align="center">${tmDa}</td>
							</tr>
						</s:iterator>
					</s:if>
				</table>


			</div>
			<!-- 考生答案 -->
			<div id="rightdiv">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="msgtable">
					<tr>
						<th width="25%">题号</th>
						<th width="25%">考生答案</th>
						<th width="25%">考生得分</th>
						<th width="25%">应得分数</th>
					</tr>
					<s:if test="#request.clerkGdksTmList != null">
						<s:iterator value="#request.clerkGdksTmList" var="clerkGdksTm">
							<tr>
								<td align="center">${gdsjId}</td>
								<td align="center">${clerkTmDa}</td>
								<td align="center">${tmWddf}</td>
								<td align="center"><input type="text" name="tmWddf" value=${tmWddf}></input></td>
							</tr>
						</s:iterator>
					</s:if>
				</table>
			</div>
	</div>
	<div style="width:100%; height: auto">
		<input type="submit" value="保存" name="submit" />
	</div>
	</form>
</body>
</html>
