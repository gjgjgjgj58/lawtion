<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<% 
	int lawyer = 1; //변호사인지 아닌지 임시 세션
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://localhost:9000/lawtion/js/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	
	//토글기능
	/*var check_value = $("#reply-content-check").val();
	
	if(check_value == "hide"){				
		$(".reply-content").css("display","inline-block");		
		$("#reply-content-check").val("show");
	}else{
		$(".reply-content").css("display","none");
		$("#reply-content-check").val("hide");
	}*/
	
	var no = "${vo.no}";
	
	$.ajax({
		url : 'http://localhost:9000/lawtion/reply_list.do',
		method :'GET',	
		data : 'no='+no,
		dataType : 'json',
		success : function(data){
			$(".imgs, .b, .l, .comment, .date, .name, .bidding").remove();		
			for(i=0;i<data.length;i++){
				if(data[i].lawyer==1){
					code = 	"<img src='http://localhost:9000/lawtion/images/lawer.png' class='imgs'>"
						+ "<li class='l'><label class='name'><br class='b'>송명호 변호사님, <br class='b'></label><span class='bidding' id='bidding'>댓글 등록하셨습니다. </span></li>"
						+ "<li class='l'><span class='date'>"+data[i].rdate+"</span></li>"
						+ "<br class='b'><li class='l'><div class='comment'>"+data[i].content+"</div></li>";					
					$("#total").text(data[i].total);
					$("#total2").text(data[i].total2);
					$("#reply-content-check").val("show");
					$(".reply-content").append(code);
				}else if(data[i].lawyer==0){
					code = 	"<li class='l'><label class='name'><br class='b'>송명호님, <br class='b'></label><span class='bidding' id='bidding'>댓글 등록하셨습니다. </span></li>"
						+ "<li class='l'><span class='date'>"+data[i].rdate+"</span></li>"
						+ "<br class='b'><li class='l'><div class='comment'>"+data[i].content+"</div></li>";					
					$("#total").text(data[i].total);
					$("#total2").text(data[i].total2);
					$("#reply-content-check").val("show");
					$(".reply-content").append(code);
				}else{
					code = 	"<img src='http://localhost:9000/lawtion/images/lawer.png' class='imgs'>"
						+ "<li class='l'><strong><label class='name'><br class='b'>송명호 변호사님, <br class='b'></label><span class='bidding' id='bidding'>입찰 신청하셨습니다. </span></strong></li>"
						+ "<li class='l'><span class='date'>"+data[i].rdate+"</span></li>"
						+ "<br class='b'><li class='l'><div class='comment'>"+data[i].content+"</div></li>";					
					$("#total").text(data[i].total);
					$("#total2").text(data[i].total2);
					$("#reply-content-check").val("show");
					$(".reply-content").append(code);
				}
				
			}
			
			var check_blank = $("#reply-content-check").val();
			
			if(check_blank=="hide"){
				//alert("d");
				$(".reply-content").css("border","solid 1px rgb(235,235,235)");
				$(".reply-content").css("background-color","rgb(235,235,235)");
			}else{
				//alert("s");
				$(".reply-content").css("border","solid 1px #ccc");
				$(".reply-content").css("background-color","white");
			}
		}
	});
});

