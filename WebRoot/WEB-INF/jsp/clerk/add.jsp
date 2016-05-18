<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>学生添加</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link type="text/css" rel="stylesheet" href="<%=path%>/html/scripts/ui/skins/Aqua/css/ligerui-all.css" />
<link type="text/css" rel="stylesheet" href="<%=path%>/html/Admin/images/style.css" />
<script type="text/javascript" src="<%=path%>/html/scripts/jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/html/scripts/ui/js/ligerBuild.min.js"></script>
<script type="text/javascript" src="<%=path%>/html/Admin/js/function.js"></script>
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
    /*  $(document).ready(function(){
    
    	$("#selcls").change(function(){
    		$.ajax({
    			
    			type:"post",
    			url:"cls_findById",
    			data:"classId="+$("#selcls").val(),
    			success:function(msg){
    			
    				if($.trim(msg) !=""){
    					$("#selcls").attr("disabled",false);
    					$("#selcls").html(msg);
    				}
    				else{
    					$("selcls").attr("disabled",true);
    					$("selcls").html("")
    					
    				}
    			}
    		});
    	});
    });  */
</script>
</head>
<body class="mainbody">
<form name="form1" method="post" action="clerk_add" id="form1">
  <div class="navigation"><a href="javascript:history.go(-1);" class="back">后退</a>首页 &gt; 控制面板 &gt;知识点管理</div>
  <div id="contentTab">
    <ul class="tab_nav">
      <li class="selected"><a onclick="tabs('#contentTab',0);" href="javascript:;">编辑知识点</a></li>
    </ul>
    <div class="tab_con" style="display:block;">
      <table class="form_table">
        <col width="180px"></col>
        <tbody>
          <tr>
          	
            <th>班级：</th>
            <td>
            <input name="classId" type="hidden" value="${clerk.classes.classId}" />
            	<s:select cssClass="select2" list="#request.classes" name="classes.classId" id="selcls"
            			headerKey="0" headerValue="=请选择=" listKey="classId" listValue="classname"
            		    ></s:select>
            		    
              	<label>*</label>
            </td>
          </tr>
          <tr>
            <th>姓名：</th>
            <td><input name="name"  type="text" id="txtname" class="txtInput normal required" />
              </td>
          </tr>
          <tr>
            <th>学号：</th>
            <td><input name="clerkxuehao"  type="text" id="clerkxuehao" class="txtInput normal required" />
              </td>
          </tr>
          <tr>
            <th>密码：</th>
            <td><input name="clerkpwd"  type="text" id="clerkpwd" class="txtInput normal required" />
              </td>
          </tr>
          <tr>
            <th><input name="clerkId" type="hidden" value="${clerkId}" /></th>
            <td><input type="submit" name="btnSubmit" value="提交保存" id="btnSubmit" class="btnSubmit" /></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</form>
</body>
</html>