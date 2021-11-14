<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
	<% session.invalidate(); %>

	<script>
		alert("로그아웃!");
		location.href = 'index';
	</script>

</body>
</html>
