<%@ page import="java.io.PrintWriter"%>
<%@ page import="DAO.boardDAO"%>
<%@ page import="DTO.boardVO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	boardDAO boardDAO = new boardDAO();
	int result = boardDAO.writeBoard(userID, title, content);
	// �����ͺ��̽� ������ ���
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�ۼ����� �����߽��ϴ�')");
		script.println("history.back()");
		script.println("</script>");
		// �۾��Ⱑ ���������� ����Ǹ� �˸�â�� ���� �Խ��� �������� �̵��Ѵ�
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('���� ����')");
		script.println("location.href='board.jsp'");
		script.println("</script>");
	}
	%>
</body>
</html>