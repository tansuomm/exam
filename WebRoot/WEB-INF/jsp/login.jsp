<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>管理员登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<link href="<%=path %>/html/css/loginstyle.css" rel="stylesheet" type="text/css" />
<script src="<%=path %>/html/scripts/jquery-1.4.2.min.js" type="text/javascript"></script>
</head>
<body>
<div id="login">
  <div class="login">
  <form id="login-form" action="login" method="post" onsubmit="return valid()">
    <div class="login-left">
    <table>
      <tbody>
        <tr>
          <td>账号：</td>
          <td><input type="text" id="txtUserName" name="userName" /></td>
        </tr>
        <tr>
          <td>密码：</td>
          <td><input  type="password" name="userPwd" id="txtUserPwd"/></td>
        </tr>
        <tr>
          <td>验证：</td>
          <td><input type="text" class="yzm" value="" name="imgCode" id="imgCode"/> <img id="img1"  alt="换一张" src="user_imgCode"/></td>
        </tr>
      </tbody>
    </table>
    </div>
    <div class="login-right">
    <input id="login-btn" type="submit" value="" />
    </div>
    <input id ="isImg" type="hidden" value="fail" /> 
    </form>
  </div>
</div>
</body>
<script type="text/javascript">
// JavaScript Document
	$.noConflict();
    //更换验证码
	jQuery("#img1").click(function(){
		jQuery("#img1").attr("src","user_imgCode?"+new Date().getTime());
	});
	//验证码输入判断
	jQuery("#imgCode").bind('input propertychange',function(){
		jQuery.ajax({
			  url: 'user _isImgCode',
			  type: 'POST',
			  data:"imgCode="+jQuery("#imgCode").val(),
			  /* data:"{'useremail':'jQuery(\"#mobileOremail\").val()','usermobile':'jQuery(\"#mobileOremail\").val()'}", */
			  success: function(msg){
			   	if (jQuery.trim(msg)!="") {
			   		jQuery("#isImg").val(msg);
			   	}
			  }
			});	
		
	});
	/* 提交判断 */	
 	function valid(){
		
		if(jQuery("#txtUserName").val()==""){
			/* jQuery("#span2").html("用户名不能为空"); */
			alert("用户名不能为空");
			return false;
		}
		if(jQuery("#txtUserPwd").val()==""){
			/* jQuery("#span3").html("密码不能为空"); */
			alert("密码不能为空");
			return false;
		}
		if(jQuery("#imgCode").val()==""){
			alert("验证码不能为空");
			return false;
		}
		//alert(!(jQuery("#isImg").val().trim()=="success"));
		if(!(jQuery("#isImg").val().trim()=="success")){
			alert("验证码输入错误");
			return false;
		}
		return true;
	}

</script>
</html>
