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

<script type="text/javascript"
	src="<%=path%>/html/scripts/jquery/jquery-1.3.2.min.js"></script>

</head>
<body>
<form action="login" method="post" onsubmit="return valid()">
	<input  type="text" name="userName" id="txtUserName"/>
	<input  type="password" name="userPwd" id="txtUserPwd"/>
           
    <input type="text" class="yzm" value="" name="imgCode" id="imgCode"/>
    <img id="img1"  alt="换一张" src="user_imgCode"/>
	<input id ="isImg" type="hidden" value="fail"/>
                       
                   
	<input  type="submit"	id="btn" value="登录"/><span id="uspan"></span>
</form>

</body>

<script type="text/javascript"> 
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
		if(jQuery("#txtUserName")==""){
			/* jQuery("#span2").html("用户名不能为空"); */
			alert("用户名不能为空");
			return false;
		}
		if(jQuery("#txtUserPwd")==""){
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
