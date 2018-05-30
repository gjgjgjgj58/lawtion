<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	select{height:24px;}
</style>
</head>
<body>
<jsp:include page="../header1.jsp" /><!-- ..은 폴더를 빠져나가는 것을 의미한다. "http://localhost:9000/lawtion/images/hehe.png"-->
<p><div class="review-title">
	<div class="title-sub">
		<img src="http://localhost:9000/lawtion/images/actiontitle.jpg" width="500" height="100" class="title">
	</div>	
</div>
	<div class="auction_content">
			<section class="auction_style">
				<br><br>
				<form name="boardForm" action="auction_board_check.do" method="post" class="auction_board_write">
				<table class="auction_table_write">
					<tr><th colspan="2"></th></tr>
					<tr>
						<td>카테고리</td>
						<td>
						<select name="category" id="category">
							<option value="ex1">민사</option>
							<option value="ex2">형사</option>
						</select>
						</td>
					</tr>
					<tr>
						<td>마감일시</td>
						<td><input type="date" class="abw_edate" name="edate" id="edate" value="${dl.tm}" min="${dl.tm}" max="${dl.maxtm}"><br>*마감일시는 최소 작성일로부터 24시간 기준입니다. 최대 3주까지 가능합니다.</td>
					</tr>
					<tr>
						<td>지역</td>
						<td>
						<select name="area" id="area">
							<option value="1">강원</option>
							<option value="2">경기</option>
						</select>
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" class="abw_name" name="name" id="name" disabled></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" class="abw_title" name="title" id="title"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
						<textarea rows="15" cols="60" name="content" placeholder="음란, 저작권 침해, 명예회손, 청소년 유해물, 기타 위법 자료, 허위사실 등을 게시하면 해당 게시물은 경고 없이 삭제되며, 게시자는 법률에 따라 징역형 또는 벌금형에 처해질 수 있습니다.
						
작성되는 글의 내용은 최대 1MB 까지 작성 가능합니다."></textarea></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td><input type="file" name="fname"></td>
					</tr>
					<tr>
						<td>공개설정</td>
						<td><input type="checkbox" name="agree" id="agree" class="agree-checkbox"><span>체크하시면 일반 회원들도 열람이 가능합니다.</span></td>
					</tr>
					
				
				
				<!-- <form name="boardform" action="#" method="post">
				<ul>
					<li>
						<label>제목</label>
						<input type="text" name="title">				
					</li>
					<li>
						<label>내용</label>
						<textarea rows="10" cols="50"></textarea>
					</li>
					<li>
						<label>첨부파일</label>
						<input type="file" name="fname">
					</li>
					<li>
						
						<button type="button">완료</button>
						<button type="reset">취소</button>
						<a href="http://localhost:9000/mycgv/board/board_content.jsp"><button type="button">이전 페이지</button></a>
						<a href="http://localhost:9000/mycgv/board/board_list.jsp"><button type="button">전체 리스트</button></a>
						
					</li>
				</ul>
				</form> -->
				
				
				
				<tr>
					<td colspan="2" class="abw_success">
						<button>완료</button>
						<a href="auction_board.do"><button type="button">목록</button></a>
					</td>
				</tr>
			</table>	
			</form>
			<br><br><br><br>
			</section>
		</div>
		
		<jsp:include page="../footer.jsp" /><!-- ..은 폴더를 빠져나가는 것을 의미한다. -->
	</body>
</html>