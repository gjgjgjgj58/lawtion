<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="http://localhost:9000/lawtion/css/lawtion.css">
<title>Insert title here</title>
</head>
	<jsp:include page ="../header1.jsp"/>
<body>
<p>
<div class="review-title">
	<div class="title-sub">
		<img src="http://localhost:9000/lawtion/images/jointitle.jpg" width="500" height="100" class="title">
	</div>	
</div>
	<div class="selectForm">
		<h1 class="h1-1">LAWTION�� ���� ����</h1>
		<h1 class="h1-2">ȯ���մϴ�.</h1>
			<form name="joinSelectForm" action="#" method="post" class="joinSelect">
				<ul>
					<div class="butt">
					<li>
					
						<a href="http://localhost:9000/lawtion/join_access2.do"><button type="button" class="button1">�Ϲ� ȸ��</button></a>
						<a href="http://localhost:9000/lawtion/join_access.do"><button type="button" class="button2">��ȣ��</button></a>
						<p><br>
					</li>
					</div>
				</ul>
			</form>
	</div>
</body>
	<jsp:include page ="../footer.jsp"/>
</html>