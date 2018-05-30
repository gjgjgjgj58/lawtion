<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" 
    import="lawtion.vo.ReviewBoardVO, lawtion.dao.ReviewBoardDAO, 
     lawtion.dao.SearchDAO,lawtion.vo.SearchVO,java.util.*"%>
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
<script src="resources/ckeditor/ckeditor.js"></script>
<script>	
	$(document).ready(function(){
		$("#writesucess").click(function(){
			if($("#title").val()==""){
				alert("제목을 입력해주세요.");
				$("#title").focus();
			}else if ($.trim($("#contents").val(CKEDITOR.instances['contents'].getData()))==""){
				alert("내용을 입력해주세요");
				$("#content").focus();
			}else if($("#lawsuit").val()==" 진행되었던 소송명을 정확히 입력해주세요."){
				alert("소송명을 입력해주세요");
				$("#lawsuit").focus();
				return false;
			}
			
			boardForm.submit();
			});
		
		CKEDITOR.replace( 'content', {//해당 이름으로 된 textarea에 에디터를 적용
            width:'790',
            height:'500px',
            filebrowserImageUploadUrl: '/upload/upload', //여기 경로로 파일을 전달하여 업로드 시킨다.
            uiColor: '#F5DEB3'
        });
         
         
        CKEDITOR.on('dialogDefinition', function( ev ){
            var dialogName = ev.data.name;
            var dialogDefinition = ev.data.definition;
          
            switch (dialogName) {
                case 'image': //Image Properties dialog
                    //dialogDefinition.removeContents('info');
                    dialogDefinition.removeContents('Link');
                    dialogDefinition.removeContents('advanced');
                    break;
            }
        });
        
        var editorConfig = { filebrowserUploadUrl : "/fileUpload.do" };
        
        var ck = null;
     
        window.onload = function(){
            ck = CKEDITOR.replace("content" , editorConfig);
        };
		
        
       
	});
</script>
<script type="text/javascript">
	var openWin;
	
	
	function insertPopup()
	{
	    // window.name = "부모창 이름"; 
	    window.name = "review_write.do";
	    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	    window.open("http://localhost:9000/lawtion/lawyer_search.do",
	            "insert", "width=400, height=750, resizable = no, scrollbars = no,status = no");    
	}
</script>
</head>
<body>
	<jsp:include page ="../header.jsp"/>
	<div class="review">
		<div class="review-title">
			<img src="http://localhost:9000/lawtion/images/talktitle.PNG" width="200" height="60" class="title">
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
		<div class="write-title">
			<img src ="http://localhost:9000/lawtion/images/write.png" width="40" height="40">
			<label>후기 작성</label>
		</div>
		<div class="write">
			<form name="writeForm" action="review_board_check.do" method="post"  enctype="multipart/form-data">
				<table  class="review-Write">
					<tr>
						<td>
							<label>글쓴이</label>
							<input type ="text"	name="name" value="hyeona" disabled>
						</td>
						<td>
							<label>카테고리</label>
							<select class="category" name ="category" id="category">
								<option value="선택">선택</option>
								<option value="역경매 후기">역경매 후기</option>
								<option value="Lawtion 후기">Lawtion 후기</option>
							</select>
						</td>
						<td>
						<c:choose>
							<c:when test = "${lawyer !=null}">
							<label>담당변호사</label>
		                    <input type="text" id="lawyersearch" class="lawyersearch" name ="lawyer" value="${lawyer}">
		                    <a href="javascript:insertPopup();">	
		                    	<img src="http://localhost:9000/lawtion/images/lawyerfind.jpg" width="28" height="27">
							</a>
		                    </c:when>
		                    <c:when test = "${lawyer == null}">
							<label>담당변호사</label>
		                    <input type="text" id="lawyersearch" class="lawyersearch" name ="lawyer">
		                    <a href="javascript:insertPopup();">	
		                    	<img src="http://localhost:9000/lawtion/images/lawyerfind.jpg" width="28" height="27">
							</a>
		                    </c:when>
		                </c:choose>
		                    
							
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<label>제목</label>
							<input type ="text" name="title" id="title" >
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<label>소송명</label>
							<input type ="text" value=" 진행되었던 소송명을 정확히 입력해주세요." name="lawsuit" id="lawsuit" >
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<label>내용</label>
							<textarea class="content" id="content" name="content">
							<c:forEach items="${list}" var ="vo">
							</c:forEach>
							</textarea>
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<label>첨부파일</label>
							<input type ="file" name="file" id="file">
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<div class="write_button">
								<button type="submit" id="writesucess" name="writesucess">저장</button>
								<button type="reset" name="reset">취소</button>
								<a href="http://localhost:9000/lawtion/review_board_content.do?no=${vo.no}&rno=${rno}"><button type="button">이전 페이지</button></a>
							</div>
						</td>
					</tr>
				</table>	
			</form>
		</div>
	</div>
	<jsp:include page ="../footer.jsp"/>
	
</body>
</html>