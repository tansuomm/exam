<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>添加参加考试的班级</title>
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
<script type="text/javascript">
	function addOrgan(organId){
		$.ligerDialog.confirm("确定要添加吗", function (result) { 
			if(result){
				location.href="clerkCl_add?tkClId="+${tkClId}+"&isAllow="+${isAllow}+"&organId=" + organId;
			}
			else{
				return false;
			}
		});
	}
	
</script>
</head>
<body class="mainbody">
	<form name="form1" method="post" action="" id="form1">
		<div class="navigation"><a href="javascript:history.go(-1);" class="back">后退</a>首页 &gt; 控制面板 &gt; 试卷管理</div>


		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="msgtable">
			<tr>
				<th width="20%">未被允许考试班级</th>
				<th width="10%">添加</th>
				
			</tr>
			<s:if test="#request.noOrganList != null">
				<s:iterator value="#request.noOrganList" var="organ">
					<tr>
			
						<td align="center">${organName}</td>
						<td align="center"><a href="javascript:void(0)" onclick="addOrgan(${organId})">添加</a>
						
					</tr>
					
				</s:iterator>
			</s:if>
		</table>

	</form>
</body>
</html>
