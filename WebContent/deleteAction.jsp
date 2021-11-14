<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    
    import="java.io.PrintWriter" 
    import="DAO.memberDAO"%>
<html>
	<head>
	<meta charset="utf-8">
	<title>A팀 프로젝트-정보삭제</title>
	</head>
	<body>
	<%PrintWriter pw = response.getWriter(); %>
	<%
	String _delete=(String)request.getParameter("_delete");
	String userID=(String)session.getAttribute("userID");
	
	if(!(_delete.equals(userID))){
		pw.println("<script>");
		pw.println("alert('id가 정확하지 않습니다.')");
		pw.println("history.back()");
		pw.println("</script>");
	}else {
	memberDAO dao=new memberDAO();
	int a=dao.Delete(userID);
	if(a==1){
		System.out.println("유저가 삭제됨");
		session.invalidate();
		response.sendRedirect("./index");
		}
		else{
			System.out.println("유저삭제 실패");
			}
		}
	%>
	</body>
</html>