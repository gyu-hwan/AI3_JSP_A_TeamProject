<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DAO.memberDAO"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<title>A팀 프로젝트-로그인</title>
	</head>
	<body>
	<%PrintWriter pw = response.getWriter(); %>
	<%
	String userID=request.getParameter("Id");
	String userPassword=request.getParameter("Pw");
	String userName=request.getParameter("Name");
	String userPhone=request.getParameter("Phone");
	
	if(userID.contains(" ")||userPassword.contains(" ")){
		pw.println("<script>");
		pw.println("alert('ID혹은 비밀번호에 띄어쓰기가 존재합니다')");
		pw.println("history.back()");
		pw.println("</script>");
	}else {
	memberDAO dao=new memberDAO();
	dao.signUp(userID,userPassword,userName,userPhone);
	System.out.println("회원가입을 시도함");
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('회원가입 성공')");
	script.println("location.href='index'");
	script.println("</script>");
	script.println("location.href='index'");
	}
	%>
	</body>
</html>