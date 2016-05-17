<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
// SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//String currentTime = format.format(new Date());
//request.setAttribute("currentTime", currentTime); 
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> 

<head id="Head1">
<link href="<%=path%>/html/App_Themes/Default_Admin/public.css"
	type="text/css" rel="stylesheet" />
<title>网上考试试卷</title>
<script language="javascript" type="text/javascript"
	src="<%=path%>/html/App_JavaScript/jquery-1.3.2.min.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=path%>/html/App_JavaScript/Admin/main.js"></script>

<link href="<%=path%>/html/App_Css/Admin/ExamManage/openWindow.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=path%>/html/App_Css/Admin/ExamManage/window/window_TestPaper_add.css"
	rel="stylesheet" type="text/css" />

<script language="javascript"
	src="<%=path%>/html/App_JavaScript/Admin/ucStudentManage/openWindow.js"
	type="text/javascript"></script>

<script type="text/javascript"
	src="<%=path%>/html/App_JavaScript/Admin/chkData.js"></script>

<script language="javascript" type="text/javascript"
	src="<%=path%>/html/App_JavaScript/My97DatePicker/WdatePicker.js"></script>

<style type="text/css">
<!--
.row {
	vertical-align: top;
}

#main {
	margin: auto;
	width: 98%
}

fieldset {
	margin-bottom: 0px;
}

fieldset table {
	margin-top: 5px;
}

.btn_Group {
	text-align: center;
	margin-top: 0px;
}

#showPage_1, #showPage_2, #showPage_3 {
	vertical-align: top;
	height: 520px;
	padding-top: 10px;
	border-bottom: 1px solid #cacaca;
	border-left: 1px solid #cacaca;
	border-right: 1px solid #cacaca;
}

