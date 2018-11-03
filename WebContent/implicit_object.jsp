<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>表达式语言-内置对象</title>
</head>
<body>
	<h2>表达式语言-内置对象</h2>
	请输入你的名字:
	<form action="implicit_object.jsp" method="post">
		你的名字:<input type="text" name="name" value="${param['name'] }" /> <input
			type="submit" value="提交">
	</form>
	<br>
	<%
		session.setAttribute("user", "abc");
		//添加cookie
		Cookie c = new Cookie("name", "hujiawei");
		c.setMaxAge(24 * 60 * 60);
		response.addCookie(c);
	%>
	<table border="1" bgcolor="#aaaadd" width="660px">
		<tr>
			<td width="170"><b>功能</b></td>
			<td width="200"><b>表达式语言</b></td>
			<td width="220"><b>计算结果</b></td>
		</tr>
		<tr>
			<td>取得请求参数值</td>
			<td>\${param.name}</td>
			<td>${param.name }</td>
		</tr>
		<tr>
			<td>取得请求参数值</td>
			<td>\${param['name'] }</td>
			<td>${param['name'] }&nbsp;</td>
		</tr>
		<tr>
			<td>取得请求头的值</td>
			<td>\${header.host }</td>
			<td>${header.host }</td>
		</tr>
		<tr>
			<td>取得请求头的值</td>
			<td>\${header['accept'] }</td>
			<td>${header['accept'] }</td>
		</tr>
		<tr>
			<td>取得初始化参数</td>
			<td>\${initParam['author'] }</td>
			<td>${initParam['author'] }</td>
		</tr>
		<tr>
			<td>取得session的属性值</td>
			<td>\${sessionScope['user'] }</td>
			<td>${sessionScope['user']}</td>
		</tr>
		<tr>
			<td>取得指定cookie值</td>
			<td>\${cookie['name'].value}</td>
			<td>${cookie['name'].value}</td>
		</tr>
	</table>
</body>
</html>