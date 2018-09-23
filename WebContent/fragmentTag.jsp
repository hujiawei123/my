<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://aaa/mytaglib" prefix="mytaglib"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<mytaglib:fragment>
		<jsp:attribute name="fragment">
			<%--下面是动态的jsp页面片段 --%>
			<!-- 下面是动态的jsp页面片段 -->
			<mytaglib:helloWorld />
		</jsp:attribute>
	</mytaglib:fragment>
	<br>
	<mytaglib:fragment>
		<jsp:attribute name="fragment">
			${pageContext.request.remoteAddr }
		</jsp:attribute>
	</mytaglib:fragment>
</body>
</html>