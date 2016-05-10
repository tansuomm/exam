<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>修改题库集</title>
<meta http-equiv="Content-Type" content="text/html; charset="utf-8" />
<link href="<%=path %>/html/scripts/ui/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/html/Admin/images/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/html/scripts/jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/html/scripts/jquery/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=path %>/html/scripts/jquery/messages_cn.js"></script>
<script type="text/javascript" src="<%=path %>/html/scripts/ui/js/ligerBuild.min.js"></script>
<script type="text/javascript" src="<%=path %>/html/Admin/js/function.js"></script>
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
<form name="form1" method="post" action="tkj_update" id="form1">
  <div class="navigation"><a href="javascript:history.go(-1);" class="back">后退</a>首页 &gt; 控制面板 &gt; 修改题库集</div>
  <div id="contentTab">
    <ul class="tab_nav">
      <li class="selected"><a onclick="tabs('#contentTab',0);" href="javascript:;">编辑题库集</a></li>
    </ul>
    <div class="tab_con" style="display:block;">
      <table class="form_table">
        <col width="180px"/>
        <tbody>
         
          <tr>
            <th>题库集名称：</th>
            <td><input name="tkjName" value="${tkj.tkjName}"  type="text" id="txtTkjName" class="txtInput normal required" />
              	<input  name="tkjId" type="hidden" value="${tkj.tkjId }"/> 
              <label>*</label></td>
          </tr>
          <tr>
            <th></th>
            <td><input type="submit" name="btnSubmit" value="提交保存" id="btnSubmit" class="btnSubmit" /></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</form>
</body>
</html>