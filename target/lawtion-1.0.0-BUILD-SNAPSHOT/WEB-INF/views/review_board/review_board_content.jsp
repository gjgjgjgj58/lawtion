<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="lawtion.vo.ReviewBoardVO,lawtion.dao.ReviewBoardDAO, java.util.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
<script src="../write_resource/ckeditor.js"></script>
<link rel="stylesheet" href="write_resource/samples/sample.css">
<script>
	$(document).ready(function(){
		$("#btndelete").click(function(){
			if(confirm("삭제하시겠습니까?")!=0){
				$(location).attr('href','review_delete_check.do?no=${vo.no}&rno={rno}');
				
			}else{
				alert("삭제가 취소되었습니다.");
				return false;
			}
		});
	});
</script>
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
					<li class="select1"><a href="review_board.do">전체</a></li>
					<li class="select2"><a href="review_board_action.do">역경매</a></li>
					<li class="select2"><a href="review_board_lawtion.do">Lawtion후기</a></li>
				</ul>
			</div>
		</nav>
		<div class="review-content">
			<ul>
				<li><a href="#"><img src="http://localhost:9000/lawtion/images/previous.png" width="25" height="20">이전글</a></li>
				<li><a href="http://localhost:9000/lawtion/review_board.do">목록</a></li>
				<li><a href="#">다음글<img src="http://localhost:9000/lawtion/images/next.png" width="25" height="20"></a></li>
			</ul>
			<table border=0 class="content">
				<tr>
					<td colspan=8>
						${vo.title }
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
					</td>
					<td>
						${vo.category }
					</td>
					<td>
						정현아
					</td>
					<td>
						${vo.rdate }
					</td>
					<td>
						${vo.hits }
					</td>
					<td>
						담당변호사
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td colspan=6>
						${vo.content }
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td colspan=5>
					<input type="hidden" name="no" value="${vo.no }">
					<button type="button" name="btndelete" id="btndelete">글 삭제하기</button>
					<a href="http://localhost:9000/lawtion/review_update.do?no=${vo.no }&rno=${rno}">
					<button type="button" name="btnupdate">글 수정하기</button></a></td>
				</tr>
			</table>
			<table border=0 class="replylist">
				<tr>
					<td>댓글 내용 입니당아ㅏ아ㅏ아아아아ㅏ아아아</td>
					<td>정현아</td>
					<td>2018-03-12</td>
				</tr>
				<tr>
					<td>댓글 내용 입니당아ㅏ아ㅏ아아아아ㅏ아아아</td>
					<td>정현아</td>
					<td>2018-03-12</td>
				</tr>
			</table>
			<table border=0 class="replywrite">
				<tr>
					<td>정현아님</td>
					<td><textarea class="reply" name="relply" style="resize:none;"></textarea>
					<td><button type="button">등록</button></td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page ="../footer.jsp"/>
	
</body>
</html>