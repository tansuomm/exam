<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>权限管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link type="text/css" rel="stylesheet" href="<%=path%>/html/scripts/ui/skins/Aqua/css/ligerui-all.css" />
<link type="text/css" rel="stylesheet" href="<%=path%>/html/Admin/images/style.css" />
<script type="text/javascript" src="<%=path%>/html/scripts/jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/html/scripts/ui/js/ligerBuild.min.js"></script>
<script type="text/javascript" src="<%=path%>/html/Admin/js/function.js"></script>
<script type="text/javascript" language="javascript">
	function deleteRight(rightId){
		//boolean
		//if(confirm("删除不可恢复，是否继续")){
			//true
		//	location.href="tm_delete?tm.tmId=" + tmId;
		//}
		//else{
		//	return false;
		//}
		
		$.ligerDialog.confirm("删除不可恢复，是否继续", function (result) { 
			if(result){
				location.href="right_delete?right.rightId=" + rightId;
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
    <div class="navigation">首页 &gt; 权限管理 &gt; 权限列表</div>
    <div class="tools_box">
	    <div class="tools_bar">
            <a href="right_list" class="tools_btn"><span><b class="refresh">刷新内容</b></span></a>
        </div>
    </div>
 
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <th width="25%" align="center">权限名称</th>
      	<th width="25%" align="center">权限类型</th>
      </tr>
      <s:if test="#request.rightList != null">
      <s:iterator value="#request.rightList" var="right">	
	      <tr>
	        <td align="center">${rightName }</td>
	        <td align="center">
	        	<s:if test="#right.parentId == 0">
	        		父权限
	        	</s:if>
	        	<s:else>
	        		子权限
	        	</s:else>
	        </td>
	      </tr>
      </s:iterator>
      </s:if>
    </table>
    
    <div class="line10"></div>
</form>
</body>
</html>