.this_height {
	height: 94%;
} /*按钮与页底的距离*/
.ButtonWhite {
	background-image: url(<%=path%>/html/App_Image/Admin/two_button_w.gif);
	height: 20px;
	width: 47px;
	border: 0px outset;
	font-family: "Verdana, Arial, sans-serif";
	color: #000;
	cursor: hand;
	line-height: 20px;
}
-->
</style>
</head>
<body onunload="CloseWin()">
	<form name="form1" method="post" action="tkcl_add.action"
		onsubmit="javascript:return WebForm_OnSubmit();" id="form1">
		<div>
			<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
			<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT"
				value="" />
		</div>

	 <script type="text/javascript">
			//<![CDATA[
			var theForm = document.forms['form1'];
			if (!theForm) {
				theForm = document.form1;
			}
			function __doPostBack(eventTarget, eventArgument) {
				if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
					theForm.__EVENTTARGET.value = eventTarget;
					theForm.__EVENTARGUMENT.value = eventArgument;
					theForm.submit();
				}
			}
			//]]>
		</script> 


	<%-- 	<script
			src="/WebResource.axd?d=K1T1k6_SvQNsqIbaADWrIyiSxyPSS2aUxFlCsm0c_zCJS4DHX-Bn_3L--Y0Ib1aC8pEEbMZDUpY48wZKLhdhGRQAf7A1&amp;t=635588912026805809"
			type="text/javascript"></script>


		<script
			src="/ScriptResource.axd?d=8XX2xW3hjK3syPgw5CG839kyg7pNDZN7KKEEvDKGX2mw6rdyY_K1AV4KpYwqB8RQL0T-pyeOXrJONcng_zYsjgdInS8WzGeDs5rI0s9UICyBBH7CZgo4BDUtRDAqtnsXwxRAOJ4AcGmBo98GW17Mjc3oOh01&amp;t=635588912026805809"
			type="text/javascript"></script>
		<script
			src="/ScriptResource.axd?d=U7S7sh_NK1FPSLOjv12L6jBtl5XJQAW5Tw0rDSQTabtQHuo8qXu1L6Tspqo0QkvQ8_qeDzvgcDlkw43dy4-Se-OkpSlW7L_3i4pYar0IKrRGQYEjHy1xUetEfRPuv3-2Dn5WPuVd3uZX21kaO4QexfbzZpIPyM4SK0sGq2A4ImVuSCqC0&amp;t=635963139320786431"
			type="text/javascript"></script>
		<script
			src="/ScriptResource.axd?d=QflX79tfYIfGD4_Eo7R2KfHa_UuKNST_KDiOMz7r6Pk_7qa-TNSTjug0x8KjmVmkX7EC8RL3AHiV3mBHcBUZdEiJ84Nt9QUF2ON6tGVd6aIxMtjW7MwPBHVeC8Th40W0M8jTUcObYxBbK7WDPc6ArOOchDDB_Xn0p5b4h-hXoaq-ay2e0&amp;t=635963139320786431"
			type="text/javascript"></script> --%>
		<script type="text/javascript">
			//<![CDATA[
			 function WebForm_OnSubmit() {
				//分数
				if (typeof (ValidatorOnSubmit) == "function"
						&& ValidatorOnSubmit() == false)
					return false;
				return CheckForm();
				return true;
			} 
			//]]>
		</script>

		<div>

			<input type="hidden" name="__VIEWSTATEGENERATOR"
				id="__VIEWSTATEGENERATOR" value="796F32AD" />
		</div>
		<script type="text/javascript">
			/* <![CDATA[
			Sys.WebForms.PageRequestManager._initialize('ScriptManager1',
				document.getElementById('form1'));
			Sys.WebForms.PageRequestManager.getInstance()._updateControls([],
					[], [], 90);
			]]> */
		</script>


		<script language="javascript" type="text/javascript">
			var TXID = 'SelectedTX';

			function InitExamTX(pageLoad) {
				//根据name名字去查找找到的是数组
				//题目题型复选框
				var obj = document.getElementsByName("Tm_tx_ID");
				//变量 tx 空
				var tx = "";
				//定义一个数组
				var txnameArr = new Array();
				//变量 isAdd
				var isAdd;
				//题型设置分数总和
				var scoreNum = 0;
				var scoreTotalNum = parseInt($("#is_100").val());
				//对题目题型进行循环
				
				for (var i = 0; i < obj.length; i++) {
					isAdd = true;
					//如果正在循环的复选框被选中
					if (obj[i].checked) {
						
						
						//
						if (isAdd) {
							//tx +=  正在循环的复选框值 + ","
							//1,3,4
							tx += obj[i].value + ",";
							//备选中的分数总和为设置的分数总和 ？，否则返回2
							var a = "score_"+(i+1);
							
							scoreNum += parseInt($("#"+a).val());
							
							
							//数组[数组的长度]
							//数组最后一个值
							//正在循环的复选框父节点的下一个
							//nextSibling 属性可返回某个元素之后紧跟的元素（处于同一树层级中）。如果无此节点，则属性返回 null。
							
							txnameArr[txnameArr.length] = obj[i].parentNode.nextSibling.nextSibling.innerText;
						}
					}
				}
								//如果tx不为空
				//至少选择了一个复选框
				if (tx != "") {
					if(parseInt(scoreTotalNum)!=scoreNum){
						window.alert("设置的总分数与每种题型分数总和不符，请重新设置！");
						changeTabThree('2');
					}

					//定义变量
					//substr 字符串从第几位取到第几位
					//从0到总长度减一
					//去掉最后一个字符  最后一个,
					var TXValue = tx.substr(0, tx.length - 1);
					//document.getElementById(TXID).value 得到  SelectedTX 这个控件(表单、元素) 的值
					//如果隐藏域的值 和 TXValue 相同
					if (document.getElementById(TXID).value == TXValue) {
						SetTMTotalNum();
						//返回 后面的代码不再执行
						return;
					}
					//如果隐藏域的值 和 TXValue不同
					//给隐藏域赋值
					document.getElementById(TXID).value = TXValue;
					//根据Id去查找
					//表格
					var myTable = document.getElementById("PolicyTable");
					//每个表格都有行 <tr>表示
					//对表格的行（rows）进行循环
					for (var i = myTable.rows.length - 1; i >= 0; i--) {
						//删除行
						myTable.deleteRow(i);
					}
					//定义变量 = 表格.插入行
					var myNewRow = myTable.insertRow();
					//插入行的样式是  tab_label
					myNewRow.className = "tab_label";
					//高度24
					myNewRow.height = 24;
					//InsertCell方法
					//参数  插入的行  字符串  位置 数字
					InsertCell(myNewRow, "题库集", "center", 100);
					InsertCell(myNewRow, "题库", "center", 100);
					
					//对上面自己建立的数组 txnameArr  （单选题,填空题……） 进行循环
					for (var i = 0; i < txnameArr.length; i++) {
						InsertCell(myNewRow, txnameArr[i], "center", 100);
					}
					InsertCell(myNewRow, "操作", "center", 50);
					//又建立了一行
					var myNewRow = myTable.insertRow();
					myNewRow.className = "tab_label";
					myNewRow.height = 24;
					//4 合并单元格
					InsertCell(myNewRow, "总计", "center", 100, 2);
					//对 txidArr 进行循环 按照,劈分
					var txidArr = TXValue.split(",");
					//循环
					for (var i = 0; i < txidArr.length; i++) {
						//内容  是文本框
						InsertCell(
								myNewRow,
								"<input type='text' readonly='readonly' style='width:20px;background-color:#FFFF80' id='stat_" + txidArr[i] + "'>",
								"center", 100);
					}
					InsertCell(myNewRow, "&nbsp;", "center", 50);
					//表格宽度 400+数组长度*100
					myTable.width = 400 + txnameArr.length * 100;

				} else {
					window.alert("您最少需选取1种题型参与试卷组成操作");
					changeTabThree('2');
				}
			}

			/* function DoStart() {
				document.getElementById("btn_Submit").disabled = false;
			} */

			function ActiveTabChanged(sender, e) {
				if (sender.get_activeTab().get_tabIndex() == 2) {
					InitExamTX();
				}
				if (sender.get_activeTab().get_tabIndex() == 1) {
					RedomTxSet();
				}
			}

			//得到题库列表
			//参数题库集Id
			function GetTKList(tkjid) {
				var objid = "TKList";
				//查找Id是 TKList
				//让题库的下拉框内容清空
				document.getElementById(objid).innerHTML = "";
				//通过 InsertOption 方法
				//参数  题库  字符(题库加载中...)  -1
				InsertOption(document.getElementById(objid), '题库加载中...', '-1');
				//禁用
				document.getElementById(objid).disabled = true;

				//ajax
				$.ajax({
					//post提交	
					type : "POST",
					//地址
					url : "tk_findTkByTkjId",
					//地址栏传值
					//题库集下拉框选中的值  题库集主键Id
					data : "tkjId=" + tkjid,
					//成功
					success : function(msg) {
						//alert(msg);
						//有返回值
						if ($.trim(msg) != "") {
							//题库
							//attr 属性  把 disabled属性 设置为 false
							$("#" + objid).attr("disabled", false);
							$("#" + objid).html(msg);
							//题库集发生变化
							//题库进而发生了变化
							//哪个题库被默认选中
							//alert(document.getElementById(objid).value);
							//GetZSDList(tkjid, $("#" + objid).val());
						} else {
							$("#" + objid).attr("disabled", true);
							$("#" + objid).html(
									"<option value='0'>=暂无题库=</option>");
						}
					}
				});
			}

			//根据题库集Id和 题库的Id 得到知识点
		/* 	function GetZSDList(tkjid, tkid) {
				var objid = "ZSDList";
				//让知识点下拉框清空
				document.getElementById(objid).innerHTML = "";
				//
				InsertOption(document.getElementById(objid), '知识点加载中...', '-1');
				//禁用
				document.getElementById(objid).disabled = true;

				//ajax
				$.ajax({
					//post提交	
					type : "POST",
					//地址
					//根据题库Id得到知识点
					url : "tm_findZsdByTkId",
					//地址栏传值
					//题库下拉框选中的值  题库主键Id
					data : "tkjId=" + tkjid + "&tkId=" + tkid,
					//成功
					success : function(msg) {
						//alert(msg);
						//有返回值
						if ($.trim(msg) != "") {
							//题库
							//attr 属性  把 disabled属性 设置为 false
							$("#" + objid).attr("disabled", false);
							//innerHTML
							$("#" + objid).html(msg);
						} else {
							$("#" + objid).attr("disabled", true);
							$("#" + objid).html(
									"<option value='暂无知识点'>=暂无知识点=</option>");
						}
					}
				});
			} */

			function PolicyEnabled(k) {
				var myObj = document.getElementById("PolicyTable")
						.getElementsByTagName("INPUT");
				for (var i = 0; i < myObj.length; i++) {
					myObj[i].disabled = k;
				}

				document.getElementById('tmtx_all').disabled = k;

				myObj = document.getElementsByName("Tm_tx_ID");
				for (var i = 0; i < myObj.length; i++) {
					myObj[i].disabled = k;
				}
			}

			var tkjName = "";
			//添加题库策略
			function PolicyAdd() {
				if ($("#TKJList").val() == -1) {
					alert("请选择题库集");
					document.getElementById("TKJList").focus();
					return false;
				}
				//alert("tkjid=" + $("#TKJList").val() + "&tkid=" + $("#TKList").val() + "&zsd=" + $("#ZSDList").val() + 
				//  		   "&nd=" + $("#NDList").val() + "&tx=" + $("#SelectedTX").val());
				//按钮禁用
				//document.getElementById('PolicyAddButton').disabled = true;
				//ajax
				
				$.ajax({
					//post提交	
					type : "POST",
					//地址
					//根据题库集Id题库Id知识点题目题型抽题
					url : "tm_findTmByTkjIdTkId",
					//地址栏传值
					//题库集 题库 知识点 难度 题型
					data : "tkjId=" +$("#TKJList").val() + "&tkId="
							+ $("#TKList").val()
							
							+ "&tx=" + $("#SelectedTX").val(),
					//成功
					success : function(msg) {
						//返回字符串 
						//alert(msg);
						//[{"tmTxId":1,"tmTxNum":4},{"tmTxId":2,"tmTxNum":1},{"tmTxId":3,"tmTxNum":1}] 
						//{"tkjName":"计算机系","list":[{"tmTxId":1,"tmTxNum":4},{"tmTxId":2,"tmTxNum":1},{"tmTxId":3,"tmTxNum":1}]}
						//把字符串转成json格式
						var json = eval("(" + msg + ")");
						if (chkTk($("#TKJList option:selected").text(), $(
								"#TKList option:selected").text())) {
							if (json.list.length > 0) {
								AddRow(json);
							} else {
								alert("上述选择没有题目");
								return false;
							}
						}
					}
				});

				/*             var LocationUrl;
				 LocationUrl = "ExamPolicyAdd.ashx";
				 LocationUrl += "?TKJID=" + document.getElementById('TKJList').value;
				 LocationUrl += "&TKID=" + document.getElementById('TKList').value;
				 LocationUrl += "&ZSD=" + escape(document.getElementById('ZSDList').value);
				 LocationUrl += "&ND=" + document.getElementById('NDList').value;
				 LocationUrl += "&TX=" + document.getElementById('SelectedTX').value;
				 document.getElementById('PolicyScript').src=LocationUrl; */
			}

			//添加一行
			function AddRow(json) {
				//通过Id找到表格 赋值给 myTable变量
				var myTable = document.getElementById("PolicyTable");
				//给表格增加一行
				var myNewRow = myTable.insertRow(myTable.rows.length - 1);
				//myTable.rows 行的长度
				//2的倍数一种样式 不是 另外一种样式
				if (myTable.rows.length % 2 == 0) {
					myNewRow.className = 'tab_tr1';
				} else {
					myNewRow.className = 'tr_al';
				}
				myNewRow.height = 24;
				//json对象
				//alert(json.tkjName);
				tkjName = json.tkjName;
				//题库集
				InsertCell(myNewRow, tkjName, 'center');
				//题库
				//通过Id找到题库的下拉框被选中找到文本
				InsertCell(myNewRow, $("#TKList option:selected").text(),
						'center');
				//知识点
				/* InsertCell(myNewRow, $("#ZSDList option:selected").text(),
						'center');
				//难度
				InsertCell(myNewRow, $("#NDList option:selected").text(),
						'center'); */

				//json.list 是 json的一个对象  对象本身是一个json数组
				var jsonArr = json.list;
				//document.getElementById(TXID).value 隐藏域里面存放的题型  1,2
				var TXValue = document.getElementById(TXID).value;
				//对 txidArr 进行循环 按照,劈分
				var txidArr = TXValue.split(",");
				//循环 题型
				for (var i = 0; i < txidArr.length; i++) {
					//txidArr[i]  正在循环的题型  1  2
					//{"tkjName":"计算机系","list":[{"tmTxId":1,"tmTxNum":4},{"tmTxId":2,"tmTxNum":1},{"tmTxId":3,"tmTxNum":1}]}
					//{"tkjName":"计算机系","list":[{"tmTxId":1,"tmTxNum":4},{"tmTxId":2,"tmTxNum":1}]}
					//{"tkjName":"课外常识","list":[{"tmTxId":1,"tmTxNum":2}]} 
					//循环的是json串

					//i 肯定是 0 1 2
					//正在循环的题型 
					//1次判断   正在循环的第一个题型3 和 json串里面第一个对象2
					//if(txidArr[i] == jsonArr[i].tmTxId){
					//	InsertCell(myNewRow,"<input type='text' name='tm_num_" + tmtxObject.tmTxId + "' value='0' onmouseover='this.select()' onblur='CheckTMNum(this)' class='InputSolid' style='width:15px' > / <font color=\"red\">" + tmtxObject.tmTxNum + "</font>","center");
					//}
					//else{
					//	InsertCell(myNewRow,"<input type='text' name='tm_num_" + tmtxObject.tmTxId + "' value='0' onmouseover='this.select()' onblur='CheckTMNum(this)' class='InputSolid' style='width:15px' > / <font color=\"red\">0</font>","center");
					//}

					//临时变量
					var tempNum = -1;
					//1,2,4
					for (var j = 0; j < jsonArr.length; j++) {
						//alert(i);
						//循环数组得到对象
						var tmtxObject = jsonArr[j];
						//对象.属性
						//alert(tmtxObject.tmTxId);
						//alert(tmtxObject.tmTxNum);
						//隐藏域循环的题型  = json串里面的题型 
						//alert(txidArr[i] + "a");
						//alert(tmtxObject.tmTxId + "b");
						//如果正在循环的题型 = json串里面的题型
						if (txidArr[i] == tmtxObject.tmTxId) {
							//alert("aaaaaaa");
							//InsertCell(myNewRow,"<input type='text' name='tm_num_" + tmtxObject.tmTxId + "' value='0' onmouseover='this.select()' onblur='CheckTMNum(this)' class='InputSolid' style='width:15px' > / <font color=\"red\">" + tmtxObject.tmTxNum + "</font>","center");
							tempNum = j;
							break;
						}
						//else{
						////添加空
						//alert("bbbbbb");
						//正在循环的题型Id > json串里面的题型大
						//if(txidArr[i] < tmtxObject.tmTxId){
						//	InsertCell(myNewRow,"<input type='text' name='tm_num_" + tmtxObject.tmTxId + "' value='0' onmouseover='this.select()' onblur='CheckTMNum(this)' class='InputSolid' style='width:15px' > / <font color=\"red\">0</font>","center");
						//}
						//}
					}
					if (tempNum > -1) {
						//alert(tempNum);
						//alert(jsonArr[tempNum].tmTxId);
						InsertCell(
								myNewRow,
								"<input type='text' name='tm_num_"
										+ jsonArr[tempNum].tmTxId
										+ "' value='0' onmouseover='this.select()' onblur='CheckTMNum(this)' class='InputSolid' style='width:15px' > / <font color=\"red\">"
										+ jsonArr[tempNum].tmTxNum + "</font>",
								"center");
					} else {
						InsertCell(
								myNewRow,
								"<input type='text' name='tm_num_"
										+ txidArr[i]
										+ "' value='0' onmouseover='this.select()' onblur='CheckTMNum(this)' class='InputSolid' style='width:15px' > / <font color=\"red\">0</font>",
								"center");
					}

				}
				InsertCell(
						myNewRow,
						"<input type='hidden' name='clTkjId' value='"
								+ $("#TKJList option:selected").val()
								+ "'>"
								+ "<input type='hidden' name='clTkId' value='"
								+ $("#TKList option:selected").val()
								+ "'>"
								/* + "<input type='hidden' name='clZsd' value='"
								+ $("#ZSDList option:selected").val()
								+ "'>"
								+ "<input type='hidden' name='nd' value='"
								+ $("#NDList option:selected").val()
								+ "'>" */
								+ "<input type='button' value='删除' class='two_button_w' onclick='DeleteRow(this)'>",
						"center");
			}

			//判断题库集（题库）
			//题库集 题库 知识点
			function chkTk(p_TkjName, p_TkName) {
				//通过Id找到表格 赋值给 myTable变量
				var myTable = document.getElementById("PolicyTable");
				var result = true;
				//对表格所有行进行循环
				for (var i = 0; i < myTable.rows.length; i++) {
					//old
					//正在循环的第一个单元格 = 题库集名称
					//并且    (第二个单元格  = '所有'  或者  第二个单元格 = 题库名称)
					//并且     (第三个单元格 = '所有' 或者 第三个单元格 = 知识点)		

					//my
					//第一个单元格 = 题库集 并且 第二个单元格 = 题库  并且第三个单元格 = 知识点
					if (myTable.rows[i].cells[0].innerHTML == p_TkjName
							&& (myTable.rows[i].cells[1].innerHTML == p_TkName || myTable.rows[i].cells[1].innerHTML == '所有')
							) {
						alert("已经有此题库,请选择其它题库!");
						result = false;
						break;
					}
				}
				return result;
			}

			function PolicyModify() {
				if (window.confirm("修改策略后，试卷试题将重新建立，原来试卷试题将会被删除！\n您确定吗？")) {
					document.getElementById('PolicyAddButton').style.display = 'inline';
					document.getElementById('PolicyModifyButton').style.display = 'none';
					document.getElementById('PolicyFlag').value = '1';
					PolicyEnabled(0);
				}
			}

			function CheckTMNum(obj) {
				var tm_num_max = obj.parentNode.innerText.replace(" / ", "");
				if (isNaN(tm_num_max))
					return;

				if (isNaN(obj.value)) {
					obj.value = "0";
				} else {
					if (parseInt(obj.value) > parseInt(tm_num_max)) {
						obj.value = tm_num_max;
					}
				}

				SetTMTotalNum();
			}

			function SetTMTotalNum() {
				var myTable = document.getElementById('PolicyTable');
				if (myTable.rows.length > 0) {
					var ScoreType = document.getElementById('ScoreType02').checked;
					var TXNumObj;
					var TXArr = document.getElementById(TXID).value.split(",");
					var TotalAccount = 0; //题目总数
					var TotalScore = 0; //题目总分
					var TXAccount; //题型题目总数
					var TempNum;
					for (var i = 0; i < TXArr.length; i++) {
						TXNumObj = document.getElementsByName("tm_num_"
								+ TXArr[i]);
						TXAccount = 0;
						for (var j = 0; j < TXNumObj.length; j++) {
							if (TXNumObj[j].value == "") {
								TempNum = 0;
							} else {
								TempNum = parseInt(TXNumObj[j].value);
							}
							TotalAccount += TempNum;
							TXAccount += TempNum;
							if (ScoreType) {
								TotalScore += parseInt(document
										.getElementById("score_" + TXArr[i]).value)
										* TempNum;
							}
						}
						document.getElementById("stat_" + TXArr[i]).value = TXAccount;
					}
					document.getElementById('TotalAccount').value = TotalAccount;
					if (ScoreType) {
						document.getElementById('TotalScore').value = TotalScore;
					} else {
						document.getElementById('TotalScore').value = document
								.getElementById('is_100').value;
					}
				}
			}

			function DeleteRow(obj) {
				var myTable = document.getElementById("PolicyTable");
				var myRow = obj.parentNode.parentNode;
				myTable.deleteRow(myRow.rowIndex);

				SetTMTotalNum();
			}

			function AdjustTMTXOrderKey() {
				var k = 0;
				var TMTXObj = document.getElementsByName("Tm_tx_ID");
				for (var i = 0; i < TMTXObj.length; i++) {
					if (TMTXObj[i].checked)
						k++;
				}
				for (var i = 0; i < TMTXObj.length; i++) {
					if (!TMTXObj[i].checked) {
						k++;
						document.getElementById("orderkey_" + TMTXObj[i].value).value = k
								.toString();
					}
				}
			}

			function CheckForm() {
				InitExamTX();
				var TabsID = "";
				if (document.getElementById('txtTkClName').value == "") {
					changeTabThree('1');
					document.getElementById('txtTkClName').focus();
					window.alert("试卷名称不能为空！");
					//DoStart();
					changeTabThree('1');
					return false;
				}
				var reg = /^[0-9]*[1-9][0-9]*$/;
			/* 	if (document.getElementById('rbtnSJ').checked) {
					//alert(document.getElementById('SuitNumber').value);
					if (!reg.test(document.getElementById('SuitNumber').value)) {
						alert("套数只能是数字");
						DoStart();
						changeTabThree('1');
						return false;
					} else {
						if (document.getElementById('SuitNumber').value == "1") {
							alert("套数只能是数字而且失少是2套!");
							DoStart();
							changeTabThree('1');
							return false;
						}
					}
				} */
				if (document.getElementById('TotalAccount').value == "0") {
					window.alert("您没有选择题目！");
					changeTabThree('2');
					//DoStart();
					return false;
				}
				if (parseInt(document.getElementById('PassFS').value) > parseInt(document
						.getElementById('TotalScore').value)) {
					document.getElementById('PassFS').select();
					window.alert("及格分数太高了！");
					//DoStart();
					return false;
				}
				if (parseInt(document.getElementById('PassFS').value) < 0) {
					document.getElementById('PassFS').select();
					window.alert("及格分数不能小于0！");
					//DoStart();
					return false;
				}
				//不满足出题确定的出题个数，返回false;
				var obj1 = document.getElementsByName("Tm_tx_ID");
			
				var txnumArr = new Array();
				//变量 isAdd
				
				//对题目题型进行循环
				
				for (var i = 0; i < obj1.length; i++) {
					isAdd = true;
					//如果正在循环的复选框被选中
					if (obj1[i].checked) {
						var a = "score_"+(i+1);
						//被选中的分数
						
						//有问答题
						if(i==4){
							txnumArr[i+1] = parseInt($("#"+a).val())/5;
						}else{
							txnumArr[i+1] = parseInt($("#"+a).val())/2;
						}
						//判断个数与计算的个数相同吗？确定相同
						if($("#stat_"+(i+1)).val()!=txnumArr[i+1]){
							window.alert("请确保题型个数为题型分数除以每道题的分数！");
							return false;
				
						}
					}
				}
				
				
				
				var BTime = ParseDate(document.getElementById('valid_btime').value);
				var ETime = ParseDate(document.getElementById('valid_etime').value);
				if (BTime == "NaN") {
					changeTabThree('1');
					document.getElementById('valid_btime').select();
					window.alert("请输入一个有效的开始时间！");
					changeTabThree('1');
					//DoStart();
					return false;
				}
				if (ETime == "NaN") {
					changeTabThree('1');
					document.getElementById('valid_etime').select();
					window.alert("请输入一个有效的结束时间！");
					changeTabThree('1');
					//DoStart();
					return false;
				}
				if (BTime > ETime) {
					changeTabThree('1');
					document.getElementById('valid_etime').select();
					window.alert("有效终止时间不能小于有效开始时间！");
					changeTabThree('1');
					//DoStart();
					return false;
				}
				/* if (document.getElementById('tk_cl_time_1').checked) {
					if (BTime.toLocaleDateString() != ETime
							.toLocaleDateString()) {
						changeTabThree('1');
						document.getElementById('valid_etime').select();
						window
								.alert("当在考试计时选项中选择\"考试统一交卷\"的时候，试卷有效的日间段必段在一天内！");
						DoStart();
						return false;
					}
				} */
				return true;
			}

			function AdjustOption_Y(ObjID1, ObjID2, Num) {
				if (Num == 1) {
					document.getElementById(ObjID1).style.backgroundColor = "#FFFFFF";
					document.getElementById(ObjID1).disabled = false;
					document.getElementById(ObjID2).style.backgroundColor = "#FFFFFF";
					document.getElementById(ObjID2).disabled = false;
				} else {
					document.getElementById(ObjID1).style.backgroundColor = "#EEFFFF";
					if (document.getElementById(ObjID1).type == "checkbox") {
						document.getElementById(ObjID1).checked = false;
					}
					document.getElementById(ObjID1).disabled = true;

					document.getElementById(ObjID2).style.backgroundColor = "#EEFFFF";
					if (document.getElementById(ObjID2).type == "checkbox") {
						document.getElementById(ObjID2).checked = false;
					}
					document.getElementById(ObjID2).disabled = true;
				}
			}

			//function chkTk(p_TkjName,p_TkName)
			//{
			//    var myTable = document.getElementById('PolicyTable');
			//    //add by bowei 防止添加重复的题库

			//    for(var i=0;i<myTable.rows.length;i++)
			//    {
			//    	alert(myTable.rows[i].cells[0].innerHTML);
			//    	alert(p_TkjName);
			//    	alert(myTable.rows[i].cells[1].innerHTML);
			//    	alert(p_TkName);
			//        if(myTable.rows[i].cells[0].innerHTML== p_TkjName  && (myTable.rows[i].cells[1].innerHTML=='所有' || myTable.rows[i].cells[0].innerHTML== p_TkName ))
			//        {
			//            alert('已经有此题库,请选择其它题库!');
			//            return false;
			//        }
			//    }
			//    return true;
			//}
		</script>

		<script language="javascript" type="text/javascript" id="PolicyScript"></script>

		<script language="javascript" type="text/javascript" id="TKScript"></script>

		<script language="javascript" type="text/javascript" id="ZSDScript"></script>

		<script language="javascript" type="text/javascript">
		<!--
			function openwin() {
				var text = document.getElementById('tk_cl_name').value;

				if (text == "") {
					alert("你只有定义了试卷名称才可以进行消息提醒！");
					return false;
				}
				var Stime = document.getElementById('valid_btime').value;
				var Etime = document.getElementById('valid_etime').value;

				FixSizeWin("ExamMessage.aspx?ClName=" + escape(text)
						+ "&Stime=" + Stime + "&Etime=" + Etime, "message",
						500, 255)
			}
			//释放弹出的窗口　<body onunload='CloseWin'>
			function CloseWin() {
				if (w != null) {
					w.close();
				}
			}
		//-->
		</script>

		<div>
			<div class="popTitle">试卷</div>
			<div id="window_TestPaper_add" class="content">
				<table border="0" cellpadding="0" cellspacing="0"
					style="width: 100%" align="center">
					<tr>
						<td>
							<div id="tab">
								<div class="tab_on" id="tab1" onclick="changeTabThree('1');">
									基本信息</div>
								<div class="tab_off" id="tab2"
									onclick="changeTabThree('2');RedomTxSet();">高级设置</div>
								<div class="tab_off" id="tab3"
									onclick="changeTabThree('3');InitExamTX();">试卷策略</div>
								<div class="tabline" style="width: 387px;"></div>
								<div class="clear"></div>
							</div>
							<div class="tabCont">
								<div id="block1" class="block">
									<div class="this_height" style="padding-top: 20px;">
										<table width="100%" border="0" align="center" cellpadding="0"
											cellspacing="0">
											<tr>
												<td width="70" style="text-align: right;">试卷名称：</td>
												<td colspan="5" style="height: 26px" align="left"><input
													name="tkClName" type="text" value="" id="txtTkClName"
													class="input" style="width: 545px;" /> <select
													name="ExamCatalogList" id="ExamCatalogList" class="Select"
													style="width: 100px; display: none;">

												</select></td>
											</tr>
											<%-- <tr style="height: 26px;">
												<td style="text-align: left;" colspan="6"><input
													id="rbGD" type="radio" name="SJLX" value="rbGD"
													checked="checked" onclick="gdSJ();" /><label for="rbGD">固定试卷
												</label> <span id="Label1">（所有的学员共用一套考题进行考试）</span></td>
											</tr>
											<tr style="height: 26px;">
												<td style="text-align: left;" colspan="6"><input
													id="rbtnSJ" type="radio" name="SJLX" value="rbtnSJ"
													onclick="sjSJ();" /><label for="rbtnSJ">随机试卷</label> <input
													name="SuitNumber" type="text" value="1" id="SuitNumber"
													disabled="disabled" class="input" onPaste="return false;"
													style="width:41px;" />套（学员从多套题中随机取一套进行考试）</td>
											</tr> --%>
											<tr>
												<td height="26" colspan="2" style="text-align: right;">
													显示方式：</td>
												<td width="80"><select name="tkClType" id="ExamMode"
													class="Select">
														<option value="0">一屏显示所有题目</option>
														<option value="1">一屏显示一道题</option>
														<option value="2">一屏显示一种题型</option>

												</select></td>
												<td width="270" style="text-align: left;">&nbsp; &nbsp;
													&nbsp; &nbsp; &nbsp; 最多考试次数：<input name="maxKsNum"
													type="text" value="1" id="MaxKsNum" class="input"
													onPaste="return false;" style="width: 35px;" /> <span
													id="RangeValidator1" style="color: Red; display: none;">请输入正确的数字</span>
													<input type="hidden" value="1" name="minKsNum"></input>
 												</td>
												<td width="50" height="26" colspan="2">&nbsp;</td>
											</tr>
										</table>
										<table border="0" width="100%">
											<tr>
												<td valign="top" width="50%">
													<fieldset style="height: 80px;">
														<legend>
															<font color="#325A8B">时间参数</font>
														</legend>
														<table class="noGridTable">
															<tr>
																<td>有效开始时间</td>
																<td><input name="validBtime" type="text"
																	value="2016/4/15 14:51:59" readonly="readonly"
																	id="valid_btime" class="input"
																	onfocus="new WdatePicker(this,'%Y-%M-%D %h:%m:%s',true)" /></td>
															</tr>
															<tr>
																<td>有效终止时间</td>
																<td><input name="validEtime" type="text"
																	value="2019/4/15 14:51:59" readonly="readonly"
																	id="valid_etime" class="input"
																	onfocus="new WdatePicker(this,'%Y-%M-%D %h:%m:%s',true)" /></td>
															</tr>
														</table>
													</fieldset>
												</td>
												<td>
													<fieldset style="height: 80px;">
														<legend>
															<font color="#325A8B">考试计时选项</font>
														</legend>
														<table class="noGridTable" style="margin-top: 5px;">
															<tr>
																<td><span id="tk_cl_time" class="Radio"><!-- <input
																		id="tk_cl_time_0" type="radio" name="tkClTime"
																		value="0" onclick="AdjustOption('tk_cl_time_num',0);" /><label
																		for="tk_cl_time_0">考试不计时</label><br />
																	<input id="tk_cl_time_1" type="radio" name="tkClTime"
																		value="-1" onclick="AdjustOption('tk_cl_time_num',0);" /><label
																		for="tk_cl_time_1">统一交卷</label><br /> -->
																	<input id="tk_cl_time_2" type="radio" name="tk_cl_time"
																		value="1" checked="checked"
																		onclick="AdjustOption('tk_cl_time_num',1);" /><label
																		for="tk_cl_time_2">答题时间</label></span> <input name="tkClTime"
																	type="text" value="60" id="tk_cl_time_num"
																	class="input" onPaste="return false;"
																	style="width: 40px;" />分钟<span id="RangeValidator3"
																	style="color: Red; display: none;">请输入正确的数字</span></td>
															</tr>
														</table>
													</fieldset>
												</td>
											</tr>
										</table>
										<fieldset>
											<legend>
												<font color="#325A8B">防舞弊</font>
											</legend>
											<table class="noGridTable">
												<tr>
													<td>
														<table width="300px" style="display: inline;">
															<tr>
																<td><span class="CheckBox"><input
																		id="IsOrder" type="radio" checked name="isOrder" value="1" /><label
																		for="IsOrder">考题显示顺序随机</label></span></td>
																<td><span class="CheckBox"><input
																		id="IsOrder" type="radio" name="isOrder" value="0" /><label
																		for="IsOrder">考题显示顺序固定</label></span></td>
															</tr>

														</table>
														<table width="300px" style="display: inline;">
															<tr>
																<td><span id="MoveOutTimes" class="Radio"><input
																		id="MoveOutTimes_0" type="radio" name="moveOutTimes"
																		value="0" checked="checked"
																		onclick="AdjustOption('MoveOutTimes_num',0);" /><label
																		for="MoveOutTimes_0">不限制移出WEB考试页</label><br />
																	<input id="MoveOutTimes_1" type="radio"
																		name="moveOutTimes" value="1"
																		onclick="AdjustOption('MoveOutTimes_num',1);" /><label
																		for="MoveOutTimes_1">移出考试页面达到</label></span> <input
																	name="moveOutTimes" type="text" value="5"
																	id="MoveOutTimes_num" disabled="disabled" class="input"
																	onPaste="return false;" style="width: 40px;" />
																	次判为舞弊并自动交卷<span id="RangeValidator2"
																	style="color: Red; display: none;">请输入正确的数字</span></td>
															</tr>
														</table>
													</td>
												</tr>
												<tr style="display: none;">
													<td><span class="CheckBox"><input
															id="AllowUpload" type="checkbox" name="AllowUpload" /><label
															for="AllowUpload">允许上传附件（禁止溢出页面失效）</label></span></td>
												</tr>
											</table>
										</fieldset>
										<fieldset
											style="height: 80px; padding: 0 10px; margin-top: 5px;">
											<legend>
												<font color="#325A8B">试卷安全</font>
											</legend>
											<div>
													&nbsp;&nbsp;<span class="CheckBox"><input
													id="IsShowFS" type="radio" name="allowSeePaper" checked value="0"/><label
													for="IsShowFS">不允许考生提交后查看答卷和答案</label></span>&nbsp;&nbsp;<br></br>
													&nbsp;&nbsp;<span
													class="CheckBox"><input id="AllowSeePaper"
													type="radio" name="allowSeePaper" value="1"/><label
													for="AllowSeePaper">允许考生提交后查看答卷和答案</label></span>
											</div>
										</fieldset>
										<table border="0" align="center" cellpadding="0"
											cellspacing="0">
											<tr>
												<td colspan="2">
													<table width="670" border="0" align="center"
														cellpadding="0" cellspacing="0">
														<tr>
															<td>
																<fieldset style="margin-top: 5px;">
																	<legend>
																		<label for="style_enable"> <font
																			color="#325A8B">答卷保存参数组</font>
																		</label>
																	</legend>
																	<table width="100%" border="0" cellspacing="0"
																		cellpadding="0">
																		<tr style="display: none;">
																			<td colspan="2">
																				<table id="KsSavePaper" class="Radio" border="0">
																					<tr>
																						<td><input id="KsSavePaper_0" type="radio"
																							name="isSavePaper" value="0" /><label
																							for="KsSavePaper_0">服务器不保存考生答卷：只记录考试成绩，不保存考生的题目和答案，可以减轻交卷对服务器的压力，但交卷后无法查卷，适合上千人的大规模的考试（不允许主观题）</label></td>
																					</tr>
																					<tr>
																						<td><input id="KsSavePaper_1" type="radio"
																							name="isSavePaper" value="1" checked="checked" /><label
																							for="KsSavePaper_1">交卷时保存答卷：考试过程中不保存考生答卷，适合中等规模的正式考试（几百人）</label></td>
																					</tr>
																					<tr>
																						<td><input id="KsSavePaper_2" type="radio"
																							name="isSavePaper" value="2" /><label
																							for="KsSavePaper_2">手工保存答卷：考试过程中允许考生手工保存答卷，允许中途退出考试，适合布置不计时的作业</label></td>
																					</tr>
																				</table>
																			</td>
																		</tr>
																		<tr style="display: none;">
																			<td height="16" colspan="2">
																				<hr size="1" width="98%" />
																			</td>
																		</tr>
																		<tr>
																			<td height="26">&nbsp;<span class="CheckBox "><input
																					id="EnableHand" type="checkbox" name="EnableHand" /><label
																					for="EnableHand">手工保存答卷：考试过程中允许考生手工保存答卷，允许中途退出考试，适合布置不计时的作业</label></span></td>
																			<td height="26"></td>
																		</tr>
																		<tr style="display: none;">
																			<td height="26">&nbsp;<span class="CheckBox "><input
																					id="LocalCache" type="checkbox" name="LocalCache" /><label
																					for="LocalCache">启用本地缓存功能：在考试机器中即时保存答卷，出错后可以恢复答卷（推荐）</label></span></td>
																			<td height="26"></td>
																		</tr>
																	</table>
																</fieldset>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
										  <table style="margin-left: 10px; margin-top: 8px; margin-bottom: 2px;" width="100%">
                                            <tr>
                                                <td>
                                                    试卷说明</td>
                                                <td>
                                                    <input name="tk_Memo" type="text" value="2016/4/15系统管理员定义网上考试" id="tk_Memo" class="input" style="width:400px;" />
                                                </td>
                                                <td>
                                                    顺序号：
                                                </td>
                                                <td>
                                                    <input name="OrderNumber" type="text" value="20" id="OrderNumber" class="input" onPaste="return false;" style="width:40px;" />
                                                    <span id="RangeValidator4" style="color:Red;display:none;">请输入正确的数字</span>
                                                </td>
                                            </tr>
                                        </table>
										<div style="height: 108px;">
											<div class="help" style="margin-top: 10px;">友情提醒:</div>
											<div class="helpListLast">
												<img src="<%=path%>/html/App_Image/Admin/aw_ico.gif" />&nbsp;移出考试页面次数限制不宜过低，建议在三次以上，试卷内容包含flash格式附件的，建议不进行移出页面控制。
											</div>
										</div>
									</div>
								</div>
								<div id="block2" style="display: none; width: 680px;"
									class="block">
									<div class="this_height" style="padding-top: 20px;">
										<table border="0" align="center" cellpadding="0"
											cellspacing="0">
											<tr>
												<td style="width: 673px">
													<table width="100%" border="0" cellspacing="0"
														cellpadding="0">
														<tr>
															<td height="140">
																<table width="670px" border="0" align="center"
																	cellpadding="0" cellspacing="0">
																	<tr>
																		<td>
																			<fieldset>
																				<legend>
																					<label for="style_enable"> <font
																						color="#325A8B">考生及评卷人</font>
																					</label>
																				</legend>
																				<table width="100%" border="0" cellspacing="0"
																					cellpadding="0">
																					<tr><span>是否允许所有人参加考试及需要手工判分</span></tr>
																					<tr>
																						
																						<td colspan="2">
																							<table id="clerk_all" class="Radio" border="0">
																								<tr>
																									<td><input id="clerk_all_0" type="radio"
																										name="isAllow" value="1" checked="checked" /><label
																										for="clerk_all_0">允许所有账户参加考试</label></td>
																								</tr>
																								<tr>
																									<td><input id="clerk_all_1" type="radio"
																										name="isAllow" value="0" /><label
																										for="clerk_all_1">在考试控制台中安排考生考试</label></td>
																								</tr>
																							</table>
																						</td>
																					</tr>
																					
																					<tr>
																						
																						
																							<!-- 试卷是否需手工判分 -->
																							<td colspan="2">
																								<table id="clerk_all" class="Radio" border="0">
																									<tr>
																										<td><input id="clerk_all_0" type="radio"
																											name="tkClPf" value="1" checked="checked" /><label
																											for="clerk_all_0">需要手工判分</label></td>
																									</tr>
																									<tr>
																										<td><input id="clerk_all_1" type="radio"
																											name="tkClPf" value="0" /><label
																											for="clerk_all_1">不需要手工判分</label></td>
																									</tr>
																								</table>
																						</td>
																					</tr>
																				</table>
																				<br>
																			</fieldset>
																		</td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td height="195" valign="top" style="width: 673px">
													<table width="670" border="0" align="center"
														cellpadding="0" cellspacing="0">
														<tr>
															<td>
																<fieldset>
																	<legend>
																		<label for="style_enable"> <font
																			color="#325A8B">题型与分数设置</font>
																		</label>
																	</legend>
																	<table width="100%" border="0" cellspacing="0"
																		cellpadding="0">
																		<tr>
																			<td  width="20" height="40"><input value="1"
																				name="ScoreType" type="radio" id="ScoreType01"
																				class="Radio" checked="checked" /></td>
																			<td height="20"><label for="ScoreType01">
																					使用题库中试题的分数，并设置 总分</label> <input name="is_100"
																				type="text" value="100" id="is_100" class="input"
																				style="width: 40px" /></td>
																		</tr>
																		<tr>
																			<br></br><span>*除问答题分数为5的倍数外，其余题型分数应该为2的倍数，且满足题型分数总和为设置的分数*</span>
																		</tr>
																		<tr style="display:none">
																			<td width="20" height="26"><input value="0"
																				name="ScoreType" type="radio" id="ScoreType02"
																				class="Radio" /></td>
																			<td height="26"><label for="ScoreType02">
																					忽略试题原分数，按题型指定分数</label></td>
																		</tr>
																		<tr>
																			<td height="350" colspan="2"><script
																					language="javascript" type="text/javascript">
																				function RedomTxSet() {
																					var chkname = document
																							.getElementsByName("Tm_tx_ID");
																					for (i = 0; i < chkname.length; i++) {
																						chkname[i].disabled = false;
																					}

																				}
																			</script>
				
																			

																				<div
																					style=" overflow: auto; scrollbar-face-color: #D4D0C8; scrollbar-highlight-color: #ffffff; scrollbar-shadow-color: #ffffff; scrollbar-3dlight-color: #666666; scrollbar-arrow-color: #216dad;">
																					<div>
																						<table class="tab_table" cellspacing="0"
																							cellpadding="1" rules="all" border="1"
																							id="ExamTXGridView"
																							style="width: 640px; border-collapse: collapse;">
																							<tr class="tab_label">
																								<th scope="col"><input id="tmtx_all"
																									type="checkbox" class="CheckBox"
																									onclick="CheckAll(this,'ExamTXGridView')"
																									title="全部选定/全部取消" /></th>
																								<th scope="col">题型标题</th>
																								<th scope="col">分数</th>
																								<th scope="col">说明</th>
																								<th scope="col">顺序号</th>
																							</tr>
																							<tr class="tab_tr1">
																								<td align="center" style="width: 30px;"><input
																									type="checkbox" name="Tm_tx_ID"
																									class="CheckBox" id='tmtxid_1' value='1'
																									title='0' /></td>
																								<td style="width: 100px;">单选题</td>
																								<td align="center" style="width: 100px;"><input
																									type="text" style="width: 40px" name='score_1'
																									class="input" id='score_1' value='2' /></td>
																								<td style="width: 300px;"><textarea
																										type="text" style="width: 97%" name='notes_1'
																										class="input" id='notes_1'>单选题</textarea></td>
																								<td align="center"><input type="text"
																									style="width: 40px" name='orderkey_1'
																									class="input" id='orderkey_1' value='0' /></td>
																							</tr>
																							<tr class="tr_al">
																								<td align="center" style="width: 30px;"><input
																									type="checkbox" name="Tm_tx_ID"
																									class="CheckBox" id='tmtxid_2' value='2'
																									title='1' /></td>
																								<td style="width: 100px;">填空题</td>
																								<td align="center" style="width: 100px;"><input
																									type="text" style="width: 40px" name='score_2'
																									class="input" id='score_2' value='2' /></td>
																								<td style="width: 300px;"><textarea
																										type="text" style="width: 97%" name='notes_2'
																										class="input" id='notes_2'>填空题</textarea></td>
																								<td align="center"><input type="text"
																									style="width: 40px" name='orderkey_2'
																									class="input" id='orderkey_2' value='1' /></td>
																							</tr>
																							<tr class="tab_tr1">
																								<td align="center" style="width: 30px;"><input
																									type="checkbox" name="Tm_tx_ID"
																									class="CheckBox" id='tmtxid_3' value='3'
																									title='2' /></td>
																								<td style="width: 100px;">多选题</td>
																								<td align="center" style="width: 100px;"><input
																									type="text" style="width: 40px" name='score_3'
																									class="input" id='score_3' value='2' /></td>
																								<td style="width: 300px;"><textarea
																										type="text" style="width: 97%" name='notes_3'
																										class="input" id='notes_3'>多选题</textarea></td>
																								<td align="center"><input type="text"
																									style="width: 40px" name='orderkey_3'
																									class="input" id='orderkey_3' value='2' /></td>
																							</tr>
																							<tr class="tr_al">
																								<td align="center" style="width: 30px;"><input
																									type="checkbox" name="Tm_tx_ID"
																									class="CheckBox" id='tmtxid_4' value='4'
																									title='3' /></td>
																								<td style="width: 100px;">判断题</td>
																								<td align="center" style="width: 100px;"><input
																									type="text" style="width: 40px" name='score_4'
																									class="input" id='score_4' value='2' /></td>
																								<td style="width: 300px;"><textarea
																										type="text" style="width: 97%" name='notes_4'
																										class="input" id='notes_4'>填空题</textarea></td>
																								<td align="center"><input type="text"
																									style="width: 40px" name='orderkey_4'
																									class="input" id='orderkey_4' value='3' /></td>
																							</tr>
																							<tr class="tab_tr1">
																								<td align="center" style="width: 30px;"><input
																									type="checkbox" name="Tm_tx_ID"
																									class="CheckBox" id='tmtxid_5' value='5'
																									title='4' /></td>
																								<td style="width: 100px;">问答题</td>
																								<td align="center" style="width: 100px;"><input
																									type="text" style="width: 40px" name='score_5'
																									class="input" id='score_5' value='5' /></td>
																								<td style="width: 300px;"><textarea
																										type="text" style="width: 97%" name='notes_5'
																										class="input" id='notes_5'>问答题</textarea></td>
																								<td align="center"><input type="text"
																									style="width: 40px" name='orderkey_5'
																									class="input" id='orderkey_5' value='4' /></td>
																							</tr>
																						</table>
																						<script type="text/javascript">
																							/* 判断输入分数应该为2和5倍数 */
																							$("#score_1").change(function(){
																								if($("#score_1").val()<1){
																									alert("请输入正确的分数");
																								}
																								if($("#score_1").val()%2!=0){
																									alert("请输入分数为2的倍数");
																									$("#score_1").val(2);
																								}
																							});
																							$("#score_2").change(function(){
																								if($("#score_2").val()<1){
																									alert("请输入正确的分数");
																								}
																								if($("#score_2").val()%2!=0){
																									alert("请输入分数为2的倍数");
																									$("#score_2").val(2);
																								}
																							});
																							$("#score_3").change(function(){
																								if($("#score_3").val()<1){
																									alert("请输入正确的分数");
																								}
																								if($("#score_3").val()%2!=0){
																									alert("请输入分数为2的倍数");
																									$("#score_3").val(2);
																								}
																							});
																							$("#score_4").change(function(){
																								if($("#score_4").val()<1){
																									alert("请输入正确的分数");
																								}
																								if($("#score_4").val()%2!=0){
																									alert("请输入分数为2的倍数");
																									$("#score_4").val(2);
																								}
																							});
																							$("#score_5").change(function(){
																								if($("#score_5").val()<1){
																									alert("请输入正确的分数");
																								}
																								if($("#score_5").val()%5!=0){
																									alert("请输入分数为5的倍数");
																									$("#score_5").val(5);
																								}
																							});
																							
																							
																						</script>
																					</div>
																				</div></td>
																		</tr>
																	</table>
																	<br>
																</fieldset>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</div>
									<div class="help" style="margin-top: 25px;">友情提醒:</div>
									<div class="helpListLast">
										<img src="<%=path%>/html/App_Image/Admin/aw_ico.gif" />&nbsp;选择“在考试控制台中安排考生考试”的试卷，需要在“考试管理”中指定参加考试的学员。
									</div>
								</div>
								<div id="block3" style="display: none; width: 680px;"
									class="block">
									<div class="this_height" style="padding-top: 5px;">
										<table height="30" border="0" align="center" cellpadding="0"
											cellspacing="0">
											<tr>
												<td>题库集：&nbsp; <s:select list="#request.tkjList"
														name="TKJList" id="TKJList"
														onchange="GetTKList(this.value);"
														headerKey="-1" headerValue="=请选择=" listKey="tkjId"
														listValue="tkjName" theme="simple"></s:select> 题库：&nbsp; <select
													name="TKList" id="TKList" class="Select"
								
													style="width: 120px;">
														<option value="0">所有</option>
												</select> 
												    <input type="hidden" name="SelectedTX" id="SelectedTX" />
													<input type="button" id="PolicyAddButton"
													class="four_button" style="display: inline;" value="增加"
													onclick="PolicyAdd()" /><input type="button"
													id="PolicyModifyButton" class="four_button"
													style="display: none;" value="修改策略"
													onclick="PolicyModify()" />
												</td>
											</tr>
										</table>
										<table border="0" align="center" cellpadding="0"
											cellspacing="0">
											<tr>
												<td>
													<table width="100%" border="0" cellspacing="0"
														cellpadding="0">
														<tr>
															<td>
																<table width="670px" border="0" align="center"
																	cellpadding="0" cellspacing="0">
																	<tr>
																		<td>
																			<fieldset>
																				<legend>
																					<label for="style_enable"> <font
																						color="#325A8B">试题策略</font>
																					</label>
																				</legend>
																				<table width="100%" border="0" cellspacing="0"
																					cellpadding="0">
																					<tr>
																						<td height="292">
																							<div
																								style="height: 292px; width: 650px;  overflow: auto; scrollbar-face-color: #D4D0C8; scrollbar-highlight-color: #ffffff; scrollbar-shadow-color: #ffffff; scrollbar-3dlight-color: #666666; scrollbar-arrow-color: #216dad;">
																								<table id="PolicyTable" border="0"
																									cellpadding="1" cellspacing="0"
																									class="tab_table" style="width: 650px">
																								</table>
																							</div>
																						</td>
																					</tr>
																				</table>
																				<br>
																			</fieldset>
																		</td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td height="100">
													<table width="670px" border="0" align="center"
														cellpadding="0" cellspacing="0">
														<tr>
															<td style="height: 95px">
																<fieldset>
																	<legend>
																		<label for="style_enable"> <font
																			color="#325A8B">题数统计</font>
																		</label>
																	</legend>
																	<table width="98%" border="0" align="center"
																		cellpadding="0" cellspacing="0">
																		<tr>
																			<td width="80" height="40">题目总数：</td>
																			<td height="40"><input type="text"
																				style="width: 60px" id="TotalAccount" class="input"
																				readonly="readonly" value="0" /></td>
																			<td width="60">总分：</td>
																			<td><input name="totalScore" type="text"
																				id="TotalScore" style="width: 60px" class="input"
																				readonly="readonly" /></td>
																			<td width="60">及格分：</td>
																			<td><input name="passFS" type="text" value="60"
																				id="PassFS" class="input" onpaste="return false;"
																				style="width: 60px;" /><span id="RangeValidator5"
																				style="color: Red; display: none;">请输入正确的数字</span> <input
																				type="hidden" name="PolicyFlag" class="input"
																				id="PolicyFlag" value="0" /></td>
																		</tr>
																	</table>
																	<div class="clear"></div>
																</fieldset>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</div>
									<div class="help" style="margin-top: 2px;">友情提醒:</div>
									<div class="helpList">
										<img src="<%=path%>/html/App_Image/Admin/aw_ico.gif" />&nbsp;试卷所需的试题需要先在题库管理中建立。允许从不同题库中抽取试题。
									</div>
									<div class="helpListLast">
										<img src="<%=path%>/html/App_Image/Admin/aw_ico.gif" />&nbsp;题库集、题库、知识点、难度限制的越细，抽取的试题越准确。
									</div>
								</div>
							</div>
						</td>
					</tr>
				</table>

				<script type="text/javascript">
					/* function chkname() {
						document.getElementById("chknameiframe").src = "chknameiframe.ashx?ExamName="
								+ escape(document.getElementById('tk_cl_name').value)
								+ "&ExamID=" + '';
					}
					function gdSJ() {
						document.getElementById("SuitNumber").value = "1";
						document.getElementById("SuitNumber").disabled = "disabled";
					}
					function sjSJ() {
						document.getElementById("SuitNumber").value = "10";
						document.getElementById("SuitNumber").disabled = false;
					} */
				</script>

				<script type="text/javascript" id="chknameiframe"></script>

				<div class="btnsubmit">
					<input type="button" value="上一页" style="display: none;"
						id="btn_pro" class="four_button_y" onclick="changeTabThree('1');" />
					<input type="button" value="上一页" style="display: none;"
						id="btn_pro1" class="four_button_y" onclick="changeTabThree('2');" />
					<input type="button" value="下一页" id="btn_next"
						class="four_button_y" onclick="changeTabThree('2');RedomTxSet();" />
					<input type="button" value="下一页" style="display: none;"
						id="btn_next1" class="four_button_y"
						onclick="changeTabThree('3');InitExamTX();" />
				 <!-- <input type="button" id="btn_Submit" class="four_button_y" value="确 定" onclick="javascript:this.disabled='disabled';chkname();" /> --> 
					<input type="submit" name="Submit" value="确 定" id="Submit"
						class="four_button_y"/> <input
						type="button" value="取 消" id="btn_Cancel" class="four_button_y"
						onclick="if(confirm('确认不保存修改内容就退出吗？')){window.close();}" />
				</div>
			</div>
		</div>

		<script type="text/javascript">
			//<![CDATA[
			var Page_Validators = new Array(document
					.getElementById("RangeValidator1"), document
					.getElementById("RangeValidator3"), document
					.getElementById("RangeValidator2"), document
					.getElementById("RangeValidator4"), document
					.getElementById("RangeValidator5"));
			//]]>
		</script>

		<script type="text/javascript">
			//<![CDATA[
			var RangeValidator1 = document.all ? document.all["RangeValidator1"]
					: document.getElementById("RangeValidator1");
			RangeValidator1.controltovalidate = "MaxKsNum";
			RangeValidator1.errormessage = "请输入正确的数字";
			RangeValidator1.display = "Dynamic";
			RangeValidator1.type = "Integer";
			RangeValidator1.evaluationfunction = "RangeValidatorEvaluateIsValid";
			RangeValidator1.maximumvalue = "1000";
			RangeValidator1.minimumvalue = "1";
			var RangeValidator3 = document.all ? document.all["RangeValidator3"]
					: document.getElementById("RangeValidator3");
			RangeValidator3.controltovalidate = "tk_cl_time_num";
			RangeValidator3.errormessage = "请输入正确的数字";
			RangeValidator3.display = "Dynamic";
			RangeValidator3.type = "Integer";
			RangeValidator3.evaluationfunction = "RangeValidatorEvaluateIsValid";
			RangeValidator3.maximumvalue = "1000";
			RangeValidator3.minimumvalue = "1";
			var RangeValidator2 = document.all ? document.all["RangeValidator2"]
					: document.getElementById("RangeValidator2");
			RangeValidator2.controltovalidate = "MoveOutTimes_num";
			RangeValidator2.errormessage = "请输入正确的数字";
			RangeValidator2.display = "Dynamic";
			RangeValidator2.type = "Integer";
			RangeValidator2.evaluationfunction = "RangeValidatorEvaluateIsValid";
			RangeValidator2.maximumvalue = "1000";
			RangeValidator2.minimumvalue = "1";
			var RangeValidator4 = document.all ? document.all["RangeValidator4"]
					: document.getElementById("RangeValidator4");
			RangeValidator4.controltovalidate = "OrderNumber";
			RangeValidator4.errormessage = "请输入正确的数字";
			RangeValidator4.display = "Dynamic";
			RangeValidator4.type = "Integer";
			RangeValidator4.evaluationfunction = "RangeValidatorEvaluateIsValid";
			RangeValidator4.maximumvalue = "1000000";
			RangeValidator4.minimumvalue = "1";
			var RangeValidator5 = document.all ? document.all["RangeValidator5"]
					: document.getElementById("RangeValidator5");
			RangeValidator5.controltovalidate = "PassFS";
			RangeValidator5.errormessage = "请输入正确的数字";
			RangeValidator5.display = "Dynamic";
			RangeValidator5.type = "Integer";
			RangeValidator5.evaluationfunction = "RangeValidatorEvaluateIsValid";
			RangeValidator5.maximumvalue = "1000";
			RangeValidator5.minimumvalue = "0";
			//]]>
		</script>

		<%-- <script language='javascript'>
			//GetTKList($get('TKJList').value);
		</script> --%>
		<script type="text/javascript">
			//<![CDATA[

			var Page_ValidationActive = false;
			if (typeof (ValidatorOnLoad) == "function") {
				ValidatorOnLoad();
			}

			function ValidatorOnSubmit() {
				if (Page_ValidationActive) {
					return ValidatorCommonOnSubmit();
				} else {
					return true;
				}
			}
			//Sys.Application.initialize();

			document.getElementById('RangeValidator1').dispose = function() {
				Array.remove(Page_Validators, document
						.getElementById('RangeValidator1'));
			}

			document.getElementById('RangeValidator3').dispose = function() {
				Array.remove(Page_Validators, document
						.getElementById('RangeValidator3'));
			}

			document.getElementById('RangeValidator2').dispose = function() {
				Array.remove(Page_Validators, document
						.getElementById('RangeValidator2'));
			}

			document.getElementById('RangeValidator4').dispose = function() {
				Array.remove(Page_Validators, document
						.getElementById('RangeValidator4'));
			}

			document.getElementById('RangeValidator5').dispose = function() {
				Array.remove(Page_Validators, document
						.getElementById('RangeValidator5'));
			}
			//]]>
		</script>
	</form>
</body>
</html>
