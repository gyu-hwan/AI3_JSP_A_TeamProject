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
	String Phone=request.getParameter("Phone");
	String userID=(String)session.getAttribute("userID");
	
	if(userID.contains(" ")||userID.contains("-")){
		pw.println("<script>");
		pw.println("alert('띄어쓰기와'-'를 빼고 입력해주세요.')");
		pw.println("history.back()");
		pw.println("</script>");
	}else {
	memberDAO dao=new memberDAO();
	int a=dao.updatePhone(Phone,userID);
	if(a==1){
		System.out.println("전화번호가 변경됨");
		response.sendRedirect("./memberInfo");
		}
		else{
			System.out.println("전화번호 변경 실패");
			}
		}
	%>
	</body>
</html>