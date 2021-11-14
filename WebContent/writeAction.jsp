<%@ page import="java.io.PrintWriter"%>
<%@ page import="DAO.boardDAO"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
%>
<% 

String title=request.getParameter("title");	
String content=request.getParameter("content");

			boardDAO boardDAO = new boardDAO();
			int result = boardDAO.writeBoard(userID,title ,content);
			// 데이터베이스 오류인 경우
			if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글쓰기에 실패했습니다')");
		script.println("history.back()");
		script.println("</script>");
		// 글쓰기가 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동한다
			} else {
				PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글쓰기 성공')");
		script.println("location.href='board'");
		script.println("</script>");}
	
	%>
</body>
</html>
