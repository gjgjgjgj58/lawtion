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
<script src="../write_resource/ckeditor.js"></script>
<link rel="stylesheet" href="write_resource/samples/sample.css">
<script>
	CKEDITOR.config.width=790;
	CKEDITOR.config.height=500;
	CKEDITOR.replace('editor1',{
		filebrowserImageUploadUrl:"ckeditor/plugins/imgupload.php"
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
					<li class="select1"><a href="admin_review_board_list.jsp">��ü</a></li>
					<li class="select2"><a href="admin_review_board_list_action.jsp">�����</a></li>
					<li class="select2"><a href="admin_review_board_list_lawtion.jsp">Lawtion�ı�</a></li>
				</ul>
			</div>
		</nav>
		<div class="review-content">
			<ul>
				<li><a href="#"><img src="http://localhost:9000/lawtion/images/previous.png" width="25" height="20">������</a></li>
				<li><a href="#">������<img src="http://localhost:9000/lawtion/images/next.png" width="25" height="20"></a></li>
			</ul>
			<table border=0 class="content">
				<tr>
					<td colspan=7>
						��ȥ�Ҽ� �ı��Դϴ�! xx����
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
					</td>
					<td>
						������ı�
					</td>
					<td>
						������
					</td>
					<td>
						2018-03-12
					</td>
					<td>
						31582
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td colspan=5>
							�ȳ��ϼ���<br>
							�ȳ��ϼ���<br>
							�ȳ��ϼ���<br>
							�ȳ��ϼ���<br>
							�ȳ��ϼ���<br>
							�ȳ��ϼ���<br>
							�ȳ��ϼ���<br>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td colspan=5><button type="button" name="admin_delete">�� �����ϱ�</button></td>
				</tr>
			</table>
			<table border=0 class="replywrite">
				<tr>
					<td>�����ƴ�</td>
					<td><textarea class="reply" name="relply" style="resize:none;"></textarea>
					<td><button type="button">���</button></td>
				</tr>
			</table>
			<table border=0 class="replylist">
				<tr>
					<td>��� ���� �Դϴ�Ƥ��Ƥ��ƾƾƾƤ��ƾƾ�</td>
					<td>������</td>
					<td>2018-03-12</td>
					<td><button type ="button">����</button></td>
				</tr>
				<tr>
					<td>��� ���� �Դϴ�Ƥ��Ƥ��ƾƾƾƤ��ƾƾ�</td>
					<td>������</td>
					<td>2018-03-12</td>
					<td><button type ="button">����</button></td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page ="../footer.jsp"/>
	
</body>
</html>