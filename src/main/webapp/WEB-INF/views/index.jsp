<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" type="text/css" href="http://localhost:9000/lawtion/css/lawtion.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  	<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="http://localhost:9000/lawtion/css/index-reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="http://localhost:9000/lawtion/css/index-style.css"> <!-- Resource style -->
	<script src="http://localhost:9000/lawtion/js/modernizr.js"></script> <!-- Modernizr -->
	<script src="http://localhost:9000/lawtion/js/main.js"></script> <!-- Resource jQuery -->	
		
	<title>LAWTION</title>
<script type="text/javascript">

//필터효과지정하는곳 CSS (transition=0 to 23)번호에따라 효과가 틀림
document.write('<STYLE TYPE="text/css">.imgTrans{ filter: revealTrans (duration=0.4,transition=12) }</STYLE>');

//Uncomment the next line for fading rollovers instead of dissolving:
//document.write('<STYLE TYPE="text/css">.imgTrans{ filter:blendTrans(duration=0.4) }</STYLE>');

var onImages=new Array();
function Rollover(imgName, imgSrc)
{onImages[imgName] = new Image();
onImages[imgName].src = imgSrc;}

function turnOn(imgName){
if(document.images[imgName].filters != null)
document.images[imgName].filters[0].apply();
document.images[imgName].offSrc = document.images[imgName].src;
document.images[imgName].src    = onImages[imgName].src;
if(document.images[imgName].filters != null)
document.images[imgName].filters[0].play();
}

function turnOff(imgName){
if(document.images[imgName].filters != null)
document.images[imgName].filters[0].stop();
document.images[imgName].src = document.images[imgName].offSrc;}

