<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>迭代器 tag file</title>
</head>
<body>
<%
//创建list集合,用于测试
List<String> a=new ArrayList<>();
a.add("hujiawei");
a.add("胡家伟");
a.add("xudoudou");
request.setAttribute("a", a);
%>
<h2>使用自定义标签</h2>
<tags:iterator bgColor="#99dd99" cellColor="#9999cc" title="迭代器标签" bean="a"/>
</body>
</html>