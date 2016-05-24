<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<%=path%>/html/scripts/jquery/jquery-1.3.2.min.js"></script>
</head>
<body>
	<form action="tkcl_saveSj" method="post">
	 
	<textarea id="sjInfo">{'clerkId':2,'tkClId':2,'clerkKsStatus':1,'clerkKsBtime':1463564430000,'clerkKsEtime':1463564450000,'cj':60,'clerkXzdf':60,'clerkWddf':0,'ksTime':60,'clerk_pj':null,'answerGather':'&lt;ROOTSTUB global="true" prefix_259="6" mark_259="0" prefix_260="6" mark_260="0" prefix_251="b" mark_251="0" prefix_252="a" mark_252="0" prefix_257="ac" mark_257="0" prefix_258="b" mark_258="0" prefix_253="0" mark_253="0" prefix_254="0" mark_254="0" prefix_255="66" mark_255="0" prefix_256="66" mark_256="0"/&gt;'}</textarea> 
		<input type="button" name="submit" onclick="ss()" value="submit">
	</form>
	
</body>
<script type="text/javascript">
function ss(){
	alert($("#sjInfo").text());
	$.ajax(
            {type : "POST",
             data:"sjInfo="+""+$('#sjInfo').text(),
             url : "tkcl_saveSj",
       
             success : function(msg){
				alert(msg);
			}
}
            );
}
</script>

</html>