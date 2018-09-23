<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=utf-8" language="java" errorPage=""%>
<html>
<head>
	<title>欢迎</title>
</head>
<body>
	欢迎学习java Web知识,现在时间是:
	<%out.println(new Date()); %>
</body>
</html>
