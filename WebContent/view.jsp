<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="DTO.boardVO"%>
<%@ page import="DAO.boardDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}

	int board_idx = 0;
	if (request.getParameter("board_idx") != null) {
		board_idx = Integer.parseInt(request.getParameter("board_idx"));
		
	}
	if (board_idx == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다')");
		script.println("location.href='board.jsp'");
		script.println("</script");
	}
	boardVO board = new boardDAO().getBoard(board_idx);
	boardDAO dao=new boardDAO();
	if(dao.hitplus(board_idx,board.getHit())==(-1)){System.out.print("오류");};
	%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="index.jsp">처음으로</a> <a
			class="navbar-brand" href="main.jsp">도서관리</a> <a class="navbar-brand"
			href="board.jsp">게시판</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="nav navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="logout.jsp" style="text-align: right">로그아웃<span
						class="sr-only">(current)</span></a></li>
			</ul>
		</div>
	</nav>


	<!-- 게시판 글 보기 양식 영역 시작 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2"
							style="background-color: #eeeeee; text-align: center;">게시판 글
							보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%=board.getTitle()%></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><%=board.getId()%></td>
					</tr>
					<tr>
						<td>조회수</td>
						<td><%=(board.getHit())+1%></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%=board.getDate()%></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="height: 200px; text-align: left;"><%=board.getContent()%></td>
					</tr>
				</tbody>
			</table>


			<!-- 해당 글의 작성자가 본인이라면 수정과 삭제가 가능하도록 코드 추가 -->
			<%
			if (userID != null && userID.equals(board.getId())) {
			%>
			<a href="update.jsp?board_idx=<%=board_idx%>" class="btn btn-primary">수정</a>
			<a onclick="return confirm('삭제하시겠습니까?')"
				href="board_deleteAction.jsp?board_idx=
				<%=board_idx%>
				"
				class="btn btn-primary">삭제</a>
			<%
			}
			%>
		</div>
	</div>
	<!-- 게시판 글 보기 양식 영역 끝 -->

	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
</body>
</html>