//메뉴의 이름지정과 마우스 올라갔을 때 보여질 그림의 주소 적는 곳:
Rollover("menu1", "http://localhost:9000/lawtion/images/box1-1.jpg");
Rollover("menu2", "http://localhost:9000/lawtion/images/box2-2.jpg");
Rollover("menu3", "http://localhost:9000/lawtion/images/box3-3.jpg");
Rollover("menu4", "http://localhost:9000/lawtion/images/box4-4.jpg");
Rollover("menu5", "http://localhost:9000/lawtion/images/box5-5.jpg");
</script>
</head>
<body>
<body class="back" background="http://localhost:9000/lawtion/images/footer1.jpg">
   <jsp:include page ="header.jsp"/>

  <div class="content">
  <section class="section1">
  
    <a class="cd-nav-trigger cd-text-replace" href="#primary-nav"><span aria-hidden="true" class="cd-icon"></span></a>
      <div class="cd-projects-container">
  		<ul class="cd-projects-previews">
    		<li class ="bg-loaded">
    			
    			<a href="#0">
					<div class="cd-project-title">
						
						<h2>Project 1</h2>
						<p>Brief description of the project here</p>
						
					</div>
				</a>
    		</li>
    		<li	class ="bg-loaded">
				<a href="#0">
				
					<div class="cd-project-title">
						<h2>Project 2</h2>
						<p>Brief description of the project here</p>
					</div>
				</a>
			</li>
			
			<li class ="bg-loaded">
				<a href="#0">
				
					<div class="cd-project-title">
						<h2>Project 3</h2>
						<p>Brief description of the project here</p>
					</div>
				</a>
			</li>
			
			<li class ="bg-loaded">
				<a href="#0">
			
					<div class="cd-project-title">
						<h2>Project 4</h2>
						<p>Brief description of the project here</p>
					</div>
				</a>
			</li>
  		</ul>  <!-- .cd-projects-previews -->	
  		
  		<ul class="cd-projects">
  			<li>
  			<div class="preview-image">
    			<div class="cd-project-title">
      				<h2>Project 1</h2>
					<p>로션, '웹어워드 2018' 올해의 주목해야 할 커큐니티로 선정</p>
    			</div>
    		</div>
    			<div class="cd-project-info">
    				<p>변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.</p>
    			</div>
    		</li>
    		<li>
				<div class="preview-image">
					<div class="cd-project-title">
						<h2>Project 2</h2>
						<p>로션, '웹어워드 2018' 올해의 주목해야 할 커큐니티로 선정</p>
					</div> 
				</div>

				<div class="cd-project-info">
					<p>변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
					변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.</p>
				</div>
    		</li>
    		<li>
				<div class="preview-image">
					<div class="cd-project-title">
						<h2>Project 3</h2>
						<p>로션, '웹어워드 2018' 올해의 주목해야 할 커큐니티로 선정</p>
					</div> 
				</div>

				<div class="cd-project-info">
					<p>변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
					변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.</p>
				</div>
    		</li>
  			<li>
				<div class="preview-image">
					<div class="cd-project-title">
						<h2>Project 4</h2>
						<p>로션, '웹어워드 2018' 올해의 주목해야 할 커큐니티로 선정</p>
					</div> 
				</div>

				<div class="cd-project-info">
					<p>변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
					변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.
    				변호사 역경매 커뮤니티 로션은 3월 18일 열린 '2018 웹어워드'에서 올해의 주목해야 할 커뮤니티로 선정되었습니다.</p>
				</div>
    		</li>
  		</ul>
  		
  		
  		<button class="scroll cd-text-replace">Scroll</button>
	</div>   <!-- end of cd-projects-container -->
   </section>
   <!--  end of carousel -->
   <section class="section2">
   		<section class="section2-1">
		   	   	<div class="main-lawtalk">
		   	   		<a href="http://localhost:9000/lawtion/auction_board.do"><span></span></a>
		   	   		<table border=1 class="main1">
		   	   			<tr>
		   	   				<td></td>
		   	   				<td><a href="#">[D-19] 역경매 신청 현황 게시물1</a></td>
		   	   				<td>2018-04-24</td>
		   	   			</tr>
		   	   			<tr>
		   	   				<td></td>
		   	   				<td><a href="#">[D-18] 역경매 신청 현황 게시물2</a></td>
		   	   				<td>2018-04-23</td>
		   	   			</tr>
		   	   			<tr>
		   	   				<td></td>
		   	   				<td><a href="#">[D-17] 역경매 신청 현황 게시물3</a></td>
		   	   				<td>2018-04-22</td>
		   	   			</tr>
		   	   			<tr>
		   	   				<td></td>
		   	   				<td><a href="#">[D-16] 역경매 신청 현황 게시물4</a></td>
		   	   				<td>2018-04-21</td>
		   	   			</tr>
		   	   		</table>
	   			</div>
		   		<div class="main-reviewboard">
		   			<a href="http://localhost:9000/lawtion/review_board.do"><span></span></a>
		   			<table border=1 class="main2">
		   	   			<tr>
		   	   				<td></td>
		   	   				<td>역경매 후기입니다!</td>
		   	   				<td>2018-04-20</td>
		   	   			</tr>
		   	   			<tr>
		   	   				<td></td>
		   	   				<td>이혼소송 이겼어요</td>
		   	   				<td>2018-04-19</td>
		   	   			</tr>
		   	   			<tr>
		   	   				<td></td>
		   	   				<td>!!사기 고소 승소!!</td>
		   	   				<td>2018-04-18</td>
		   	   			</tr>
		   	   			<tr>
		   	   				<td></td>
		   	   				<td>경매 덕분에 소송 잘 끝났습니다~</td>
		   	   				<td>2018-04-18</td>
		   	   			</tr>
		   	   		</table>
		   		</div>
	   		</section>
	   	<section class="section2-2">
	   		<div class="mainbox1">
	   			<a href="http://localhost:9000/lawtion/notice.do" onMouseOver="turnOn('menu1');" onMouseOut="turnOff('menu1');">
	   				<img name="menu1" class="imgTrans" src="http://localhost:9000/lawtion/images/box1.jpg" border="0">	   			
	   			</a>
	   		</div>
	   		<div class="mainbox2">
	   			<a href="#" onMouseOver="turnOn('menu2');" onMouseOut="turnOff('menu2');">
	   				<img name="menu2" class="imgTrans" src="http://localhost:9000/lawtion/images/box2.jpg" border="0">	   			
	   			</a>
	   		</div>
	   		<div class="mainbox3">
	   			<a href="#" onMouseOver="turnOn('menu3');" onMouseOut="turnOff('menu3');">
	   				<img name="menu3" class="imgTrans" src="http://localhost:9000/lawtion/images/box3.jpg" border="0">	   			
	   			</a>
	   		</div>
	   		<div class="mainbox4">
				<a href="http://localhost:9000/lawtion/news.do" onMouseOver="turnOn('menu4');" onMouseOut="turnOff('menu4');">
	   				<img name="menu4" class="imgTrans" src="http://localhost:9000/lawtion/images/box4.jpg" border="0">	   			
	   			</a>
	   		</div>
	   		<div class="mainbox5">
	   			<a href="http://localhost:9000/lawtion/introduce_list.do" onMouseOver="turnOn('menu5');" onMouseOut="turnOff('menu5');">
	   				<img name="menu5" class="imgTrans" src="http://localhost:9000/lawtion/images/box5.jpg" border="0">	   			
	   			</a>
	   		</div>
	   	</section>
   </section>
   </div>
   <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>  	
   	
   	