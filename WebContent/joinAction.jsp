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
	String userID=request.getParameter("userID");
	String userPassword=request.getParameter("userPassword");
	String userName=request.getParameter("userName");
	int userPhone=Integer.parseInt(request.getParameter("userPhone"));
	
	memberDAO dao=new memberDAO();
	dao.signUp(userID,userPassword,userName,userPhone);
	System.out.println("회원가입 성공");
	response.sendRedirect("./index.jsp");
	%>
	</body>
</html>