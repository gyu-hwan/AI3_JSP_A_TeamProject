<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="https://cdn.ckeditor.com/ckeditor5/31.0.0/classic/ckeditor.js"></script>
<title>A팀 프로젝트</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="index">Main</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="logout" style="text-align: right">로그아웃<span
						class="sr-only">(current)</span></a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<form method="post"  action="addBookAction">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd; width: 600px">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">책목록 
								추가</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="책 제목" name="title" maxlength="100"></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="작가 이름" name="writer" maxlength="70"></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="출판사" name="publisher" maxlength="70"></td>
						</tr>
						<tr>
							<td><input type="date" class="form-control"
								placeholder="출간일 " name="year" maxlength="70"></td>
						</tr>
						<tr>
							<td>
								<datalist id=fieldList>
								<option value="소설"></option>
								<option value="인문"></option>
								<option value="유아"></option>
								<option value="건강"></option>
								<option value="사전"></option>
								<option value="해외도서"></option>
								</datalist>
								<input type="text" class="form-control" list="fieldList"
								placeholder="분야 " name="field" maxlength="70"></td>
								
						</tr>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="배경 이미지 URL 입력" name="imgURL" maxlength="200"></td>
						</tr>
						
						<tr>
							<td><textarea class="form-control" placeholder="책 설명"
									name="content" maxlength="1024" style="height: 350px;"></textarea></td>
						</tr>
						<tr class="form-control">
						      <label><input type="radio" name="loan" value="0" checked> 출판됨</label>
      							<label><input type="radio" name="loan" value="1"> 출판되지않음</label>
      					</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>
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
