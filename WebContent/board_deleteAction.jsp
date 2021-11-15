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
		script.println("alert('권한이 없습니다')");
		script.println("location.href='bbs'");
		script.println("</script>");
	} else {
		boardDAO BoardDAO = new boardDAO();
		int result = BoardDAO.delete(board_idx);
		// 데이터베이스 오류인 경우
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글수정에 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");
			// 글쓰기가 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동한다
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제 성공')");
			script.println("location.href='board'");
			script.println("</script>");
		}
	}
	%>
</body>
</html>