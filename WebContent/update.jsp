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
<title>A팀 프로젝트</title>
</head>
<body>
	<%
	// 세션에 값이 담겨있는지 체크
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href='login'");
		script.println("</script>");
	}
	int board_idx = 0;
	if (request.getParameter("board_idx") != null) {
		board_idx = Integer.parseInt(request.getParameter("board_idx"));
	}
	if (board_idx == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다')");
		script.println("location.href='bbs'");
		script.println("</script>");
	}
	//해당 'bbsID'에 대한 게시글을 가져온 다음 세션을 통하여 작성자 본인이 맞는지 체크한다
	boardVO board = new boardDAO().getBoard(board_idx);
	if (!userID.equals(board.getId())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다')");
		script.println("location.href='bbs'");
		script.println("</script>");
	}
	%>

	<!-- 네비게이션 -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="index">처음으로</a> <a
			class="navbar-brand" href="main">도서관리</a> <a class="navbar-brand"
			href="board">게시판</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="nav navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="logout" style="text-align: right">로그아웃<span
						class="sr-only">(current)</span></a></li>
			</ul>
		</div>
	</nav>
	<!-- 네비게이션 영역 끝 -->

	<!-- 게시판 글 수정 양식 영역 시작 -->
	<div class="container">
		<div class="row">
			<form method="post"
				action="updateAction?board_idx=<%=board_idx%>">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd; width: 600px">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">작성 글
								수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="title" maxlength="100" value="<%=board.getTitle() %>"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="content" maxlength="1024" style="height: 350px;"><%=board.getContent() %></textarea></td>
						</tr>
					</tbody>
				</table>
				<!-- 글쓰기 버튼 생성 -->
				<input type="submit" class="btn btn-primary pull-right"
					value="수정하기 ">
			</form>
		</div>
	</div>
	<!-- 게시판 글 수정 양식 영역 끝 -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
</body>
</html>
