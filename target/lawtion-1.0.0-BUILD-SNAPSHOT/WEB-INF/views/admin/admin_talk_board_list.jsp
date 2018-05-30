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
			<img src="http://localhost:9000/lawtion/images/talktitle.PNG" width="240" height="60" class="title">
		</div>
		<div class="talknotice">
			<label class="talktitle">
				본 게시판은 역경매 게시판도 후기 게시판도 아닙니다.<br>주변에 하소연하지 못하는 사건, 답답한 일을 주변사람과 공유, 위로, 충고 받는 공간입니다. <br>공격적인 말보다는 따뜻한 말을 사용해주세요			
			</label>
		</div>
		<div class="review-allbest">
			<span>주간 BEST5</span>
			<table border=0 class="best">
				<tr onClick="location.href='admin_talk_board_content.jsp'" style="cursor:pointer;">
					<td>1</td>
					<td>하소연게시판</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>2</td>
					<td>하소연게시판</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>3</td>
					<td>하소연게시판</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>4</td>
					<td>하소연게시판</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>5</td>
					<td>하소연게시판</td>
				</tr>
			</table>
		</div>
		<div class="reviewlist">
			<div class="write-btn">
				<a href ="http://localhost:9000/lawtion/talk_board/talk_write.jsp"><button type="button">글쓰기</button></a>
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