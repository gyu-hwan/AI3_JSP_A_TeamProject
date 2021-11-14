<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    
    import="java.io.PrintWriter" 
    import="DAO.memberDAO"%>
<html>
	<head>
	<meta charset="utf-8">
	<title>A팀 프로젝트-업데이트</title>
	</head>
	<body>
	<%PrintWriter pw = response.getWriter(); %>
	<%
	String password=request.getParameter("password");
	String userID=(String)session.getAttribute("userID");
	
	if(userID.contains("\"")||userID.contains("\'")||userID.contains("=")){
		pw.println("<script>");
		pw.println("alert('XSS취약점이 발견되었습니다.')");
		pw.println("history.back()");
		pw.println("</script>");
	}else {
	memberDAO dao=new memberDAO();
	int a=dao.updatePW(password,userID);
	if(a==1){
		System.out.println("비밀번호가 변경됨");
		response.sendRedirect("./memberInfo");
		}
		else{
			System.out.println("비밀번호 변경 실패");
			}
		}
	%>
	</body>
</html>