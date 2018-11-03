<%@tag import="java.util.List"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="bgColor"%>
<%@ attribute name="cellColor"%>
<%@ attribute name="title"%>
<%@ attribute name="bean"%>
<table border="1" bgcolor="${bgColor }">
	<tr>
		<td><b>${title }</b></td>
	</tr>
	<%
		List<String> list = (List<String>) request.getAttribute("a");
		for (Object o : list) {
	%>
	<tr>
		<td bgcolor="${cellColor }"><%=o%></td>
	</tr>
	<%
		}
	%>
</table>