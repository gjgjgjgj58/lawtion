<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href= "http://localhost:9000/lawtion/css/lawtion.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/ckeditor/ckeditor.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script>	
	$(document).ready(function(){
		$("#writesucess").click(function(){
			if($("#title").val()==""){
				alert("제목을 입력해주세요.");
				$("#title").focus();
			}else if($("input[type=file]").val() == ""){
				//alert("파일선택 안함!!")
				$("#code").val("exist");
			}else if(editor.getData() == ""){
				 alert("내용을 입력하세요");
				 return false;
				}
			
		});
		
		CKEDITOR.replace( 'content', {//해당 이름으로 된 textarea에 에디터를 적용
            width:'790',
            height:'500px',
            filebrowserImageUploadUrl: '/upload/upload', //여기 경로로 파일을 전달하여 업로드 시킨다.
            uiColor: '#D9E5FF'
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
		<div class="write-title">
			<img src ="http://localhost:9000/lawtion/images/write.png" width="40" height="40">
			<label>하소연 작성</label>
		</div>
		<div class="write">
			<form name="write" action="talk_board_check.do" method="post" enctype="multipart/form-data">
				<table  class="talk-Write">
					<tr>
						<td colspan=2>
							<label>글쓴이</label>
							<input type ="text"	value="hyeona" disabled>
						</td>
						<td></td>
					</tr>
					<tr>
						<td colspan=3>
							<label>제목</label>
							<input type ="text" name="title" id="title" >
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<label>내용</label>
							<textarea name="content" id="content"></textarea>
							
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<label>첨부파일</label>
							<input type ="file" name="file"  id="file">
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<div class="write_button">
								<button type="submit" id="writesucess" name="writesucess">저장</button>
								<button type="reset" name="reset">취소</button>
								<a href="http://localhost:9000/lawtion/talk_board_content.do?no=${vo.no}&rno=${rno}"><button type="button">이전 페이지</button></a>
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