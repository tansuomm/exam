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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
	<form name="form1" method="post" action="kscj_mark" id="form1">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<s:iterator value="#request.gdsjList" id="gdsj">
				<s:iterator value="#request.clerkGdksTmList" var="clerkGdksTm">
					
					<s:if test="#clerkGdksTm.gdsjId==tmId">

						<tr>
							<td><s:property value="tmId" />.<s:property value="tmNr" /></td>
						</tr>
						<input type="hidden"  name="gdsjIdarr" value="${gdsjId}"></input>
						<tr>
							<td>&nbsp;&nbsp;答 案:<s:property value="tmDa" /></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;考生答案:<s:property value="clerkTmDa" /></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;分 数:<s:property value="tmFs" /></td>
						</tr>

						<tr>
							<td>&nbsp;&nbsp;应得分数:<input type="text" name="tmWddfarr" value="${tmWddf}"></input></td>
						</tr>
						
					</s:if>
				</s:iterator>
			</s:iterator>
		</table>
		<%String  clerkKscjIdvalue=  request.getParameter("clerkGdksTm.clerkKscjId");
		  String  tkClIdvalue = request.getParameter("tkClId");%>
		  <input type="hidden" name="tkclId" value="<%=tkClIdvalue %>"></input>
		<input type="hidden" name="clerkKscjId" value="<%=clerkKscjIdvalue%>"></input>
		
		<input type="submit" value="保存" name="submit"></input>
	</form>
</body>
</html>
