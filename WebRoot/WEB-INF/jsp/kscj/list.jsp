<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>已考科目</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link type="text/css" rel="stylesheet" href="<%=path%>/html/scripts/ui/skins/Aqua/css/ligerui-all.css" />
<link type="text/css" rel="stylesheet" href="<%=path%>/html/Admin/images/style.css" />
<script type="text/javascript" src="<%=path%>/html/scripts/jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/html/scripts/ui/js/ligerBuild.min.js"></script>
<script type="text/javascript" src="<%=path%>/html/Admin/js/function.js"></script>

</head>
<body class="mainbody">
<form name="form1" method="post" action="" id="form1"> 
    <div class="navigation">首页 &gt; 控制面板 &gt; 试卷管理</div>
    <div class="tools_box">
    </div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <th width="40%" align="center">已考试卷名称</th>
        <th width="20%">总分</th>
        <th width="20%">及格分</th>
        <th width="20%">操作</th>
      </tr>
      <s:if test="#request.hasTkcl != null">
      <s:iterator value="#request.hasTkcl">	
	      <tr>
	        <td align="center">${tkClName}</td>
	        <td align="center">${totalScore}</td>
	        <td align="center">${passFS}</td>
	        <td align="center"><a href="kscj_tkclList?tkClId=${tkClId}">判卷</a>&nbsp;&nbsp;<a href="kscj_analysePre">分析</a></td>
	      </tr>
      </s:iterator>
      </s:if>
    </table>
    
    <div class="line10"></div>
</form>
</body>
</html>