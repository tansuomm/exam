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
<title>用户授权</title>
<meta http-equiv="Content-Type" content="text/html; charset=" UTF-8" />
<link href="<%=path%>/html/scripts/ui/skins/Aqua/css/ligerui-all.css"
	rel="stylesheet" type="text/css" />
<link href="<%=path%>/html/Admin/images/style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="<%=path%>/html/scripts/jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/html/scripts/jquery/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/html/scripts/jquery/messages_cn.js"></script>
<script type="text/javascript"
	src="<%=path%>/html/scripts/ui/js/ligerBuild.min.js"></script>
<script type="text/javascript" src="<%=path%>/html/Admin/js/function.js"></script>
<script type="text/javascript">
	//表单验证
	$(function() {
		$("#form1").validate({
			errorPlacement : function(lable, element) {
				element.ligerTip({
					content : lable.html(),
					appendIdTo : lable
				});
			},
			success : function(lable) {
				lable.ligerHideTip();
			}
		});
	});
	/* $(document).ready(function(){
	
		$("#seltkj").change(function(){
			$.ajax({
				
				type:"post",
				url:"tk_findBytkjId",
				data:"tkjId="+$("#seltkj").val(),
				success:function(msg){
				
					if($.trim(msg) !=""){
						$("#seltk").attr("disabled",false);
						$("#seltk").html(msg);
					}
					else{
						$("seltk").attr("disabled",true);
						$("seltk").html("")
						
					}
				}
			});
		});
	}); */
</script>
</head>
<body class="mainbody">
	<form name="form1" method="post" action="userRight_update" id="form1">
		<div class="navigation">
			<a href="javascript:history.go(-1);" class="back">后退</a>首页 &gt; 权限管理
			&gt;授予权限
		</div>
		<div id="contentTab">
			<ul class="tab_nav">
				<li class="selected"><a onclick="tabs('#contentTab',0);"
					href="javascript:;">编辑权限</a></li>
			</ul>
			<div class="tab_con" style="display: block;">
				<table class="form_table">
					<col width="180px"></col>
					<tbody>
								<tr>

									<td><select name="user.userId">
											<s:iterator value="#request.userList" status="user">
											

													<option value="${userId}"><s:property value="userName"></s:property></option>

											
											</s:iterator>
									</select></td>
									
									
									<td><select id="sel" name="listCheck">
											<s:iterator value="#request.rightList" status="right">
												<s:if test="parentId==0">

													<option id="num" value="${rightId}"><s:property value="rightName"></s:property></option>
													
												</s:if>
											</s:iterator>
									</select></td>

									<!-- 父权限下的子权限 "<s:property value='right.{?#this.parentId==0}{rightId}[2]'></s:property>" -->
									<!-- 数据库权限表结构有规律+1,2,3 -->
									
									<td><input type="checkbox" name="listCheck"
									
										id="num1" value="" />增加
										<input type="checkbox" name="listCheck"
										id="num2" value="" />删除
										<input type="checkbox" name="listCheck"
										id="num3" value= ""/>修改

									</td>
								</tr>
								<script type="text/javascript">
									$("#sel").change(function(){
										
										var num = $("#sel").val();
										var nume = parseInt(num);
										
										$("#num1").val(nume+1+'');
										$("#num2").val(nume+2+'');
										$("#num3").val(nume+3+'');
										
									});		
									</script>
						<tr>
							<th></th>
							<td><input type="submit" name="btnSubmit" value="增加权限"
								id="btnSubmit" class="btnSubmit" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
</body>
</html>