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
			<img src="http://localhost:9000/lawtion/images/talktitle.PNG" width="240" height="60" class="title">
		</div>
		<div class="talknotice">
			<label class="talktitle">
				�� �Խ����� ����� �Խ��ǵ� �ı� �Խ��ǵ� �ƴմϴ�.<br>�ֺ��� �ϼҿ����� ���ϴ� ���, ����� ���� �ֺ������ ����, ����, ��� �޴� �����Դϴ�. <br>�������� �����ٴ� ������ ���� ������ּ���			
			</label>
		</div>
		<div class="review-content">
			<ul>
				<li><a href="#"><img src="http://localhost:9000/lawtion/images/previous.png" width="25" height="20">������</a></li>
				<li><a href="#">������<img src="http://localhost:9000/lawtion/images/next.png" width="25" height="20"></a></li>
			</ul>
			<table border=0 class="content">
				<tr>
					<td colspan=7>
						������ ����ּ���
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
					</td>
					<td>
					</td>
					<td>
						������
					</td>
					<td>
						2018-03-12
					</td>
					<td>
						��ȸ�� 31582
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
					<td>��������</td>
					<td>������</td>
					<td>2018-03-12</td>
					<td><button type ="button">����</button></td>
				</tr>
				<tr>
					<td>ȭ��Ƽ�������̤ӤӤӤ��̤������̤���</td>
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