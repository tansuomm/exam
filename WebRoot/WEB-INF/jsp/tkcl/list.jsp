<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>考试列表</title>
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
	function deleteTkcl(tkClId){
		$.ligerDialog.confirm("删除不可恢复，是否继续", function (result) { 
			if(result){
				location.href="tkcl_delete?tkClId=" + tkClId;
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
		<div class="navigation">首页 &gt; 控制面板 &gt; 试卷管理</div>
		
     		<div>
			 <a href="tkcl_list" class="tools_btn"><span><b
						class="refresh">刷新列表</b></span></a> 
			</div>
		


		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="msgtable">
			<tr>
				
				<th width="20%" align="left">考试科目</th>
				<th width="10%">考试时间</th>
				<th width="20%">开始时间</th>
				<th width="20%">结束时间</th>
				<th width="12%">总分</th>
				<th width="12%">及格分</th>
				<th width="6%">操作</th>
			</tr>
			<s:if test="#request.tkclList != null">
				<s:iterator value="#request.tkclList" var="tkcl">
					<tr>
			
						<td>${tkClName}</td>
						<td align="center">${tkClTime}</td>
						<td align="center">${validBtime}</td>
						<td align="center">${validEtime}</td>
						<td align="center">${totalScore}</td>
						<td align="center">${passFS}</td>
						<td align="center"><a href="javascript:void(0)" onclick="deleteTkcl(${tkClId})">删除</a></td>
					</tr>
				</s:iterator>
			</s:if>
		</table>

	</form>
</body>
</html>