$(document).ready(function(){			
	
	$(".reply-view").css({"font-weight":"bold"});
	$(".bidding-view").css({"font-weight":"normal"});
	
	//댓글작성 버튼
	$("#btnReWrite").click(function(){
		var check_value = $("#reply-write-check").val();
		
		if(check_value == "hide"){
			$(".reply-write").css("display","block");
			$("#reply-write-check").val("show");
			$(".reply-title").css({"font-weight":"bold"});
		}else{
			$(".reply-write").css("display","none");
			$("#reply-write-check").val("hide");
			$(".reply-write-content").val("");
			$(".reply-title").css({"font-weight":"normal"});
		}			
	});
	
	
	//댓글 등록버튼
	$(".reply-write-button").click(function(){
		
		/* 댓글 등록 시작 */
		var content = $(".reply-write-content").val();
		var no = "${vo.no}";
		//alert(no);
		//alert(content);

		$.ajax({
			url : 'http://localhost:9000/lawtion/reply_write_check.do',
			type :'GET',
			data : 'content='+content+'&no='+no,
			dataType : 'json',
			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
			success : function(data){				
	
				if(data.length != 0){	
						
					$(".reply-write").css("display","none");
					$("#reply-write-check").val("hide");
					$(".reply-write-content").val("");
					
					reply_view_load();
				}	
				
			}
		});	//end of ajax			
	});	

	
	//댓글보기			
	$(".reply-view").click(function(){	
		
		//토글기능
		/*var check_value = $("#reply-content-check").val(); 
		
		if(check_value == "hide"){				
			$(".reply-content").css("display","inline-block");			
			$("#reply-content-check").val("show");
		}else{
			$(".reply-content").css("display","none");
			$("#reply-content-check").val("hide");
		}*/		
		
		$(".reply-view").css({"font-weight":"bold"});
		$(".bidding-view").css({"font-weight":"normal"});
		
		var no = "${vo.no}";
		
		$.ajax({
			url : 'http://localhost:9000/lawtion/reply_list.do',
			method :'GET',	
			data : 'no='+no,
			dataType : 'json',
			success : function(data){
				$(".imgs, .b, .l, .comment, .date, .name, .bidding").remove();				
				for(i=0;i<data.length;i++){
					if(data[i].lawyer==1){
						code = 	"<img src='http://localhost:9000/lawtion/images/lawer.png' class='imgs'>"
							+ "<li class='l'><label class='name'><br class='b'>송명호 변호사님, <br class='b'></label><span class='bidding' id='bidding'>댓글 등록하셨습니다. </span></li>"
							+ "<li class='l'><span class='date'>"+data[i].rdate+"</span></li>"
							+ "<br class='b'><li class='l'><div class='comment'>"+data[i].content+"</div></li>";					
						$("#total").text(data[i].total);
						$("#total2").text(data[i].total2);
						$("#reply-content-check").val("show");
						$(".reply-content").append(code);
					}else if(data[i].lawyer==0){
						code = 	"<li class='l'><label class='name'><br class='b'>송명호님, <br class='b'></label><span class='bidding' id='bidding'>댓글 등록하셨습니다. </span></li>"
							+ "<li class='l'><span class='date'>"+data[i].rdate+"</span></li>"
							+ "<br class='b'><li class='l'><div class='comment'>"+data[i].content+"</div></li>";					
						$("#total").text(data[i].total);
						$("#total2").text(data[i].total2);
						$("#reply-content-check").val("show");
						$(".reply-content").append(code);
					}else{
						code = 	"<img src='http://localhost:9000/lawtion/images/lawer.png' class='imgs'>"
							+ "<li class='l'><strong><label class='name'><br class='b'>송명호 변호사님, <br class='b'></label><span class='bidding' id='bidding'>입찰 신청하셨습니다. </span></strong></li>"
							+ "<li class='l'><span class='date'>"+data[i].rdate+"</span></li>"
							+ "<br class='b'><li class='l'><div class='comment'>"+data[i].content+"</div></li>";					
						$("#total").text(data[i].total);
						$("#total2").text(data[i].total2);
						$("#reply-content-check").val("show");
						$(".reply-content").append(code);
					}
				}
				
				var check_blank = $("#reply-content-check").val();
				
				if(check_blank=="hide"){
					//alert("d");
					$(".reply-content").css("border","solid 1px rgb(235,235,235)");
					$(".reply-content").css("background-color","rgb(235,235,235)");
				}else{
					//alert("s");
					$(".reply-content").css("border","solid 1px #ccc");
					$(".reply-content").css("background-color","white");
				}
			}
		});
	});		
	
	$(".bidding-view").click(function(){	
		
		//토글기능
		/*var check_value = $("#bidding-content-check").val();
		
		if(check_value == "hide"){				
			$(".reply-content").css("display","inline-block");			
			$("#bidding-content-check").val("show");
		}else{
			$(".reply-content").css("display","none");
			$("#bidding-content-check").val("hide");
		}*/				
		
		$(".bidding-view").css({"font-weight":"bold"});
		$(".reply-view").css({"font-weight":"normal"});
		
		var no = "${vo.no}";
		
		$.ajax({
			url : 'http://localhost:9000/lawtion/reply_list.do',
			method :'GET',	
			data : 'no='+no,
			dataType : 'json',
			success : function(data){
				$(".imgs, .b, .l, .comment, .date, .name, .bidding").remove();				
				for(i=0;i<data.length;i++){
					if(data[i].lawyer==2){
						code = 	"<img src='http://localhost:9000/lawtion/images/lawer.png' class='imgs'>"
							+ "<li class='l'><strong><label class='name'><br class='b'>송명호 변호사님, <br class='b'></label><span class='bidding' id='bidding'>입찰 신청하셨습니다. </span></strong></li>"
							+ "<li class='l'><span class='date'>"+data[i].rdate+"</span></li>"
							+ "<br class='b'><li class='l'><div class='comment'>"+data[i].content+"</div></li>";					
						$("#total").text(data[i].total);
						$("#total2").text(data[i].total2);
						$("#reply-content-check").val("show");
						$(".reply-content").append(code);
					}
				}
				
				if(data[0].total2 == "0명의 입찰자" || data[0].total2 == null){
					$("#reply-content-check").val("hide");
				}
				
				var check_blank = $("#reply-content-check").val();
				
				if(check_blank=="hide"){
					//alert("d");
					$(".reply-content").css("border","solid 1px rgb(235,235,235)");
					$(".reply-content").css("background-color","rgb(235,235,235)");
				}else{
					//alert("s");
					$(".reply-content").css("border","solid 1px #ccc");
					$(".reply-content").css("background-color","white");
				}
			}
		});
	});
});


