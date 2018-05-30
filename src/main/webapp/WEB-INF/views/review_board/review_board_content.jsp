<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" 
    import="lawtion.vo.ReviewBoardVO,lawtion.dao.ReviewBoardDAO, java.util.*"%>
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
<script src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
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
			
			
		});//댓글작성 버튼
		$("#btnReWrite").click(function(){
			var check_value = $("#reply-write-check").val();
			
			if(check_value == "hide"){
				$(".reply-write").css("display","block");
				$("#reply-write-check").val("show");
			}else{
				$(".reply-write").css("display","none");
				$("#reply-write-check").val("hide");
				$(".reply-write-content").text("");
				$(".reply-write-name").text("");
			}			
		});
		
		
		//댓글 등록버튼
		$(".reply-write-button").click(function(){
			
			/* 댓글 등록 시작 */
			var replyer = $(".reply-write-name").text();
			var content = $(".reply-write-content").text();
			var no = "${vo.no}";
			//alert(no);
			//alert(content);

			$.ajax({
				url : 'http://localhost:9000/lawtion/review_reply_write_check.do',
				type :'GET',
				data : 'replyer='+replyer+'&content='+content+'&no='+no,
				dataType : 'json',
				contentType : 'application/x-www-form-urlencoded;charset=utf-8',
				success : function(data){				
		
					if(data.length != 0){	
						//alert("댓글 등록 완료");	
						$(".reply-write").css("display","none");
						$("#reply-write-check").val("hide");
					}					
				}
			});	//end of ajax			
	 	});	

		
		//댓글보기			
		$(".reply-view").click(function(){	
			var no = "${vo.no}";
			$.ajax({
				url : 'http://localhost:9000/lawtion/review_reply_list.do',
				method :'GET',	
				data : 'no='+no,
				dataType : 'json',
				success : function(data){
					for(i=0;i<data.length;i++){
									code = 	"<div class='view1'>"+data[i].content+"</div>"
									+"<div class='view2'>"+ data[i].rdate+"</div>"
									+"<div class='view3'>"+ data[i].replyer+"</div>"
									+"<div class='view4'><button id='"+data[i].rid+"'>"+"[삭제]"+"</button></div>"
									+ "<input type='hidden' id='"+data[i].rid+"' value='"+data[i].rid+"'>";
						$(".reply-content").append(code);
					}

				}
			});
		});		

		//댓글 삭제 팝업
		$(".reply-content").on("click",".view4 button",function(){
			//var id = $('.reply-content input[type=hidden]').attr('id');
			var rid = $(this).attr("id");			
			var no = "${vo.no}";
			
					if(confirm(rid+"번 댓글을 삭제하시겠습니까?")!=0){
						 $.ajax({
			                    
			                    url : 'http://localhost:9000/lawtion/review_reply_delete.do?',
			                    method :'GET',	   
			                    dataType : 'json',
			                    data : 'rid='+rid+'&no='+no,
			                    success : function(){
			                        alert("삭제했습니다.");
			                        init();
			                    },
			                    error : function(error){
			                        console.log(error);
			                    }
			                    
			                });
						
					}else{
						alert("삭제가 취소되었습니다.");
						return false;
					}
		});
	});
		
		//댓글보기 토글기능
		/*$(".reply-view").click(function(){
			
			var check_value = $("#reply-content-check").val(); 
			
			if(check_value == "hide"){				
				$(".reply-content").css("display","inline-block");			
				$("#reply-content-check").val("show");
			}else{
				$(".reply-content").css("display","none");
				$("#reply-content-check").val("hide");
			}
			
		});*/
		// Replace the <textarea id="editor1"> with a CKEditor

		// instance, using default configuration.

		CKEDITOR.replace( 'contents', {

		filebrowserUploadUrl: '${pageContext.request.contextPath}/file/ckeditorImageUpload.do'	

		});

