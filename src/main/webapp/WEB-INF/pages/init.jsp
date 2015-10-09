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
<a href="/user/testAntPath/asdasdasd/abc">testAntPath</a><br>

<a href="/user/testParamsAndHeaders?username=tt&age=20">测试参数和请求头</a><br>
 <a href="/user/testMethod">测试方法</a><br>
 <form action="/user/testMethod" method="post">
   <input type="submit" value="sub">
 </form>
</body>
</html>
