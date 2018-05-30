<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/lawtion/css/lawtion.css">
<script src="http://localhost:9000/mycgv/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<jsp:include page ="../header1.jsp"/>
	<div class="content">
		<section class="notice-style">
			<h1>공지사항 등록</h1>
			<form name="noticeForm" action="#" method="post" enctype="multipart/form-data" class="noticeForm">
				<ul>
					<li>
						<label>제목</label>
						<input type="text" name="title" id="title">
					</li>
					<li>
						<label>내용</label>
					</li>
					
				</ul>
			
			</form>
		</section>
	
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>