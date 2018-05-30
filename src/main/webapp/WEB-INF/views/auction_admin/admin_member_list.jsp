<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header1.jsp" /><!-- ..은 폴더를 빠져나가는 것을 의미한다. -->
	<div class="review-title">
		<div class="title-sub">
			<img src="http://localhost:9000/lawtion/images/actiontitle.jpg" width="500" height="100" class="title">
		</div>	
	</div>
	<div class="auction_content"><!-- class -->
			<!-- carouse1 -->
			<section class="auction_style"><!-- class -->
				
				
			
			<br><br>
			
			<table class="auction_table_list">
		<tr class="nth">
			<th>번호</td>
			<th>아이디</td>
			<th>성명</td>
			<th>폰번호</td>
			<th>가입날짜</td>
			<th>변호사 여부</td>
		</tr>
		
		<tr>
			<td>2</td>
			<td><a href="#">trashman</a></td>
			<td>이수근</td>
			<td>010-2204-3301</td>
			<td>2018-04-01</td>
			<td>x</td>
		</tr>
		
		<tr>
			<td>1</td>
			<td><a href="#">hotgirl</a></td>
			<td>박나래</td>
			<td>010-3398-0099</td>
			<td>2018-04-03</td>
			<td><a href="#">o</a></td>
		</tr>
		
	</table>
	
			<br><br><br><br>
			</section>
		</div>
		
    

		
		
				
			
		
		<jsp:include page="../footer.jsp" /><!-- ..은 폴더를 빠져나가는 것을 의미한다. -->
</body>
</html>