//사용자 정의 함수
reply_view_load = function(){
	
		$(".reply-view").css({"font-weight":"bold"});
		$(".bidding-view").css({"font-weight":"normal"});
		
		$(".reply-content").css("display","inline-block");			
		//$("#reply-content-check").val("show");
		
		var no = "${vo.no}";
		
		$.ajax({
			url : 'http://localhost:9000/lawtion/reply_list.do',
			method :'GET',	
			data : 'no='+no,
			dataType : 'json',
			success : function(data){
				$(".imgs, .b, .l, .comment, .date, .name, .bidding").remove();				
				for(i=0;i<data.length;i++){
					if(data[i].lawyer==1){
						code = 	"<img src='http://localhost:9000/lawtion/images/lawer.png' class='imgs'>"
							+ "<li class='l'><label class='name'><br class='b'>송명호 변호사님, <br class='b'></label><span class='bidding' id='bidding'>댓글 등록하셨습니다. </span></li>"
							+ "<li class='l'><span class='date'>"+data[i].rdate+"</span></li>"
							+ "<br class='b'><li class='l'><div class='comment'>"+data[i].content+"</div></li>";					
						$("#total").text(data[i].total);
						$("#total2").text(data[i].total2);
						$("#reply-content-check").val("show");
						$(".reply-content").append(code);
					}else if(data[i].lawyer==0){
						code = 	"<li class='l'><label class='name'><br class='b'>송명호님, <br class='b'></label><span class='bidding' id='bidding'>댓글 등록하셨습니다. </span></li>"
							+ "<li class='l'><span class='date'>"+data[i].rdate+"</span></li>"
							+ "<br class='b'><li class='l'><div class='comment'>"+data[i].content+"</div></li>";					
						$("#total").text(data[i].total);
						$("#total2").text(data[i].total2);
						$("#reply-content-check").val("show");
						$(".reply-content").append(code);
					}else{
						code = 	"<img src='http://localhost:9000/lawtion/images/lawer.png' class='imgs'>"
							+ "<li class='l'><strong><label class='name'><br class='b'>송명호 변호사님, <br class='b'></label><span class='bidding' id='bidding'>입찰 신청하셨습니다. </span></strong></li>"
							+ "<li class='l'><span class='date'>"+data[i].rdate+"</span></li>"
							+ "<br class='b'><li class='l'><div class='comment'>"+data[i].content+"</div></li>";					
						$("#total").text(data[i].total);
						$("#total2").text(data[i].total2);
						$("#reply-content-check").val("show");
						$(".reply-content").append(code);
					}
					
				}
				
				var check_blank = $("#reply-content-check").val();
				
				if(check_blank=="hide"){
					//alert("d");
					$(".reply-content").css("border","solid 1px rgb(235,235,235)");
					$(".reply-content").css("background-color","rgb(235,235,235)");
				}else{
					//alert("s");
					$(".reply-content").css("border","solid 1px #ccc");
					$(".reply-content").css("background-color","white");
				}
			}
		});
	};
	
