<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>允许考试班级</title>
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
	function deleteOrgan(organId){
		$.ligerDialog.confirm("确定要取消班级的考试资格吗", function (result) { 
			if(result){
				location.href="clerkCl_delete?tkClId="+${tkClId}+"&isAllow="+${isAllow}+"&organId=" + organId;
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
		
     		<div>
			<a href="clerkCl_addPre?tkClId=${tkClId}&isAllow=${isAllow}" class="tools_btn"><span><b
						class="import">添加班级</b></span></a> <a href="clerkCl_list?tkClId=${tkClId}&isAllow=${isAllow}" class="tools_btn"><span><b
						class="refresh">刷新列表</b></span></a> 
			</div>
		


		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="msgtable">
			<tr>
				<th width="20%">允许参加考试班级</th>
				<th width="10%">删除</th>
				
			</tr>
			<s:if test="#request.organList != null">
				<s:iterator value="#request.organList" var="organ">
					<tr>
			
						<td align="center">${organName}</td>
						<td align="center"><a href="javascript:void(0)" onclick="deleteOrgan(${organId})">删除</a>
						
					</tr>
					
				</s:iterator>
			</s:if>
		</table>

	</form>
</body>
</html>
