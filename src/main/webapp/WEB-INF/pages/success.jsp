<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
		   uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../../plugin/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../../plugin/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="../../css/style1.css">
<script type="text/javascript" src="../../plugin/easyui/jquery.min.js"></script>
<script type="text/javascript" src="../../plugin/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../plugin/easyui/locale/easyui-lang-zh_CN.js"></script>
<style>
	.contaien{
		width: 100%;
		height: 100%;
	}
	#dg{
		margin: auto;
	}
	#dlg input{

		width: 100px;

	}
	#dlg{

		text-align: center;
	}
	#list{


	}
</style>

<html>
<body>
<div class="contaien">
   <div id="list">
	<table id="dg" title="My Users" style="width:550px;height:auto"
		   toolbar="#toolbar" idField="id"
		   rownumbers="true" fitColumns="true" singleSelect="true">
	</table>
	<div id="toolbar">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="adduser();">新增</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deletedata()">删除</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="edituser();">修改</a>
	</div>
   </div>
		<div id="dlg" style="padding:10px 60px 20px 60px;display: none;overflow: hidden;">
			<form id="ff" method="post" action="/user/save">
				<input type="hidden" name="id" id="id" value="${user.id}">
				<table cellpadding="5">
					<tr>
						<td>用户名:</td>
						<td><input class="easyui-textbox" type="text" id="username" name="username" data-options="required:true" value="${user.username}"></td>
					</tr>
					<tr>
						<td>密码:</td>
						<td><input class="easyui-textbox" type="text" name="password" id="password"
								   data-options="required:true,validType:'password'" value="${user.password}"></td>
					</tr>
				</table>
			</form>
			<div style="text-align:center;padding:5px">
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清空</a>
			</div>

		</div>

	<script>


		function adduser() {
			 $('#dlg').dialog({
				title: '添加用户',
				iconCls: "icon-add",
				collapsible: true,
				minimizable: true,
				maximizable: true,
				resizable: true,
				width: 600,
				height: 500,
				modal: true
			}).show();
		}

		function submitForm() {
			$('#ff').form('submit');
			location.reload("/user/golist")
		}
		function clearForm() {
			$('#ff').form('clear');
		}

	$('#dg').datagrid({
		url: 'http://localhost:8080/user/list',
		singleSelect: false,
		columns: [[
			{field: 'ck', title: '选择：', width: 100, checkbox: true},
			{field: 'username', title: '用户名：', width: 100},
			{field: 'password', title: '密码：', width: 100},
		]]
	});

	$('#btn').linkbutton({
		iconCls: 'icon-add'
	});

	function deletedata() {
		//返回选中多行
		var selRow = $('#dg').datagrid('getSelections')
		//判断是否选中行
		if (selRow.length == 0) {
			$.messager.alert("提示", "请选择要删除的行！", "info");
			return;
		} else {
			var temID = "";
			//批量获取选中行的评估模板ID
			for (i = 0; i < selRow.length; i++) {
				if (temID == "") {
					temID = selRow[i].id;
				} else {
					temID = selRow[i].id + "," + temID;
				}
			}

			$.messager.confirm('提示', '是否删除选中数据?', function (r) {

				if (!r) {
					return;
				}
				//提交
				$.ajax({
					type: "POST",
					async: false,
					url: "/user/del?delid=" + temID,
					data: temID,
					success: function (data) {

						if (data == "删除成功") {
							$('#dg').datagrid('clearSelections');
							$.messager.alert("提示", "恭喜您，信息删除成功！", "info");
							$('#dg').datagrid('reload');
						} else {
							$.messager.alert("提示", "删除失败，请重新操作！", "info");
							return;
						}
					}
				});
			});

		}
	}
		function edituser() {
			var selRow = $('#dg').datagrid('getSelections');
			var tID=null;
			if (selRow.length == 0) {
				$.messager.alert("提示", "请选择要修改的行！", "info");
				return;
			} else if(selRow.length >1){
				$.messager.alert("提示", "请选择不要选择多行！", "info");
			}else if(selRow.length ==1){
				tID=selRow[0].id;
			}

			$.ajax({
				type:'post',
                url:'/user/edit',
				data:"sid="+tID,
			    dataType:"json",
			    success:function(data){
					alert(data.password);
					console.info( $("#username"));
                    $("#username").val(data.username);
					$("#password").val(data.password);
					$("#id").val(data.id);


				}



			});
			$('#dlg').dialog({
				title: '添加用户',
				iconCls: "icon-add",
				collapsible: true,
				minimizable: true,
				maximizable: true,
				resizable: true,
				width: 600,
				height: 500,
				modal: true
			}).show();
		}

</script>
</div>
</body>
</html>