function showBiddingPopup(){
	window.open("auction_board_bidding.do?no=${vo.no}",
				"",
				"width=650px, height=800px, left=600, top=100"
				);
}

</script>
<style>

table.auction_table_content tr{
	border-top:1px solid black;
}

div.comment{
	border-bottom:1px dotted #ccc;
	padding-bottom:30px;
	width:635px;
}
span.date{
	color:white;
}

	.reply-header {text-align:right; user-select:none;}
	.reply-title, .reply-view, .bidding-view{ 			
		cursor:pointer;
	}

	.reply-write { display:none;}
	.reply-write-title{
		text-align:left;
		padding:0px 0px 10px 10px;
	}
	.reply-write-content{
		dispaly:inline-block;
		width:83%;
		height:100px;		
		float:left;	
		margin-left:10px;
		border:1px solid gray;	
		text-align:left;
		padding:3px;
	}
	.reply-write-button{
		dispaly:inline-block;
		width:13%;
		height:108px;
		/*line-height:100px;*/	
		float:right;
		/*background-color:lightGray;
		border:1px solid gray;*/	
		padding:3px 0px 3px 0px;
		
	}
	.reply-content{
		border:1px solid #ccc;
		border-collapse:collapse;
		padding:2px 0px 0px 10px;
		background-color:white;
		width:650px;
	}
</style>

