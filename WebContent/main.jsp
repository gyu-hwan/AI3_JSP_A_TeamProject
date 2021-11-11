<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="memberinfo.jsp">내정보</a></li>
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
                        <a href="#!"><img class="card-img-top" src="https://dummyimage.com/850x350/dee2e6/6c757d.jpg" alt="..." /></a>
                        <div class="card-body">
                            <div class="small text-muted">2021.10.06 출간</div>
                            <h2 class="card-title">트렌드 코리아 2022</h2>
                            <p class="card-text">“우리를 죽이지 못하는 것들은 우리를 더 강하게 만든다.”
니체의 말이다. 거의 2년이 넘는 팬데믹 속에서도 우리는 삶을 이어왔고 고통과 절망 속에서도 미래에 대한 희망의 끈을 놓지 않았다. 획기적이고 거침없는 기술의 발전은 오히려 우리가 꿈꾸던 세상을 더욱 앞당기고 있다. 미증유의 전염병과 현명하게 공생하는 ‘위드 코로나’를 준비하면서 이제 우리는 더 강해지고 있다</p>
                            <a class="btn btn-primary" href="#!">Read more →</a>
                        </div>
                    </div>
                    <!-- Nested row for non-featured blog posts-->
                    <div class="row">
                        <div class="col-lg-6">
                            <!-- Blog post-->
                            <div class="card mb-4">
                                <a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
                                <div class="card-body">
                                    <div class="small text-muted">2021.10.29 출간</div>
                                    <h2 class="card-title h4">거꾸로 읽는 세계사</h2>
                                    <p class="card-text">한 시대를 풍미했던 베스트셀러의 귀환
100만 독자를 사로잡은 ‘이야기의 힘’
1988년 초판 출간 이후 스테디셀러로 굳건히 자리를 지켰던 유시민의 『거꾸로 읽는 세계사』가 절판 이후 새 얼굴로 출간됐다. ‘전면개정’이라는 수식이 무색할 정도로 30년 넘게 축적된 정보를 꼼꼼하게 보완하고...</p>
                                    <a class="btn btn-primary" href="#!">Read more →</a>
                                </div>
                            </div>
                            <!-- Blog post-->
                            <div class="card mb-4">
                                <a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
                                <div class="card-body">
                                    <div class="small text-muted">2021.11.01 출간</div>
                                    <h2 class="card-title h4">주식투자 절대원칙</h2>
                                    <p class="card-text">존 리, 김동환, 이채원 강력 추천! “4,500만 원으로 2,000억 부를 이룬 투자 비결” 자본금 4,500만 원으로 2,000억 원, 약 4,500배 수익률을 거둔 대한민국 최고 주식부자의 투자 비결을 담은 책이 출간됐다. 놀라운 점은 이러한 수익률이 IT 버블, 서브 프라임, 코로나 폭락장과 코스피 2,000에 갇혀 있던...</p>
                                    <a class="btn btn-primary" href="#!">Read more →</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <!-- Blog post-->
                            <div class="card mb-4">
                                <a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
                                <div class="card-body">
                                    <div class="small text-muted">2021.10.05 출간</div>
                                    <h2 class="card-title h4">그냥 하지 말라</h2>
                                    <p class="card-text">생각이 자본이 되는 시대, 당신은 무엇을 보여줄 것인가? 대한민국 최고의 데이터 분석가 송길영이 바라본 10년의 변화상, 10년의 미래상
우리는 흔히 ‘미래를 알 수 없다’고 생각하지만, 그렇지 않다. 과거와 지금을 보고, 그 안에 담긴 사람들의 욕망을 이해할 수 있으면 미래의 변화를 상당 부분 알 수 있다.</p>
                                    <a class="btn btn-primary" href="#!">Read more →</a>
                                </div>
                            </div>
                            <!-- Blog post-->
                            <div class="card mb-4">
                                <a href="#!"><img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
                                <div class="card-body">
                                    <div class="small text-muted">2021.07.27 출간</div>
                                    <h2 class="card-title h4">달러구트 꿈 백화점 2</h2>
                                    <p class="card-text">100만 독자를 사로잡은 《달러구트 꿈 백화점》, 그 두 번째 이야기 어느덧 페니가 달러구트 꿈 백화점에서 일한 지도 1년이 넘었다.
재고가 부족한 꿈을 관리하고, 꿈값 창고에서 감정으로 가득 찬 병을 옮기고, 프런트의 수많은 눈꺼풀 저울을 관리하는 일에 능숙해진 페니는 자신감이 넘친다</p>
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
