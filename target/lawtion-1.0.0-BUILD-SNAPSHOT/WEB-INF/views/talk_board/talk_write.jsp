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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="write_resource/samples/sample.css">
<script>	
	$(document).ready(function(){
		$("#writesucess").click(function(){
			if($("#title").val()==""){
				alert("������ �Է����ּ���.");
				$("#title").focus();
			}else if ($.trim($("#contents").val(CKEDITOR.instances['contents'].getData()))==""){
				alert("������ �Է����ּ���");
				$("#content").focus();
			}else if($("#lawsuit").val()==" ����Ǿ��� �Ҽ۸��� ��Ȯ�� �Է����ּ���."){
				alert("�Ҽ۸��� �Է����ּ���");
				$("#lawsuit").focus();
				return false;
			}
			
			boardForm.submit();
			});
		
		$("#category").change(function(){
			//alert($("#selectemail").val());
			var option_value  = $("#select_id option:selected").val();
			if(option_val == "����"){
				alert("ī�װ��� �������ּ���.");
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
			<img src="http://localhost:9000/lawtion/images/talktitle.PNG" width="240" height="60" class="title">
		</div>
		<div class="talknotice">
			<label class="talktitle">
				�� �Խ����� ����� �Խ��ǵ� �ı� �Խ��ǵ� �ƴմϴ�.<br>�ֺ��� �ϼҿ����� ���ϴ� ���, ����� ���� �ֺ������ ����, ����, ��� �޴� �����Դϴ�. <br>�������� �����ٴ� ������ ���� ������ּ���			
			</label>
		</div>
		<div class="write-title">
			<img src ="http://localhost:9000/lawtion/images/write.png" width="40" height="40">
			<label>�ϼҿ� �ۼ�</label>
		</div>
		<div class="write">
			<form name="write" action="talk_board_check.do" method="post">
				<table  class="talk-Write">
					<tr>
						<td colspan=2>
							<label>�۾���</label>
							<input type ="text"	value="hyeona" disabled>
						</td>
						<td></td>
					</tr>
					<tr>
						<td colspan=3>
							<label>����</label>
							<input type ="text" name="title" id="title" >
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<label>����</label>
							<textarea class="content" id="content" cols="5" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<label>÷������</label>
							<input type ="file" name="fname" id="fname">
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<div class="write_button">
								<button type="submit" id="writesucess" name="writesucess">����</button>
								<button type="reset" name="reset">���</button>
								<a href="http://localhost:9000/lawtion/talk_board_content.do?no=${vo.no}&rno=${rno}"><button type="button">���� ������</button></a>
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