</head>
<body>
	<jsp:include page="../header1.jsp" /><!-- ..은 폴더를 빠져나가는 것을 의미한다. "http://localhost:9000/lawtion/images/hehe.png"-->
	<div class="review-title">
		<div class="title-sub">
			<img src="http://localhost:9000/lawtion/images/actiontitle.jpg" width="500" height="100" class="title">
		</div>	
	</div>
	<div class="auction_content">
		<section class="auction_style">
			<br><br>
			<table class="auction_table_content">
				<tr>
					<th class="abc_title">[${vo.category}] ${vo.title}</th>
					<th class="abc_hits">마감일 : ${vo.edate}</th>
				</tr>
				<tr>
					<td>
						<li class="abc_name">정**</li>
						<li class="abc_date">${vo.adate}</li>
					</td>
					<td class="abc_edate">
						조회수 <strong>${vo.hits}</strong>
					</td>
				</tr>
				<tr>
					<td>지역 : ${vo.area}</td>
				</tr>
				<tr>
					<td colspan="2" class="abc_content">${vo.content}</td>
				</tr>
				<tr>
					<td colspan="2" class="abc_comment_count">
						<li><span id="total2">0명의 입찰자</span></li>
						<li><span id="total">댓글 0</span></li>
					</td>
				</tr>
			</table>
			<div class="auction_comment">
			<!-- <form name="commentInsertForm"> -->
			<input type="hidden" name="cno" value="${vo.no}"/>
			<table class="auction_table_content">
			<!-- 댓글 확인란 -->
				<!-- <tr>
					<td colspan="2" class="abc_comment_contents">
					
							<img src="http://localhost:9000/lawtion/images/lawer.png" class="imgs">
							<li><strong><label class="name">송명호 변호사님, </label><span class="bidding" id="bidding">입찰 신청하셨습니다. </span></strong></li>
							<li><span class="date">2018.02.07 02:20</span></li>
							<br>
							<li><span class="comment">다음 상황과 비슷한 사례의 의뢰를 승소한 경험이 있습니다. 연락주세요.</span></li>
							<% if(lawyer!=1){ %><li><div><a href="auction_win.do"><button>낙찰 페이지로</button></a><button>1:1 상담 신청</button></div></li><% } %>
						
					</td>
				</tr>
				<tr>
					<td colspan="2" class="abc_comment_contents">
					
							<img src="http://localhost:9000/lawtion/images/lawer.png" class="imgs">
							<li><strong><label class="name">로톡 변호사님, </label><span class="bidding" id="bidding">답변입니다. </span></strong></li>
							<li><span class="date">2018.02.03 01:30</span></li>
							<br>
							<li><span class="comment">저는 도움을 드릴 순 없지만 참 안타까운 사건입니다.</span></li>
						
					</td>
				</tr>
				<tr>
					<td colspan="2" class="abc_comment_contents">
					
							<li><strong><label class="name">전기기사 님, </label><span class="bidding" id="bidding">답변입니다. </span></strong></li>
							<li><span class="date">2018.02.02 05:54</span></li>
							<br>
							<li><span class="comment">어머어머 화이팅하세요ㅜㅜ 항상 좋은일가득하세요</span></li>
						
					</td>
				</tr>
				
				<tr>
					
					
					<td><textarea rows="5" cols="60" name="abc_comment_textarea"></textarea></td>
					<td><button name="commentInsertBtn">등록</button></td>
					
				</tr>
				 -->
				<!-- start of reply -->
				<tr>
					<td colspan="2">
				
						<br><div class="reply-header">
						<span class="reply-title" id="btnReWrite">댓글 작성</span> 
						| <span class="reply-view">전체보기</span> | <span class="bidding-view">입찰 보기</span>
						</div>			
						<div class="reply-write">
							<div class="reply-write-title">
									
							</div>
							<textarea rows="5" cols="60" class="reply-write-content" name="content"></textarea>
							<button class="reply-write-button">등록</button>
							<input type="hidden" id="reply-write-check" value="hide">
							<input type="hidden" name="no" value="${vo.no }">
						</div>												
					</td>
				</tr>
				<tr>
					<td colspan="2">			
						<div class="reply-content">
						<input type="hidden" id="reply-content-check" value="hide">
						<input type="hidden" id="bidding-content-check" value="hide">										
						</div>							
					</td>
				</tr>
				<!-- end of reply -->
				
			</table>
			<!-- </form> -->
			</div>
			
			<br><br>
			<% if(lawyer==1){ %>
			<a href="#" onclick="showBiddingPopup()"><button>입찰 신청하기</button></a>
			<a href="auction_board_write.do"><button>글쓰기</button></a>
			<a href="auction_board.do?rpage=${rpage }"><button>목록</button></a>
			<% }else{ %>
			<a href="auction_board_write.do"><button>글쓰기</button></a>
			<a href="auction_board.do?rpage=${rpage }"><button>목록</button></a>
			<% } %>
			
			<br><br><br><br>
			
		</section>
		
	</div>
	
	<jsp:include page="../footer.jsp" /><!-- ..은 폴더를 빠져나가는 것을 의미한다. -->
</body>
</html>