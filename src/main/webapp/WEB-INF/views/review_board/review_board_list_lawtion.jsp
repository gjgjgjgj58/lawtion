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
<link rel="stylesheet" type="text/css" href="http://localhost:9000/mycgv/css/am-pagination.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://localhost:9000/mycgv/js/paging.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: 7,	    		// max page size
		    totals: '${dbCount}',	// total pages	
		    page: '${rpage}',		// initial page		
		    pageSize: 10,			// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   //jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/lawtion/review_board_lawtion.do?rpage="+e.page);         
	    });
		
 	});
</script> 
</head>
<body>
	<jsp:include page ="../header.jsp"/>
	<div class="review">
		<div class="review-title">
			<div class="title-sub">
				<img src="http://localhost:9000/lawtion/images/reviewtitle1.jpg" width="500" height="100" class="title">
			</div>	
		</div>
		<nav class="review-select">
			<div class="select">
				<ul>
					<li class="select2"><a href="review_board.do">전체</a></li>
					<li class="select2"><a href="review_board_action.do">역경매</a></li>
					<li class="select1"><a href="review_board_lawtion.do">Lawtion후기</a></li>
				</ul>
			</div>
		</nav>
		
		<div class="review-allbest">
			<span>주간 BEST5</span>
			<table border=0 class="best">
				<c:forEach items = "${lawtionbestlist}" var = "vo">
				<tr>
					<td>${vo.rno }</td>
					<td><a href="http://localhost:9000/lawtion/review_board_content.do?no=${vo.no }&rno=${vo.rno }">${vo.title }</a></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div class="reviewlist">
			<div class="write-btn">
				<a href ="http://localhost:9000/lawtion/review_write.do"><button type="button">글쓰기</button></a>
			</div>
			<table border=0 class="all">
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<th>No</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:forEach items = "${lawtionlist}" var = "vo">
				<tr>
					<td>${vo.rno }</td>
					<td><a href="http://localhost:9000/lawtion/review_board_content.do?no=${vo.no }&rno=${vo.rno }">${vo.title }</a></td>
					<td>정현아</td>
					<td>${vo.rdate }</td>
					<td>${vo.hits }</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan=5>
						<div id="ampaginationsm"></div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page ="../footer.jsp"/>
	
</body>
</html>