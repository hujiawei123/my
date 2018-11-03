<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://aaa/mytaglib" prefix="mytag"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	请输入你的名字:
	<form action="useFunction.jsp" method="post">
		你的名字:<input type="text" name="name" value="${param['name'] }" /> <input
			type="submit" value="提交">
	</form>
	<table border="1" bgcolor="#aaaadd" width="660px">
		<tr>
			<td width="170"><b>功能</b></td>
			<td width="200"><b>表达式语言</b></td>
			<td width="220"><b>计算结果</b></td>
		</tr>
		<tr>
			<td>反转</td>
			<td>\${mytag:reverse(param.name) }</td>
			<td>${mytag:reverse(param.name) }</td>
		</tr>
		<tr>
			<td>计数</td>
			<td>\${mytag:countChar(param.name) }</td>
			<td>${mytag:countChar(param.name) }</td>
	</table>
</body>
</html>