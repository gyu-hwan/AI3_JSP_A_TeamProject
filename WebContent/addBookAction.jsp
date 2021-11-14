<%@ page import="java.io.PrintWriter"%>
<%@ page import="DAO.booklistDAO"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 추가 메뉴</title>
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
String writer=request.getParameter("writer");
String publisher=request.getParameter("publisher");
String year=request.getParameter("year");
int loan= Integer.parseInt(request.getParameter("loan"));
String field=request.getParameter("field");
String imgURL=request.getParameter("imgURL");
String content=request.getParameter("content");

			booklistDAO booklistDAO = new booklistDAO();
			int result = booklistDAO.AddBook(title,writer,publisher,year,loan,content,field,imgURL);
			// 데이터베이스 오류인 경우
			if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('책쓰기를 실패했습니다')");
		script.println("history.back()");
		script.println("</script>");
		// 글쓰기가 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동한다
			} else {
				PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('책쓰기 성공')");
		script.println("location.href='main'");
		script.println("</script>");}
	
	%>
</body>
</html>
