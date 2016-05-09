<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>友情链接</title>
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
    	$("#selTkj").bind('input propertychange',(function(){
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
    	}));
    });
    	
</script>
</head>
<body class="mainbody">
	<form name="form1" method="post" action="tm_add" id="form1">
		<div class="navigation">
			<a href="javascript:history.go(-1);" class="back">后退</a>首页 &gt; 控制面板
			&gt; 题目管理
		</div>
		<div id="contentTab">
			<ul class="tab_nav">
				<li class="selected"><a onclick="tabs('#contentTab',0);"
					href="javascript:;">添加题目</a></li>
			</ul>
			<div class="tab_con" style="display: block;">
				<table class="form_table">
					<col width="180px">
					<col>
					<tbody>
						<tr>
							<th>题库集：</th>
							<td><s:select cssClass="select2" list="#request.tkjList"
									name="" id="selTkj" headerKey="0" headerValue="=请选择="
									listKey="tkjId" listValue="tkjName"></s:select> <label>*</label></td>
						</tr>
						<tr>
							<th>题库：</th>
							<td><select name="tm.tk.tkId" id="selTk" disabled>
									<option value="0">=请选择=</option>
							</select> <label>*</label></td>
						</tr>
						<tr>
							<th>题目名称：</th>
							<td><input name="tm.tmName" type="text" id="txt####"
								class="txtInput normal required" /> <label>*</label></td>
						</tr>
						<tr>
							<th>题目分数：</th>
							<td><input name="tm.tmScore" type="text" id="txtContent"
								class="txtInput normal" /> <label></label></td>
						</tr>
						<tr>
							<th>题目知识点：</th>
							<td><input name="tm.tmZsd" type="text" id="txtLinkUrl"
								class="txtInput normal required" /> <label>*</label></td>
						</tr>
						<tr>
							<th>题目难度：</th>
							<td><input name="tm.tmNd" type="text" id="txtLogo"
								class="txtInput normal" /></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="submit" name="btnSubmit" value="提交保存"
								id="btnSubmit" class="btnSubmit" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
</body>
</html>

