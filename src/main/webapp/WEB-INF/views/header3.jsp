<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/lawtion/css/lawtion.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>header</title>
</head>
<body>
	<header>
		<div class="header3">
			<nav class="header-nav1">
				<ul>
					<li><a href="http://localhost:9000/lawtion/index.do">홈으로</a></li>
					<li><a href="http://localhost:9000/lawtion/login.do">로그인</a></li>
					<li><a href="http://localhost:9000/lawtion/join_select.do">회원가입</a></li>
				</ul>
			</nav>
			
		</div>
			<div class="logo">
			<a href="http://localhost:9000/lawtion/index.do">
				<img src ="http://localhost:9000/lawtion/images/logo2-1.jpg" class="logo" width="270px" height="80px">
			</a>
		</div>	
		<section class="menu"></section>
		
		<div class="header3">
			<nav class="header-nav2">
				<ul>
					<li><a href="http://localhost:9000/lawtion/notice.do"  onMouseOver="turnOn('header1');" onMouseOut="turnOff('header1');"><img src="http://localhost:9000/lawtion/images/menu11.jpg" width="100px" height="40px"></a></li>
					<li><a href="http://localhost:9000/lawtion/precedent_normal.do" onMouseOver="turnOn('header4');" onMouseOut="turnOff('header4');"><img src="http://localhost:9000/lawtion/images/menu4.jpg" width="62px" height="40px"></a></li>
					
					<li><a href="http://localhost:9000/lawtion/auction_board.do" onMouseOver="turnOn('header3');" onMouseOut="turnOff('header3');"><img src="http://localhost:9000/lawtion/images/menu3.jpg" width="76px" height="40px"></a></li>
				</ul>
				<ul>
					<li><a href="http://localhost:9000/lawtion/introduce_list.do" onMouseOver="turnOn('header2');" onMouseOut="turnOff('header2');"><img src="http://localhost:9000/lawtion/images/menu2.jpg" width="122px" height="40px"></a></li>
					<li><a href="http://localhost:9000/lawtion/review_board.do" onMouseOver="turnOn('menu5');" onMouseOut="turnOff('header5');"><img src="http://localhost:9000/lawtion/images/menu5.jpg" width="62px" height="40px"></a></li>
					<li><a href="http://localhost:9000/lawtion/talk_board.do" onMouseOver="turnOn('header6');" onMouseOut="turnOff('header6');"><img src="http://localhost:9000/lawtion/images/menu6.jpg" width="76px" height="40px"></a></li>
				</ul>
			</nav>
		</div>
	</header>
</body>
</html>