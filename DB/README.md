# DB_name:WEB 
###### 도서관리DB
## table:booklist
###### 도서관리 라이브러리의 테이블
|이름|데이터|주석|
|-----|----|----|
|book_number|INT|책의 순서|
|title|VARCHAR|제목|
|writer|"|작가|
|publisher|"|출판사|
|year|"|출간일|
|loan|"|대출여부|
## table:reply
###### 덧글관리 테이블
|이름|데이터|주석|
|-----|----|----|
|con_num|INT|덧글 번호|
|reply_idx|INT|해당 게시글 번호|
|name|VARCHAR|닉네임|
|id|"|아이디|
|pw|"|비밀번호|
|content|"|내용|
|date|DATETIME|작성된 해당날짜|
## table:web_board
###### 게시글 정보
|이름|데이터|주석|
|-----|----|----|
|board_idx|INT|게시글 번호
|name|VARCHAR|유저 닉네임
|id|"|유저 ID
|pw|"|유저 pw
|title|"|제목
|content|"|내용
|date|DATETIME|글작성일
|hit|INT|조회수
## table:web_member
###### 회원 정보
|이름|데이터|주석|
|-----|----|----|
|user_number|INT|회원관리번호
|id|VARCHAR|아이디
|pw|"|비밀번호
|name|"|닉네임
|phone|INT|휴대폰 번호
