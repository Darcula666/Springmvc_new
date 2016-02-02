<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="../../plugin/bootstrap-3.3.5/jquery-1.11.1.js"></script>
<script type="text/javascript">
    function edit(){
        document.myform.action = "/user/update";
        document.myform.submit();
    }
    function add(){
        document.myform.action = "/user/add";
        document.myform.submit();
    }


</script>
<html>
<head>
    <title>添加用户</title>
</head>
<body>
<form name="myform" method="post" id="myform">
    <input type="hidden"  name="id" value="${user.id}">
  用户名：<input type="text" name="username" value="${user.username}">
  密码:   <input type="text" name="password" value="${user.password}">
    <input type="button" value="添加" onclick="add()">
    <input type="button" value="修改" onclick="edit()">
</form>
</body>
</html>
