<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>小脚本测试</title>
</head>
<body>
	<%
		//注册数据库驱动
		Class.forName("com.mysql.jdbc.Driver");
		//获取数据库连接
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "hjw", "123456");
		//创建statement
		Statement stmt = conn.createStatement();
		//执行查询
		ResultSet rs = stmt.executeQuery("select * from news_inf");
	%>
	<table bgcolor="#9999dd" border="1" width="300px">
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>