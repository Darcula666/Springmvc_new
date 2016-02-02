<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
		   uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="../../plugin/bootstrap-3.3.5/jquery-1.11.1.js"></script>
<html>
<body>
	<table border="1">
		<tr>
			<td>
				姓名
			</td>
			<td>
				密码
			</td>
			<td>
				操作
			</td>
		</tr>
		<c:forEach begin="1" end="15" items="${message}" var="u">
			<tr>
				<td>${u.username}</td>
				<td>${u.password}</td>
				<td>
					<a href="/user/getUser?getid=${u.id}">修改</a>
					<a href="/user/del?delid=${u.id}">删除</a>
				</td>
			</tr>

		</c:forEach>

	</table>
</body>
</html>