<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>更新题库</title>
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
<form name="form1" method="post" action="tk_update" id="form1">
  <div class="navigation"><a href="javascript:history.go(-1);" class="back">后退</a>首页 &gt; 控制面板 &gt; 修改题目</div>
  <div id="contentTab">
    <ul class="tab_nav">
      <li class="selected"><a onclick="tabs('#contentTab',0);" href="javascript:;">编辑题目</a></li>
    </ul>
    <div class="tab_con" style="display:block;">
      <table class="form_table">
        <col width="180px"/>
        <tbody>
        <tr>
         <th>题库集：</th>
            <td>
            	<s:select cssClass="select2" list="#request.tkjList" name="tkj.tkjId" id="seltkj"
            			headerKey="0" headerValue="=请选择=" listKey="tkjId" listValue="tkjName"
            		    value="#request.tk.tkj.tkjId"></s:select>
              	<label>*</label>
            </td>
          </tr>
          <tr>
            <th>题库名称：</th>
            <td><input name="tkName" value="${tk.tkName}" type="text" id="txtscore" class="txtInput normal required" />
              <input  name="tkId" type="hidden" value="${tk.tkId }"/>
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