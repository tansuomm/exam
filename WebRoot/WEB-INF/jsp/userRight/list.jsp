<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户权限列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link type="text/css" rel="stylesheet" href="<%=path%>/html/scripts/ui/skins/Aqua/css/ligerui-all.css" />
<link type="text/css" rel="stylesheet" href="<%=path%>/html/Admin/images/style.css" />
<script type="text/javascript" src="<%=path%>/html/scripts/jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/html/scripts/ui/js/ligerBuild.min.js"></script>
<script type="text/javascript" src="<%=path%>/html/Admin/js/function.js"></script>
<script type="text/javascript">
function deleteUserRight(userRightId){
	$.ligerDialog.confirm("删除不可恢复，是否继续", function (result) { 
		if(result){
			location.href="userRight_delete?userRightId=" + userRightId;
		}
		else{
			return false;
		}
	});
}
</script>
</head>
<body class="mainbody">
<form name="form1" method="post" action="" id="form1"> 
    <div class="navigation">首页 &gt; 权限管理 &gt; 用户权限</div>
    <div class="tools_box">
	    <div class="tools_bar">
            <a href="userRight_list" class="tools_btn"><span><b class="refresh">刷新列表</b></span></a>

        </div>
    </div>
 
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <th width="25%" align="center">用户名</th>
        <th width="25%" align="center">用户权限</th>
        <th width="25%" align="center">权限类别</th>
        <th width="25%" align="center">操作</th>
      </tr>
      <s:if test="#request.userRightList != null">
      <s:iterator value="#request.userRightList" var="userRight">	
	      <tr>
	 
	        <td  align="center">${user.userName}</td>
	        <td align="center">${right.rightName}</td>
	        
	        <td align="center"><s:if test="#userRight.right.parentId == 0">
	        		父权限
	        	</s:if>
	        	<s:else>
	        		子权限
	        	</s:else></td>
	        	<td align="center"><a href="javascript:void(0)" onclick="deleteUserRight(${userRightId})">删除</a></td>
	      </tr>
	     	
      </s:iterator>
      </s:if>
      <tr> <td align="center" colSpan="3"><a href="userRight_updatePre">修改</a>&nbsp;&nbsp;</tr>
    </table>
    <div class="line10"></div>
</form>
</body>
</html>