</script>
<style>
	.reply-title { 
		text-align:center;
		cursor:pointer;
	}
	.reply-write { 
		display:none;
		background-color:white;
	}
	
	.reply-write table{
		width:100%;
		margin:auto;
		height:100px;
		border-top: 1px solid #e6e6e6;
		border-bottom: 1px solid #e6e6e6;
	}
	
	.reply-write table tr td:nth-child(1){
		width:15%;
		padding-left:25px;
		background-color: rgb(245, 245, 245);
		
	}
	
	.reply-write table tr td:nth-child(3){
		width:15%;
		background-color: rgb(245, 245, 245);
		
	}
	
	.reply-write table tr td:nth-child(2){
		width:70%;
		background-color:white;
		
	}
	
	.reply-write-name{
		dispaly:inline-block;
		width:100px;
		height:30px;		
		float:left;	
		background-color:rgb(245, 245, 245);
		text-align:left;
		padding:3px;
		text-align:center;
		
	}
	.rewrite tr{
		margin-bottom:20px;
	}
	.reply-write-content{
		dispaly:inline-block;
		width:100%;
		height:100%;		
		float:left;	
		text-align:left;
		padding:3px;
	}
	.reply-write-button{
		dispaly:inline-block;
		width:100%;
		height:100px;
		line-height:100px;		
		float:right;
		padding:3px 0px 3px 0px;
		margin-right:1.3px;
	}
	
	div.reply-content{
	width:100%;
	height:auto;
	display:inline-block;
	}
	.view1{
		width:64%;
		height:100%;
		display:inline-block;
		padding:20px;
		margin:auto;
		border-bottom: 1px #e6e6e6 solid;
		background-color:rgb(245, 245, 245);	
	}
	.view2{
		width:14%;
		height:100%;
		display:inline-block;
		padding:20px;
		margin:auto;
		border-bottom: 1px #e6e6e6 solid;
		background-color:rgb(245, 245, 245);
	}
	.view3{
		width:10%;
		height:100%;
		display:inline-block;
		padding:20px;
		margin:auto;
		border-bottom: 1px #e6e6e6 solid;
		background-color:rgb(245, 245, 245);
	}
	.view4{
		width:12%;
		height:100%;
		margin:auto;
		padding-top:6px;
		padding-bottom:6px;
		display:inline-block;
		border-bottom: 1px #e6e6e6 solid;
		font-size:10pt;
		background-color:rgb(245, 245, 245);
		cursor:pointer;
		padding-right:10px;
	}
</style>
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
				<li><a href="http://localhost:9000/lawtion/review_board_content_next.do?no=${vo.no }&rno=${rno}"><img src="http://localhost:9000/lawtion/images/previous.png" width="25" height="20">이전글</a></li>
				<li><a href="http://localhost:9000/lawtion/review_board.do">목록</a></li>
				<li><a href="http://localhost:9000/lawtion/review_board_content_pre.do?no=${vo.no }&rno=${rno}">다음글<img src="http://localhost:9000/lawtion/images/next.png" width="25" height="20"></a></li>
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
						${vo.lawyer} 변호사
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<c:choose>
					<c:when test="${vo.content != 'empty'}">
						<td colspan="6">
							${vo.content}<br>
							<c:if test="${not empty vo.rfname}">								
							<img src="http://localhost:9000/lawtion/upload/${vo.rfname}"
							width="400" height="300">
						</c:if>		
						</td>			
					</c:when>
					</c:choose>
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
			
			
			<table border=0 class="replywrite">
				<tr>
					<td>
						<br><div class="reply-title" id="btnReWrite">댓글작성</div><hr>
						<div class="reply-write">
							<table border=0 class="rewrite">
							<tr>
								<td>
									<div contenteditable="true" class="reply-write-name" name="replyer" >작성자명
									</div>
								</td>
								<td>
									<div contenteditable="true" class="reply-write-content" name="content">
									<br>&nbsp;&nbsp;댓글을 입력해주세요~
									</div>
								</td>
								<td>
									<div class="reply-write-button">등록</div>
									<input type="hidden" id="reply-write-check" value="hide">
									<input type="hidden" name="no" value="${vo.no }">
								</td>
							</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<hr><span class="reply-view">댓글보기</span><hr>
					</td>
				</tr>
				<tr>
					<td>
						<div class="reply-content">
						</div>
					</td>
				<tr>
			</table>
		</div>
	</div>
	<jsp:include page ="../footer.jsp"/>
	
</body>
</html>