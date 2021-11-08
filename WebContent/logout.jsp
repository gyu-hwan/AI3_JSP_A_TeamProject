<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	session.removeAttribute("member_mid");

	response.sendRedirect("index.jsp");
%>
</body>
</html>