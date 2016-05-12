<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>题库管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link type="text/css" rel="stylesheet" href="<%=path%>/html/scripts/ui/skins/Aqua/css/ligerui-all.css" />
<link type="text/css" rel="stylesheet" href="<%=path%>/html/Admin/images/style.css" />
<script type="text/javascript" src="<%=path%>/html/scripts/jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/html/scripts/ui/js/ligerBuild.min.js"></script>
<script type="text/javascript" src="<%=path%>/html/Admin/js/function.js"></script>
<script type="text/javascript" language="javascript">
	function deleteTk(tkId){
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
				location.href="tk_delete?tkId=" + tkId;
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
    <div class="navigation">首页 &gt; 控制面板 &gt; 题库管理</div>
    <div class="tools_box">
	    <div class="tools_bar">
		    <a href="javascript:void(0);" onclick="checkAll(this);" class="tools_btn"><span><b class="all">全选</b></span></a>
            <a href="tk_addPre" class="tools_btn"><span><b class="import">添加题库</b></span></a>
                <a href="tk_list" class="tools_btn"><span><b class="refresh">刷新内容</b></span></a>
           <%--  <a href="####" class="tools_btn"><span><b class="delete">批量删除</b></span></a> --%>
        </div>
    </div>
 
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <th width="10%">选择</th>
        <th width="40%" align="center">题库集</th>
        <th width="30%">题库</th>
        <th width="20%">操作</th>
      </tr>
      <s:if test="#request.tkList != null">
      <s:iterator value="#request.tkList" >	
	      <tr>
	        <td align="center"><span class="checkall">
		        <input id="rptList_ctl01_chkId" type="checkbox" name="rptList$ctl01$chkId" /></span>
		        <input type="hidden" name="rptList$ctl01$hidDirName" id="rptList_ctl01_hidDirName" value="advert" />
	        </td>
	        <td align="center">${tkj.tkjName }</td>
	        <td align="center">${tkName}</td>
	        <td align="center"><a href="tk_updatePre?tkId=${tkId}">修改</a>&nbsp;&nbsp;
	          <a href="javascript:void(0)" onclick="deleteTk(${tkId})">删除</a></td>
	      </tr>
      </s:iterator>
      </s:if>
    </table>
    
    <div class="line10"></div>
</form>
</body>
</html>


