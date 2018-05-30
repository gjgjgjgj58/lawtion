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
					<li class="select2"><a href="admin_review_board_list.jsp">��ü</a></li>
					<li class="select1"><a href="admin_review_board_list_action.jsp">�����</a></li>
					<li class="select2"><a href="admin_review_board_list_lawtion.jsp">Lawtion�ı�</a></li>
				</ul>
			</div>
		</nav>
		
		<div class="review-allbest">
			<span>�ְ� BEST5</span>
			<table border=0 class="best">
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>1</td>
					<td>����� �ı� �Խ���!!!!</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>2</td>
					<td>����� �ı� �Խ���!!!!</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>3</td>
					<td>����� �ı� �Խ���!!!!</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>4</td>
					<td>����� �ı� �Խ���!!!!</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>5</td>
					<td>����� �ı� �Խ���!!!!</td>
				</tr>
			</table>
		</div>
		<div class="reviewlist">
			<div class="write-btn">
				<a href ="http://localhost:9000/lawtion/review_board/review_write.jsp"><button type="button">�۾���</button></a>
			</div>
			<table border=0 class="all">
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<th>No</th>
					<th>����</th>
					<th>�ۼ���</th>
					<th>�ۼ���</th>
					<th>��ȸ��</th>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>1</td>
					<td>������ ������Ʈ �Ҽۿ��� �¼��߾��!!!</td>
					<td>������</td>
					<td>2018-03-07</td>
					<td>6319</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>2</td>
					<td>������ ������Ʈ �Ҽۿ��� �¼��߾��!!!</td>
					<td>������</td>
					<td>2018-03-07</td>
					<td>116516</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>3</td>
					<td>������ ������Ʈ �Ҽۿ��� �¼��߾��!!!</td>
					<td>������</td>
					<td>2018-03-07</td>
					<td>58456</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>4</td>
					<td>������ ������Ʈ �Ҽۿ��� �¼��߾��!!!</td>
					<td>������</td>
					<td>2018-03-07</td>
					<td>58456</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>5</td>
					<td>������ ������Ʈ �Ҽۿ��� �¼��߾��!!!</td>
					<td>������</td>
					<td>2018-03-07</td>
					<td>58456</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>6</td>
					<td>������ ������Ʈ �Ҽۿ��� �¼��߾��!!!</td>
					<td>������</td>
					<td>2018-03-07</td>
					<td>58456</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>7</td>
					<td>������ ������Ʈ �Ҽۿ��� �¼��߾��!!!</td>
					<td>������</td>
					<td>2018-03-07</td>
					<td>58456</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>8</td>
					<td>������ ������Ʈ �Ҽۿ��� �¼��߾��!!!</td>
					<td>������</td>
					<td>2018-03-07</td>
					<td>58456</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>9</td>
					<td>������ ������Ʈ �Ҽۿ��� �¼��߾��!!!</td>
					<td>������</td>
					<td>2018-03-07</td>
					<td>58456</td>
				</tr>
				<tr onClick="location.href='#'" style="cursor:pointer;">
					<td>10</td>
					<td>������ ������Ʈ �Ҽۿ��� �¼��߾��!!!</td>
					<td>������</td>
					<td>2018-03-07</td>
					<td>58456</td>
				</tr>
				<tr>
					<td colspan=5>
						<span><< 1 2 3 4 5 6 7 8 9 >></span>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page ="../footer.jsp"/>
	
</body>
</html>