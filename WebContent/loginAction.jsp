<%@page import="java.io.PrintWriter"%>
<%@ page import="DAO.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	int result=dao.login(userID,userPassword);
	if(result == 1){
		session.setAttribute("userID",userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 성공')");
		script.println("location.href='index'");
		script.println("</script>");
	}else if(result == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다')");
		script.println("history.back()");
		script.println("</script>");
	}else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다')");
		script.println("history.back()");
		script.println("</script>");
	}else if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류입니다')");
		script.println("history.back()");
		script.println("</script>");
	}

	%>
	</body>
</html>
