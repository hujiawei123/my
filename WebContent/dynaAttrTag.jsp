<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://aaa/mytaglib" prefix="mytag"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>动态属性标签</title>
</head>
<body>
	<h2>下面显示的是自定义标签中的内容</h2>
	<h4>指定2个属性</h4>
	<mytag:dynaAttr name="胡家伟" age="28岁" />
	<br>
	<h4>指定4个属性</h4>
	<mytag:dynaAttr name="许豆豆" age="25岁" sex="女" addr="江苏南京"/>
</body>
</html>