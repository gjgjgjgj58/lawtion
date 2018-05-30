<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href= "http://localhost:9000/lawtion/css/lawtion.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page ="../header.jsp"/>
	<div class="review">
		<div class="review-title">
			<img src="http://localhost:9000/lawtion/images/reviewtitle.PNG" width="200" height="60" class="title">
		</div>
		<nav class="review-select">
			<div class="select">
				<ul>
					<li class="select2"><a href="admin_review_board_list.jsp">전체</a></li>
					<li class="select1"><a href="admin_review_board_list_action.jsp">역경매</a></li>
					<li class="select2"><a href="admin_review_board_list_lawtion.jsp">Lawtion후기</a></li>
				</ul>
			</div>
		</nav>
		
		<div class="review-allbest">
			<span>주간 BEST5</span>
			<table border=0 class="best">
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>1</td>
					<td>역경매 후기 게시판!!!!</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>2</td>
					<td>역경매 후기 게시판!!!!</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>3</td>
					<td>역경매 후기 게시판!!!!</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>4</td>
					<td>역경매 후기 게시판!!!!</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>5</td>
					<td>역경매 후기 게시판!!!!</td>
				</tr>
			</table>
		</div>
		<div class="reviewlist">
			<div class="write-btn">
				<a href ="http://localhost:9000/lawtion/review_board/review_write.jsp"><button type="button">글쓰기</button></a>
			</div>
			<table border=0 class="all">
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<th>No</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>1</td>
					<td>아이폰 업데이트 소송에서 승소했어요!!!</td>
					<td>정현아</td>
					<td>2018-03-07</td>
					<td>6319</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>2</td>
					<td>아이폰 업데이트 소송에서 승소했어요!!!</td>
					<td>정현아</td>
					<td>2018-03-07</td>
					<td>116516</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>3</td>
					<td>아이폰 업데이트 소송에서 승소했어요!!!</td>
					<td>정현아</td>
					<td>2018-03-07</td>
					<td>58456</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>4</td>
					<td>아이폰 업데이트 소송에서 승소했어요!!!</td>
					<td>정현아</td>
					<td>2018-03-07</td>
					<td>58456</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>5</td>
					<td>아이폰 업데이트 소송에서 승소했어요!!!</td>
					<td>정현아</td>
					<td>2018-03-07</td>
					<td>58456</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>6</td>
					<td>아이폰 업데이트 소송에서 승소했어요!!!</td>
					<td>정현아</td>
					<td>2018-03-07</td>
					<td>58456</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>7</td>
					<td>아이폰 업데이트 소송에서 승소했어요!!!</td>
					<td>정현아</td>
					<td>2018-03-07</td>
					<td>58456</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>8</td>
					<td>아이폰 업데이트 소송에서 승소했어요!!!</td>
					<td>정현아</td>
					<td>2018-03-07</td>
					<td>58456</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>9</td>
					<td>아이폰 업데이트 소송에서 승소했어요!!!</td>
					<td>정현아</td>
					<td>2018-03-07</td>
					<td>58456</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>10</td>
					<td>아이폰 업데이트 소송에서 승소했어요!!!</td>
					<td>정현아</td>
					<td>2018-03-07</td>
					<td>58456</td>
				</tr>
				<tr>
					<td colspan=5>
						<span><< 1 2 3 4 5 6 7 8 9 >></span>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page ="../footer.jsp"/>
	
</body>
</html>