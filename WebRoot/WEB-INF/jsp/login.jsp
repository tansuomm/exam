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
        //检测IE
        if ($.browser.msie && $.browser.version == "6.0") {
            window.location.href = 'ie6update.html';
        }
        $('#txtUserName').focus();
        $("#form1").validate({
            errorPlacement: function (lable, element) {
                element.ligerTip({ content: lable.html(), appendIdTo: lable });
            },
            success: function(lable){
                lable.ligerHideTip();
            }
        });
    });
</script>
</head>
<body class="loginbody">
	<form name="form1" method="post" action="login.aspx" id="form1">
		<div>
			<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE"
				value="/wEPDwUKLTkwMDUzNjM2N2QYAQUeX19Db250cm9sc1JlcXVpcmVQb3N0QmFja0tleV9fFgEFDGNiUmVtZW1iZXJJZD2SF5g1hwquguGQda2iMgPcg5fD" />
		</div>
		<div>
			<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION"
				value="/wEWBgKSlaiJCgKl1bKzCQLG8eCkDwLChPzDDQLCi9reAwLDndTvCWfMdF0mpKBp3AFMne4czrMX/LzW" />
		</div>
		<div class="login_div">
			<div class="login_box">
				<div class="login_logo">LOGO</div>
				<div class="login_content">
					<dl>
						<dt>登录账号：</dt>
						<dd>
							<input name="txtUserName" type="text" value="admin"
								id="txtUserName" class="login_input required"
								style="width: 130px;" />
						</dd>
					</dl>
					<dl>
						<dt>登录密码：</dt>
						<dd>
							<input name="txtUserPwd" type="password" id="txtUserPwd"
								class="login_input required" style="width: 130px;" />
						</dd>
					</dl>
					<dl>
						<dt>验证码：</dt>
						<dd>
							<input name="txtCode" type="text" maxlength="6" id="txtCode"
								class="login_input required"
								style="width: 55px; text-transform: uppercase;" /> <img
								src="../tools/verify_code.ashx" width="70" height="22"
								alt="点击切换验证码" title="点击切换验证码"
								style="margin-top: 2px; vertical-align: top; cursor: pointer;"
								onclick="ToggleCode(this, '../tools/verify_code.ashx');return false;" />
						</dd>
					</dl>
				</div>
				<div class="login_foot">
					<div class="right">
						<input type="submit" name="btnSubmit" value="登 录" id="btnSubmit"
							class="login_btn" />
					</div>
					<span> <input id="cbRememberId" type="checkbox"
						name="cbRememberId" checked="checked" /> <label
						for="cbRememberId">记住用户名</label>
					</span>
				</div>
				<div class="login_tip"></div>
			</div>
			<div class="login_copyright">
				Copyright ? 2001 - 2013 Feedtech.com.cn Inc. All Rights Reserved.<br />
				康华远景 版权所有
			</div>
		</div>
	</form>
</body>
</html>

