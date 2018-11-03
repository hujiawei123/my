<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul>
	<c:forEach items="${books }" var="book">
		<li>${book }</li>
	</c:forEach>
</ul>
<% 
out.println("业务调用结束时间:"+new Date());
if(request.isAsyncStarted()){
	request.getAsyncContext().complete();
}

%>