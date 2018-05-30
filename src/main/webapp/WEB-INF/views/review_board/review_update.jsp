<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  import="lawtion.vo.ReviewBoardVO, lawtion.dao.ReviewBoardDAO, java.util.*"%>
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
<link rel="stylesheet" href="write_resource/samples/sample.css">

<script>	
	$(document).ready(function(){
		$("#btnupdate").click(function(){
			if($("#title").val()==""){
				alert("������ �Է����ּ���.");
				$("title").focus();
				return false;
			}else if($("input[type=file]").val() == ""){
				//alert("���ϼ��� ����!!")
				$("#code").val("exist");
			}
			boardForm.submit();
			});
		
		CKEDITOR.replace( 'content', {//�ش� �̸����� �� textarea�� �����͸� ����
            width:'790',
            height:'500px',
            filebrowserImageUploadUrl: '/upload/upload', //���� ��η� ������ �����Ͽ� ���ε� ��Ų��.
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
<style>
	.updateFile { 
		background-color:rgb(253,252,240);
		display:inline-block;
		width:300px; height:23px;
		position:relative;
		top:-35px;
		left:230px;		
		font-size:11pt;
		font-family:�������;				
	}
</style>
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
					<li class="select1"><a href="review_board.do">��ü</a></li>
					<li class="select2"><a href="review_board_action.do">�����</a></li>
					<li class="select2"><a href="review_board_lawtion.do">Lawtion�ı�</a></li>
				</ul>
			</div>
		</nav>
		<div class="write-title">
			<img src ="http://localhost:9000/lawtion/images/write.png" width="40" height="40">
			<label>�ı� �ۼ�</label>
		</div>
		<div class="write">
			<form name="writeForm" action="review_update.do" method="post">
				<table  class="review-Write">
					<tr>
						<td>
							<label>�۾���</label>
							<input type ="text"	name="name" value="hyeona" disabled>
						</td>
						<td>
							<label>ī�װ�</label>
							<select class="category" name ="category" id="category">
								<option value="����">����</option>
								<option value="����� �ı�">����� �ı�</option>
								<option value="Lawtion �ı�">Lawtion �ı�</option>
							</select>
						</td>
						<td>
							<label>��纯ȣ��</label>
		                    <input type="text" id="lawyersearch1" class="lawyersearch1" name ="lawyer" value="${vo.lawyer}" disabled>
		                    	<img src="http://localhost:9000/lawtion/images/lawyerfind.jpg" width="28" height="27">
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<label>����</label>
							<input type ="text" name="title" id="title" value="${vo.title }">
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<label>�Ҽ۸�</label>
							<input type ="text" name="lawsuit" id="lawsuit" value="${vo.lawsuit }">
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<label>����</label>
							<textarea class="content" id="content" name="content">
							${vo.content}
							</textarea>
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<label>÷������</label>
							<input type ="file" name="fname" id="fname" value="${vo.fname }">
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<div class="write_button">
								<input type="hidden" name="no"  value="${vo.no }" >
								<input type="hidden" name="code" id="code">
								<button type="submit" id="btnupdate" name="btnupdate">�����Ϸ�</button>
								<button type="reset" name="reset">���</button>
								<a href="review_board_content.do?no=${vo.no }&rno=${rno}"><button type="button">���� ������</button></a>
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