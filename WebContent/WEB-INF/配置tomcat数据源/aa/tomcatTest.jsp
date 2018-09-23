<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Context ctx=new InitialContext();;
DataSource ds =(DataSource)ctx.lookup("java:comp/env/jdbc/dstest");
Connection conn=ds.getConnection();
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery("select * from news_inf");
while(rs.next()){
	out.println(rs.getString(1)+"\t"+rs.getString(2)+"<br>");
}
%>
</body>
</html>