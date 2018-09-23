<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://aaa/mytaglib" prefix="mytag"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>迭代器标签</title>
</head>
<body>
	<h2>带标签体的标签-迭代器标签</h2>
	<%
		List<String> a = new ArrayList<>();
		a.add("hujiawei");
		a.add("胡家伟");
		a.add("xudoudou");
		pageContext.setAttribute("a", a);
	%>
	<table border="1" bgcolor="#aaaadd" width="300px">
		<mytag:iterator item="item" collection="a">
			<tr>
				<td>${pageScope.item}</td>
			</tr>
		</mytag:iterator>
	</table>
</body>
</html>