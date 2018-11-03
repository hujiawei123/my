<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
浏览器提交数据为:${info }<br>
<% 
out.println("业务调用结束时间:"+new Date());
if(request.isAsyncStarted()){
	request.getAsyncContext().complete();
}

%>