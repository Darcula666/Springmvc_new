<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/10/9
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>init</title>
</head>
<body>
<a href="/user/testModelAndView">testModelAndView</a><br>
<br>
<a href="/user/testRest/1">Test Rest Get</a>
<br>

<form action="/user/testRest" method="post">
    <input type="submit" value="Test Rest Post">
</form>
<br>

<form action="/user/testRest/1" method="post">
    <input type="hidden" name="_method" value="DELETE">
    <input type="submit" value="Test Rest Delete">
</form>
<br>

<form action="/user/testRest/1" method="post">
    <input type="hidden" name="_method" value="PUT">
    <input type="submit" value="Test Rest Put">
</form>
<br>
<a href="/user/testAntPath/asdasdasd/abc">testAntPath</a><br>
<a href="/user/testPathVariable/87">testPathVariable</a><br>
<a href="/user/testParamsAndHeaders?username=tt&age=20">测试参数和请求头</a><br>
<a href="/user/testMethod">测试方法</a><br>

<form action="/user/testMethod" method="post">
    <input type="submit" value="sub">
</form>
<br>
<a href="/user/testRequestParam?username=xiaobu&age=11">testRequestParam</a><br>
</body>
</html>
