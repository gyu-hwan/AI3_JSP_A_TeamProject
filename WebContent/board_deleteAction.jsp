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
	int board_idx = Integer.parseInt(request.getParameter("board_idx"));

	boardVO bbs = new boardDAO().getBoard(board_idx);
	if (!userID.equals(bbs.getId())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('������ �����ϴ�')");
		script.println("location.href='bbs'");
		script.println("</script>");
	} else {
		boardDAO BoardDAO = new boardDAO();
		int result = BoardDAO.delete(board_idx);
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
			script.println("location.href='board'");
			script.println("</script>");
		}
	}
	%>
</body>
</html>