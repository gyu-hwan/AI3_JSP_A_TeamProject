<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" import="DAO.booklistDAO" import="DTO.booklistVO" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>A팀 프로젝트</title>
        <!-- Favicon-->
        <link rel="stylesheet" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="./Resources/css/styles.css" rel="stylesheet" />
        <%
                int _page=0;
                if(session.getAttribute("page")==null){
                _page=0;
                }
                else{_page=(int)session.getAttribute("page");}
				
                booklistDAO bookList=new booklistDAO();
                ArrayList<booklistVO> dtos=bookList.AllBook(1);
                %>
    </head>
    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#!">책</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="index.jsp">홈</a></li>
                        <li class="nav-item"><a class="nav-link" href="main.jsp">도서관리</a></li>
                        <li class="nav-item"><a class="nav-link" href="board.jsp">게시판</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="logout.jsp">로그아웃</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="memberInfo.jsp">내정보</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page header with logo and tagline-->
        <header class="py-5 bg-light border-bottom mb-4">
            <div class="container">
                <div class="text-center my-5">
                    <h1 class="fw-bolder">원하는 책을 마음껏 검색해보세요!</h1>
                    <p class="lead mb-0"></p>
                </div>
            </div>
        </header>
        <!-- Page content-->
        <div class="container">
            <div class="row">
                <!-- Blog entries-->
                <div class="col-lg-8">
                    <!-- Featured blog post-->
                    <div class="card mb-4">
                    <%booklistVO dto=dtos.get(0);%>
                        <div style="position: relative;overflow: hidden;height: 350px;">
                        	<a href="#!"><img class="card-img-top" src="<%=dto.getImgURL()%>" width="850px" alt="..." /></a>
                        </div>
                        <div class="card-body">
                            <div class="small text-muted"><%=dto.getYear()%> 출간</div>
                            <h2 class="card-title"><%=dto.getTitle()%></h2>
                            <p class="card-text"><%=dto.getContent()%></p>
                            <a class="btn btn-primary" href="#!">Read more →</a>
                        </div>
                    </div>
                    <!-- Nested row for non-featured blog posts-->
                    <div class="row">
                        <div class="col-lg-6">
                            <!-- Blog post-->
                            <div class="card mb-4">
                            <%booklistVO dto1=dtos.get(1);%>
                            	<div style="overflow: hidden;height: 350px;">
                                	<a href="#!"><img class="card-img-top" src="<%=dto1.getImgURL()%>" width="700px" alt="..." /></a>
                                </div>
                                <div class="card-body">
                                    <div class="small text-muted"><%=dto1.getYear()%> 출간</div>
                                    <h2 class="card-title h4"><%=dto1.getTitle()%></h2>
                                    <p class="card-text"><%=dto1.getContent()%></p>
                                    <a class="btn btn-primary" href="#!">Read more →</a>
                                </div>
                            </div>
                            <!-- Blog post-->
                            <div class="card mb-4">
                            <%booklistVO dto2=dtos.get(2);%>
                                <a href="#!" style="overflow: hidden;height: 350px;">
                                <img class="card-img-top" src="<%=dto2.getImgURL()%>" alt="..." /></a>
                                <div class="card-body">
                                    <div class="small text-muted"><%=dto2.getYear()%> 출간</div>
                                    <h2 class="card-title h4"><%=dto2.getTitle()%></h2>
                                    <p class="card-text"><%=dto2.getContent()%></p>
                                    <a class="btn btn-primary" href="#!">Read more →</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <!-- Blog post-->
                            <div class="card mb-4">
                            <%booklistVO dto3=dtos.get(3);%>
                                <a href="#!" style="overflow: hidden;height: 350px;">
                                <img class="card-img-top" src="<%=dto3.getImgURL()%>" alt="..." /></a>
                                <div class="card-body">
                                    <div class="small text-muted"><%=dto3.getYear()%> 출간</div>
                                    <h2 class="card-title h4"><%=dto3.getTitle()%></h2>
                                    <p class="card-text"><%=dto3.getContent()%></p>
                                    <a class="btn btn-primary" href="#!">Read more →</a>
                                </div>
                            </div>
                            <!-- Blog post-->
                            <div class="card mb-4">
                            <%booklistVO dto4=dtos.get(4);%>
                                <a href="#!" style="overflow: hidden;height: 350px;">
                                <img class="card-img-top" src="<%=dto4.getImgURL()%>" alt="..." /></a>
                                <div class="card-body">
                                    <div class="small text-muted"><%=dto4.getYear()%> 출간</div>
                                    <h2 class="card-title h4"><%=dto4.getTitle()%></h2>
                                    <p class="card-text"><%=dto4.getContent()%></p>
                                    <a class="btn btn-primary" href="#!">Read more →</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Pagination-->
                    <nav aria-label="Pagination">
                        <hr class="my-0" />
                        <ul class="pagination justify-content-center my-4">
                            <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Newer</a></li>
                            <li class="page-item active" aria-current="page"><a class="page-link" href="#!">1</a></li>
                            <li class="page-item"><a class="page-link" href="#!">2</a></li>
                            <li class="page-item"><a class="page-link" href="#!">3</a></li>
                            <li class="page-item disabled"><a class="page-link" href="#!">...</a></li>
                            <li class="page-item"><a class="page-link" href="#!">15</a></li>
                            <li class="page-item"><a class="page-link" href="#!">Older</a></li>
                        </ul>
                    </nav>
                </div>
                <!-- Side widgets-->
                <div class="col-lg-4">
                    <!-- Search widget-->
                    <div class="card mb-4">
						<div class="card-header">
                          	<p><%=session.getAttribute("userID")%>님</p>
                          	<p>&nbsp;</p>
                          	<a href="addBook.jsp""><button class="btn btn-primary" id="button-search" type="button">&nbsp;책 리뷰</button></a>
							<a href="memberInfo.jsp""><button class="btn btn-primary" id="button-search" type="button">&nbsp;회원정보</button></a>
							<a href="logout.jsp"><button class="btn btn-primary" id="button-search" type="button">&nbsp;로그아웃 </button></a>
						</div>
					</div>
                    <div class="card mb-4">
                    
                        <div class="card-header">도서 검색</div>
                        
                        <div class="card-body">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="Enter search term..." aria-label="Enter search term..." aria-describedby="button-search" />
                                <button class="btn btn-primary" id="button-search" type="button">검색</button>
                            </div>
                        </div>
                    </div>
                    <!-- Categories widget-->
                    <div class="card mb-4">
                        <div class="card-header">분야별 찾기</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#!">소설</a></li>
                                        <li><a href="#!">인문</a></li>
                                        <li><a href="#!">유아</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#!">건강</a></li>
                                        <li><a href="#!">사전</a></li>
                                        <li><a href="#!">해외도서</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Side widget-->
                    <div class="card mb-4">
                        <div class="card-header">인생책, 100리스트</div>
                        <div class="card-body">인생에 한번쯤은 꼭 읽어야 할 도서 시리즈</div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="./Resources/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="./Resources/js/scripts.js"></script>
    </body>
</html>
