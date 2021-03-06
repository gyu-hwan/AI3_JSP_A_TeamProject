<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="DAO.boardDAO"%>
<%@ page import="DTO.boardVO"%>
<%@ page import="java.util.ArrayList"%>


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
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	 int Board_idx = 0;
		if (request.getParameter("Board_idx") != null){
			Board_idx = Integer.parseInt(request.getParameter("Board_idx"));
		}
	%>
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
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
					boardDAO BoardDAO = new boardDAO(); // 인스턴스 생성
					ArrayList<boardVO> BoardList = BoardDAO.getBoardList(pageNumber);
					for (int i = 0; i < BoardList.size(); i++) {
					%>
					<tr>
						<td><%=BoardList.get(i).getBoard_idx()%></td>
						<!-- 게시글 제목을 누르면 해당 글을 볼 수 있도록 링크를 걸어둔다 -->
						<td><a href="view?board_idx=<%=BoardList.get(i).getBoard_idx()%>">
								<%=BoardList.get(i).getTitle()%></a></td>
						<td><%=BoardList.get(i).getId()%></td>
						<td><%=BoardList.get(i).getDate()%></td>
						<td><%=BoardList.get(i).getHit()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<!-- 페이징 처리 영역 -->
		<div class=container style="text-align:center">
			<%
			boardDAO BoardDAO1 = new boardDAO();
				int pages = (int) Math.ceil(BoardDAO1.getCount()/10)+1;
				for(int i=1; i<=pages; i++){ %>
					<button type="button" onclick="location.href='board?Board_idx=<%=Board_idx %>&pageNumber=<%=i %>'"><%=i %></button>
				<%} %>
		</div>

			<a href="write" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>


</body>
</html>
