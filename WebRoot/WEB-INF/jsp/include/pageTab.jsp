<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<table>
	<tr><td align="center">共${pageResult.pageCount}页${pageResult.totalNum}条   当前第${pageResult.currentPage}页
		<s:if test="#request.pageResult.currentPage > 1" >
			<a href="?pageResult.currentPage=1">首页</a>&nbsp;<a href="?pageResult.currentPage=${pageResult.currentPage-1}">上一页</a>
		</s:if>
		<s:else>
		首页 上一页
		</s:else>
		<s:if test="#request.pageResult.currentPage<#request.pageResult.pageCount">
			<a href="?pageResult.currentPage=${pageResult.currentPage+1}">下一页</a>&nbsp;<a href="?pageResult.currentPage=${pageResult.pageCount}">尾页</a>
		</s:if>
		<s:else>
		下一页 尾页
		</s:else>
	</td></tr>
</table>