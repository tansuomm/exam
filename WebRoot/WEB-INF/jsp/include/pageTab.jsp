<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!-- 当前页放在影藏域中,form表单action为空（提交到当前页）js通过name提交，防止模糊查询时地址栏提交过多的参数 -->
<input type="hidden" name="pageResult.currentPage" id="hidCurrentPage" value="${pageResult.currentPage}" />
<table>
	<tr><td align="center">共${pageResult.pageCount}页${pageResult.totalNum}条   当前第${pageResult.currentPage}页
		<s:if test="#request.pageResult.currentPage > 1" >
			<a href="javascript:void(0)" onclick="firstPage()">首页</a>&nbsp;<a href="javascript:void(0)" onclick="pagePre()">上一页</a>
		</s:if>
		<s:else>
		首页 上一页
		</s:else>
		<s:if test="#request.pageResult.currentPage<#request.pageResult.pageCount">
			<a href="javascript:void(0)" onclick="pageNext()">下一页</a>&nbsp;<a href="javascript:void(0)" onclick="lastPage()">尾页</a>
		</s:if>
		<s:else>
		下一页 尾页
		</s:else>
	<input type="text" size =3; name="pageNo" id ="pageNo" value="${pageResult.currentPage }"/>
	<input type="button" value="GO" onclick="toPage()" />
	</td></tr>
</table>
<script type="text/javascript">

	function firstPage(){
		document.getElementById("hidCurrentPage").value=1;
		document.forms[0].submit();
	}	
	function pagePre(){
		var currentPage = document.getElementById("hidCurrentPage").value;
		document.getElementById("hidCurrentPage").value=parseInt(currentPage)-1;
		document.forms[0].submit();
	}
	function pageNext(){
		var currentPage = document.getElementById("hidCurrentPage").value;
		document.getElementById("hidCurrentPage").value=parseInt(currentPage)+1;
		document.forms[0].submit();
	}
	function lastPage(){
		document.getElementById("hidCurrentPage").value=${pageResult.pageCount};
		document.forms[0].submit();
	}
	function toPage(){
		var currentPage = document.getElementById("pageNo").value;
		
		var pattern = /^[0-9]*[0-9][0-9]*$/;
		if(!pattern.test(currentPage)){
			var count = ${pageResult.pageCount};
			//alert("请输入1到" + count + "间的页码");
			document.getElementById("pageNo").focus();
			return false;
		}
		document.getElementById("hidCurrentPage").value=currentPage;
		document.forms[0].submit();
	}

</script>