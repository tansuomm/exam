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