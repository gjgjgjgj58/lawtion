<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LAWTION</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/lawtion/css/lawtion.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
<body class="back" background="http://localhost:9000/lawtion/images/footer1.jpg">
	<jsp:include page ="header.jsp"/>
	<div class="content">
		<section class="section1">
	<div class="carousel">
		<div id="demo" class="carouserl slide" data-ride="carousel">
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
				<li data-target="#demo" data-slide-to="3"></li>
			</ul>
			
			<!-- The slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="http://localhost:9000/lawtion/images/carousel1.jpg" >
					
				</div>
				<div class="carousel-item">
					<img src="http://localhost:9000/lawtion/images/carousel2.jpg" >
				</div>
				<div class="carousel-item">
					<img src="http://localhost:9000/lawtion/images/carousel3.jpg" >
				</div>
				<div class="carousel-item">
					<img src="http://localhost:9000/lawtion/images/carousel4.png" >
				</div>
			</div>
			
			
			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span></a>
			
		</div>	
	</div>
	<!--  end of carousel -->
	
	</section>
	<section class="section2">
			<!-- 이달의 News와 공지사항  -->
			<div class="box_left">
				<div class="left1">	
					<h6>이달의 news</h6>
					<div class="news">
						<a href="#"><img src="http://localhost:9000/lawtion/images/more1.gif" class="more"></a>
						<!-- 이달의 News 첫번째  -->	
						<div class="gallery1">
						   <a target="_blank" href="http://localhost:9000/lawtion/images/index_news1.jpg">
						     <img src="http://localhost:9000/lawtion/images/index_news1.jpg" alt="img1">
						   <div class="img1_text">'징역 30년' 판례보니 대부분 살인범…박근혜는 과연? </div>
						   </a>
						</div>
						<div class="gallery2">
						<!-- 이달의 News 두번째  -->	
						   <a target="_blank" href="http://localhost:9000/lawtion/images/index_news2.jpg">
						     <img src="http://localhost:9000/lawtion/images/index_news2.jpg" alt="img2">
						   <div class="img2_text">'징역 30년' 판례보니 대부분 살인범…박근혜는 과연? </div>
						   </a>
						</div>
						<!-- gallery2 end -->
						<div class="gallery3">
						<!-- 이달의 News 세번째  -->	
						   <a target="_blank" href="http://localhost:9000/lawtion/images/index_news2.jpg">
						     <img src="http://localhost:9000/lawtion/images/index_news2.jpg" alt="img2">
						   <div class="img3_text">'징역 30년' 판례보니 대부분 살인범…박근혜는 과연? </div>
						   </a>
						</div>
						<!-- gallery3 end -->	
					</div>
					<!-- news end -->
					
					<!-- 이달의 NewsList -->	
					<div class="index_newslist">
						<ul>
							<li><a href="http://www.xportsnews.com/jenter/?ac=article_view&entry_id=950246&_REFERER=http%3A%2F%2Fsearch.naver.com%2Fsearch.naver%3Fwhere%3Dnexearch%26sm%3Dtop_hty%26fbm%3D1%26ie%3Dutf8%26query%3D%25EC%258A%25B9%25EC%2586%258C%26url%3Dhttp%253A%252F%252Fwww.xportsnews.com%252F%253Fac%253Darticle_view%2526entry_id%253D950246%26ucs%3DKkjRLMHeRThc" target="_blank"><label>[공식입장] 한음저협, 문체부 상대 과징금부과처분 취소 승소</label></a></li>
							<li><a href="http://news1.kr/articles/?3252385" target="_blank"><label>당진시, 대호지면 돈사 신축 불허가 상고심도 승소 </label></a></li>
							<li><a href="http://www.enewstoday.co.kr/news/articleView.html?idxno=1164539" target="_blank"><label>한국지엠 노조 "이익 챙기기 혈안된 GM…'먹튀방지법' 제정해야" </label></a></li>
						</ul>
					</div>
					<!-- 이달의 NewsList end-->
				</div>	
				<!-- 이달의 News 틀 end -->			
			
				<!-- 공지사항 -->	
				<div class="left2"><h6>공지사항</h6>
					<a href="#"><img src="http://localhost:9000/lawtion/images/more1.gif" class="more"></a>
					<ul>
						<li><a href="#"><label>[공식입장] 한음저협, 문체부 상대 과징금부과처분 취소 승소</label></a></li>
						<li><a href="#"><label>당진시, 대호지면 돈사 신축 불허가 상고심도 승소 </label></a></li>
						<li><a href="#"><label>한국지엠 노조 "이익 챙기기 혈안된 GM…'먹튀방지법' 제정해야"</label></a></li>
						<li><a href="#"><label>한국지엠 노조 "이익 챙기기 혈안된 GM…'먹튀방지법' 제정해야"</label></a></li>
					</ul>
				</div>
				<!-- 공지사항 end -->	
			</div>
			<!-- box-left end -->
			
			<!-- 최신변호사와 역경매 등 게시판  -->
			<div class="box_right">
				<div class =right1>
					<div class="right1-1"><h6>이달의 변호사</h6>
						<a href="#"><img src="http://localhost:9000/lawtion/images/more1.gif" class="more"></a>
						<table border=0 class="lawyertable">
							<tr>
								<td onClick="location.href='#'" style="cursor:pointer;"><img src="http://localhost:9000/lawtion/images/lawyer1.jpg" alt="lawyer_img1"><label>이혼<br>강현정 변호사</label></td>
								<td onClick="location.href='#'" style="cursor:pointer;"><img src="http://localhost:9000/lawtion/images/lawyer2.jpg" alt="lawyer_img2"><label>금융<br>문희춘 변호사</label></td>
							</tr>
							<tr>
							</tr>
						</table>
				</div>
				
				<!-- right1-1 end -->
										
					<div class="right1-2"><h6>게시판</h6>
						<a href="#"><img src="http://localhost:9000/lawtion/images/more1.gif" class="more"></a>
						<table border=0 class="index_review">
							<tr>
								<th>Best</th>
								<th>제목 </th>
							</tr>
							<tr onClick="location.href='#'" style="cursor:pointer;">
								<td>1</td>
								<td>자녀 교통사고 건</td>
							</tr>
							<tr onClick="location.href='#'" style="cursor:pointer;">
								<td>2</td>
								<td>이혼 양육권분쟁</td>
							</tr>
							<tr onClick="location.href='#'" style="cursor:pointer;">
								<td>3</td>
								<td>저작권료 받고싶어요</td>
							</tr>
							<tr onClick="location.href='#'" style="cursor:pointer;">
								<td>4</td>
								<td>사기죄로 고소하고싶어요</td>
							</tr>
							<tr>
								<td>5</td>
								<td>보험사기단!!</td>
							</tr>
						</table>
					</div>
					<!-- right1-2 end -->	
				</div>
				<!-- right1 end -->	
				
				<!-- 역경매 -->	
				<div class="right2"><h6>역경매</h6>
					<a href="#"><img src="http://localhost:9000/lawtion/images/more1.gif" class="more"></a>
					<table border=0 class="index_lawtion">
						<tr onClick="location.href='#'" style="cursor:pointer;">
							<th>마감일</th>
							<th>제목 </th>
						</tr>
						<tr onClick="location.href='#'" style="cursor:pointer;">
							<td>[D-20]</td>
							<td>자녀 교통사고 건</td>
						</tr>
						<tr onClick="location.href='#'" style="cursor:pointer;">
							<td>[D-5]</td>
							<td>이혼 양육권분쟁</td>
						</tr>
						<tr onClick="location.href='#'" style="cursor:pointer;">
							<td>[D-3]</td>
							<td>저작권료 받고싶어요</td>
						</tr>
						<tr onClick="location.href='#'" style="cursor:pointer;">
							<td>[D-16]</td>
							<td>사기죄로 고소하고싶어요</td>
						</tr>
						<tr onClick="location.href='#'" style="cursor:pointer;">
							<td>[D-1]</td>
							<td>교통사고 손해배상</td>
						</tr>
					</table>
				</div>
				<!-- 역경매 end -->	
			</div>
			<!-- right2 end -->
		</section>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>