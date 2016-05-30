<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>题目列表</title>
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
	function deleteTm(tmId){
		$.ligerDialog.confirm("删除不可恢复，是否继续", function (result) { 
			if(result){
				location.href="tm_delete?tmId=" + tmId;
			}
			else{
				return false;
			}
		});
	}
	$(document).ready(function(){
	    	//题库集下拉框发生变化的时候
	    	$("#selTkj").change(function(){
	    		//ajax
	    		$.ajax({
	   	  		   //post提交	
	   	  		   type: "POST",
	   	  		   //地址
	   	  		   url: "tk_findTkByTkjId",
	   	  		   //地址栏传值
	   	  		   //题库集下拉框选中的值  题库集主键Id
	   	  		   data: "tkjId=" + $("#selTkj").val(),
	   	  		   //成功
	   	  		   success: function(msg){
	   	  			 $("#selTk").addClass("select2");  
	   	  		     //alert(msg);
	   	  		     //有返回值
	   	  		     if($.trim(msg) != ""){
	   	  		    	 //题库
	   	  		    	 //attr 属性  把 disabled属性 设置为 false
	   	  		    	 $("#selTk").attr("disabled", false);
	   	  		    	 $("#selTk").html(msg);
	   	  		     }
	   	  		     else{
	   	  		   		 $("#selTk").attr("disabled", true);
		  		    	 $("#selTk").html("");
	   	  		     }
	   	  		   }
	   	  		});
	    	});
	    });
</script>
</head>
<body class="mainbody">
	<form name="form1" method="post" action="" id="form1">
		<div class="navigation">首页 &gt; 控制面板 &gt; 题目管理</div>
		<div class="tools_box">
			<div class="tools_bar">
				<div class="search_box">
	    		题库集
	    		<s:select cssClass="select2" list="#request.tkjList" name="tk.tkj.tkjId" id="selTkj" 
              headerKey="0" headerValue="=请选择=" listKey="tkjId" listValue="tkjName"></s:select>
	    		题库
	    		<s:if test="#request.listTk==null">
		    		<select name="tk.tkId" id="selTk" disabled>
	              		<option value="0">=请选择=</option>
	              	</select>
              	</s:if>
              	<s:else>
	              	<s:select cssClass="select2" list="#request.listTk" name="tk.tkId" id="selTk" 
	              headerKey="0" headerValue="=请选择=" listKey="tkId" listValue="tkName" disabled="disabled"></s:select>
              	</s:else>
	    		关键字
		        <input name="tmName" type="text" id="txtKeywords" class="txtInput"  value="${tmName}" />
		        <input type="submit" name="btnSearch" value="搜 索" id="btnSearch" class="btnSearch" />
     		</div>
				<a href="javascript:void(0);" onclick="checkAll(this);"
					class="tools_btn"><span><b class="all">全选</b></span></a> <a
					href="tm_addPre" class="tools_btn"><span><b
						class="import">添加题目</b></span></a> <a href="tm_list" class="tools_btn"><span><b
						class="refresh">刷新列表</b></span></a> 
			</div>
		</div>


		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="msgtable">
			<tr>
				<th width="10%">选择</th>
				<th width="30%" align="left">题目标题</th>
				<th width="5">题 型</th>
				<th width="10%">题库</th>
				<th width="15%">知识点</th>
				<th width="10%">创建人</th>
				<th width="10%">题目分数</th>
				<th width="10%">操作</th>
			</tr>
			<s:if test="#request.pageResult.list != null">
				<s:iterator value="#request.pageResult.list" var="tm">
					<tr>
						<td align="center"><span class="checkall"><input
								id="rptList_ctl01_chkId" type="checkbox"
								name="rptList$ctl01$chkId" /></span><input type="hidden"
							name="rptList$ctl01$hidDirName" id="rptList_ctl01_hidDirName"
							value="advert" /></td>
						<td>${tmName}</td>
						<td align="center">
							<s:if test="#tm.tmType==1">
								单选题
							</s:if>
							<s:if test="#tm.tmType==3">
								多选题
							</s:if>
							<s:if test="#tm.tmType==2">
								填空题
							</s:if>
							<s:if test="#tm.tmType==4">
								判断题
							</s:if>
							<s:if test="#tm.tmType==5">
								问答题
							</s:if>
						</td>
						<td align="center">${tk.tkName}</td>
						<td align="center">${tmZsd}</td>
						<td align="center">${tmCreateName}</td>
						<td align="center">${tmScore}</td>
						<td align="center"><a href="tm_updatePre?tmId=${tmId}">修改
						</a>&nbsp;&nbsp;<a href="javascript:void(0)" onclick="deleteTm(${tmId})">删除</a></td>
					</tr>
				</s:iterator>
			</s:if>
		</table>

		<div class="line10"></div>
		<%@include file="/WEB-INF/jsp/include/pageTab.jsp" %>
	</form>
</body>
</html>
