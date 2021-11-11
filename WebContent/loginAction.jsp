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
	
	memberDAO dao=new memberDAO();
	int login=dao.login(userID,userPassword);
	
	switch(login){
	case 1:{
		System.out.println("로그인 성공");
		session.setAttribute("userID",userID);
		response.sendRedirect("./main.jsp");}
	break;
	case 0:{
		System.out.println("비밀번호 실패");
		response.sendRedirect("./index.jsp");}
	break;
	case -1:{
		System.out.println("아이디 실패");
		response.sendRedirect("./index.jsp");}
	break;
	case -2:{
		System.out.println("db접속 불가");
		response.sendRedirect("./index.jsp");}
	break;
	default:{out.print("비정상 접속"+login);}
	}
	%>
	</body>
</html>
