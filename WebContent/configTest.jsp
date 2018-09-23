<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试config内置对象</title>
</head>
<body>
<%=config.getServletName() %>
<br>
name配置参数的值:<%=config.getInitParameter("name") %><br>
age配置参数的值:<%=config.getInitParameter("age") %> <br/>

</body>
</html>