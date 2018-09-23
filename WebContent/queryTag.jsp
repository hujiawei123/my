<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://aaa/mytaglib" prefix="mytag"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自定义标签示范</title>
</head>
<body>
	<mytag:query user="hjw" url="jdbc:mysql://localhost:3306/test"
		pass="123456" driver="com.mysql.jdbc.Driver"
		sql="select * from news_inf" />
</body>
</html>