<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="../../plugin/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../../plugin/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="../../css/style1.css">
<script type="text/javascript" src="../../plugin/easyui/jquery.min.js"></script>
<script type="text/javascript" src="../../plugin/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../plugin/easyui/locale/easyui-lang-zh_CN.js"></script>

<html>
<head>
    <title>添加用户</title>
</head>


<body class="easyui-layout">
<div class="easyui-panel" title="添加用户" style="width:400px;" >

    <div style="padding:10px 60px 20px 60px" >
        <form id="ff" method="post" action="/user/save">
            <input type="hidden"  name="id" value="${user.id}">
            <table cellpadding="5">
                <tr>
                    <td>用户名:</td>
                    <td><input class="easyui-textbox" type="text" name="username" data-options="required:true"></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><input class="easyui-textbox" type="text" name="password" data-options="required:true,validType:'password'"></td>
                </tr>
            </table>
        </form>
        <div style="text-align:center;padding:5px">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">Submit</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">Clear</a>
        </div>
    </div>

<script>
    function submitForm(){
        $('#ff').form('submit');
        location.reload("/user/golist")
    }
    function clearForm(){
        $('#ff').form('clear');
    }
</script>
</div>
</body>
</html>
