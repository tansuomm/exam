<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date.*,java.text.SimpleDateFormat" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>更新题目</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/html/scripts/ui/skins/Aqua/css/ligerui-all.css"
	rel="stylesheet" type="text/css" />
<link href="<%=path%>/html/images/style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="<%=path%>/html/scripts/jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/html/scripts/jquery/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/html/scripts/jquery/messages_cn.js"></script>
<script type="text/javascript"
	src="<%=path%>/html/scripts/ui/js/ligerBuild.min.js"></script>
<script type="text/javascript" src="<%=path%>/html/js/function.js"></script>
<script type="text/javascript"> 
    //表单验证
    $(function () {
        $("#form1").validate({
            errorPlacement: function (lable, element) {
                element.ligerTip({ content: lable.html(), appendIdTo: lable });
            },
            success: function(lable){
                lable.ligerHideTip();
            }
        });
    }); 
    
    //页面加载
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
	<form name="form1" method="post" action="tm_update" id="form1">
		<div class="navigation">
			<a href="javascript:history.go(-1);" class="back">后退</a>首页 &gt; 控制面板
			&gt; 题目管理
		</div>
		<div id="contentTab">
			<ul class="tab_nav">
				<li class="selected"><a onclick="tabs('#contentTab',0);"
					href="javascript:;">添加题目</a></li>
			</ul>
			<s:if test="#request.tm != null">
				<div class="tab_con" style="display: block;">
					<table class="form_table">
						<tbody>
							<tr>
								<th>题库集：</th>
								<td><s:select cssClass="select2" list="#request.tkjList"
										name="" id="selTkj" headerKey="0" headerValue="=请选择="
										listKey="tkjId" listValue="tkjName"
										value="#request.tm.tk.tkj.tkjId"></s:select> <label>*</label></td>
							</tr>
							<tr>
								<th>题库：</th>
								<td><s:select cssClass="select2" list="#request.tkList"
										name="tk.tkId" id="selTk" listKey="tkId" listValue="tkName"
										value="#request.tm.tk.tkId"></s:select> <label>*</label></td>
							</tr>
							<tr>
								<th>题目名称：</th>
								<td><input name="tmName" value="${tm.tmName}"
									type="text" id="txtTmName" class="txtInput normal required" />
									<label>*</label></td>
							</tr>
							<tr>
							<th>题目类型：</th>
							<td><select name="tmType"  id="txtContent">
									<option value="1">选择题</option>
									<option value="2">填空题</option>
									<option value="3">多选题</option>
									<option value="4">判断题</option>
									<option value="5">问答题</option>
							</select> </td>
						</tr>
							<tr>
								<th>题目分数：</th>
								<td><input  name="tmScore" value="${tm.tmScore}"
									type="text" id="txtTmScore"
									class="txtInput normal required digits" /> <label></label></td>
							</tr>
							<tr>
								<th>题目知识点：</th>
								<td><input name="tmZsd" type="text" value="${tm.tmZsd}" id="txtLinkUrl"
									class="txtInput normal required" /> <label>*</label></td>
							</tr>
							<tr>
								<th>题目难度：</th>
								<td><input name="tmNd" type="text" value="${tm.tmNd}" id="txtLogo"
									class="txtInput normal required" /></td>
							</tr>
							<tr>
								<th>题目选项：</th>
								<td><input name="tmXuanxiang" type="text" id="txtLogo"	value="${tm.tmXuanxiang }"		
									class="txtInput normal" /></td>
								<td><input type="hidden" name="tmXuanxiangNum" value="${tm.tmXuanxiangNum }" /></td>
							</tr>
								
								
							<tr>
								<th>题目答案：</th>
								<td><textarea name="tmDa" class="required" >${tm.tmDa}</textarea><label>*</label></td>
							</tr>
							<tr style="display:none">
								<th>创建人：</th>
								<td><input type="text" name="tmCreateName"    value="${user.userName}"/></td>
							</tr>
							<tr style="display:none">
							<th>创建时间：</th>
								<%
								SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
								String date= format.format(new Date());
								%>
							<td><input name="tmCreateTime" type="text" value="<%=date %>" id="txtLogo"
								class="txtInput normal" /></td>
						</tr>
							<tr>
								<th></th>
								<td><input type="submit" name="btnSubmit" value="提交保存"
									id="btnSubmit" class="btnSubmit" /> <input type="hidden"
									name="tmId" id="hidTmId" value="${tm.tmId}" /></td>
							</tr>
						</tbody>
					</table>
				</div>
			</s:if>
		</div>
	</form>
</body>
</html>
