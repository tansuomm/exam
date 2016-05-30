<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String tkClId = request.getParameter("tkClId");
int tkclId = Integer.parseInt(tkClId);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>分析成绩</title>
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
<body>

 <div class="navigation"><s:iterator value="#request.passFs" >
				<a class="tools_btn" href=" javascript:void(0)" onclick="analyse(<%=tkclId %>,${passFs})"><span><b
						>统计分析</b></span></a>
			</s:iterator>
			<a href="javascript:history.go(-1);" class="back">后退</a>首页 &gt; 控制面板 &gt; 试卷管理</div>
 <table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="msgtable">
			<tr>
				
				<th width="15%">考生学号</th>
				<th width="15%">考生姓名</th>
				<th width="10%">总成绩</th>
				<th width="10%">及格分</th>
			</tr>
			<s:if test="#request.clerkKscjList != null">
				<s:iterator value="#request.clerkKscjList" var="clerkKscj">
				<s:iterator value="#request.passFs" >
					<%int passFs = (int)request.getAttribute("passFs"); %>
					<tr>
						<td align="center">${clerk.clerkName}</td>
						<td align="center">${clerk.name}</td>
						<td align="center">${cj}</td>
						<td align="center">${passFs}</td>
					</tr>
				</s:iterator>
				</s:iterator>
			</s:if>
			</table>

	<div id="hidiv" style="visibility:hidden">
		
		最高分：<span id="span1"></span>&nbsp;&nbsp;&nbsp;&nbsp;
		最低分：<span id="span2"></span>&nbsp;&nbsp;&nbsp;&nbsp;
		
		平均分：<span id="span3"></span>&nbsp;&nbsp;&nbsp;&nbsp;
		及格率：<span id="span4"></span>&nbsp;&nbsp;&nbsp;&nbsp;
	</div>		
			
</body>
<script type="text/javascript">
	function analyse(tkclId,passFs){
		$.ajax({
			type:"post",
			url:"kscj_analyse",
			data:"tkClId="+tkclId+"&passFs="+passFs,
			success:function(msg){
			
				var obj = eval("("+msg+")");
				$("#span1").html(obj.maxCj);
				$("#span2").html(obj.minCj);
				$("#span3").html(obj.average);
				$("#span4").html(obj.percent);
				$("#hidiv").css("visibility","visible");
			}	
		});
	}
</script>
</html>