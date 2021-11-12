<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style>
body {
	background-image:
		url('https://cdn.pixabay.com/photo/2016/08/24/16/20/books-1617327_960_720.jpg');
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
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
	%>

	<%
	if (userID == null) {
	%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="index.jsp">Main</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="login.jsp" style="text-align: right">로그인<span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="join.jsp"
					style="text-align: right">회원가입</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>도서관리 사이트</h1>
				<p>이 웹 사이트는 도서관리를 목적으로 만들어 졌습니다</p>
				<a class="btn btn-primary btn-pull" href="login.jsp" role="button">로그인</a>
				<a class="btn btn-primary btn-pull" href="join.jsp" role="button">회원가입</a>
			</div>
		</div>
	</div>
	<%
	} else {
	%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="index.jsp">Main</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item  active"><a class="nav-link"
					href="main.jsp" style="text-align: right">도서관리<span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item "><a class="nav-link" href="board.jsp"
					style="text-align: right">게시판</a></li>
				<li class="nav-item "><a class="nav-link" href="memberInfo.jsp"
					style="text-align: right">내정보</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item  active"><a class="nav-link" href="logout.jsp"
					style="text-align: right">로그아웃</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>도서관리 사이트</h1>
				<p>이 웹 사이트는 도서관리를 목적으로 만들어 졌습니다</p>
				<p>환영합니다</p>
				<a class="btn btn-primary btn-pull" href="main.jsp" role="button">메인화면</a>
				<a class="btn btn-primary btn-pull" href="logout.jsp" role="button">로그아웃</a>
			</div>
		</div>
	</div>
	<%
	}
	%>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
</body>
</html>
