<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.memberDAO"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<title>A팀 프로젝트-로그인</title>
	</head>
	<body>
	<%
	String userID=request.getParameter("Id");
	String userPassword=request.getParameter("Pw");
	String userName=request.getParameter("Name");
	String userPhone=request.getParameter("Phone");
	
	memberDAO dao=new memberDAO();
	dao.signUp(userID,userPassword,userName,userPhone);
	System.out.println("회원가입을 시도함");
	response.sendRedirect("./index.jsp");
	
	%>
	</body>
</html>