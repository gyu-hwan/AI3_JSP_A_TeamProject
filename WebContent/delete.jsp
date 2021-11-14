<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body{
background-image:url('https://cdn.pixabay.com/photo/2016/08/24/16/20/books-1617327_960_720.jpg');
background-repeat:no-repeat;
background-size:cover;
}
</style>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <title>A팀 프로젝트</title>
  </head>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="main">Main</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="memberInfo" style="text-align:right">회원정보</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="updatePw" style="text-align:right">비밀번호 변경</a>
      </li>
	  <li class="nav-item">
        <a class="nav-link" href="updatePhone" style="text-align:right">휴대폰번호 변경</a>
      </li>
		<li class="nav-item">
        <a class="nav-link" href="delete" style="text-align:right">회원 탈퇴<span class="sr-only">(current)</span></a>
      </li>
    </ul>
  </div>
</nav>
<body>
<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h3>삭제하시려면 본 계정의 id를 입력해 주세요.</h3>
				<form method="post" action="deleteAction">
				<input type="text" class="form-control" placeholder="<%=session.getAttribute("userID")%>" name="_delete" maxlength="20">
					<input type="submit" class="btn btn-primary form-control" value="회원탈퇴">
				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
  </body>
</html>