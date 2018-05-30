<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lawtion.vo.*,lawtion.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  	<link rel="stylesheet" type="text/css" href="http://localhost:9000/lawtion/css/am-pagination.css">
  	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" > 
  	<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
  	<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  	<script src="http://localhost:9000/lawtion/js/jquery.smoothwheel.js"></script>
  	<script src="http://localhost:9000/lawtion/js/paging.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!-- 하부메뉴 -->
	<link rel="stylesheet" href="http://localhost:9000/lawtion/css/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="http://localhost:9000/lawtion/css/style.css"> <!-- Resource style -->
	<script src="http://localhost:9000/lawtion/js/modernizr.js"></script> <!-- Modernizr -->
	<script src="http://localhost:9000/lawtion/js/main.js"></script> <!-- Resource jQuery -->
<!-- 페이지 경로 -->
	<script src="/data/201012/IJ12921763539839/query.easing.1.3.js" type="text/javascript" language="JavaScript"></script>
	<script src="/data/201012/IJ12921763539839/jquery.jBreadCrumb.1.1.js" type="text/javascript" language="JavaScript"></script>
	
<title>변호사 소개</title>

<script>
		$(document).ready(function(){
			
	
			
			$(".law").click(function(){
				var no = $(this).attr("id");
				$(location).attr('href','http://localhost:9000/lawtion/introduce_lawer2.do?no='+no);
				
			});
		
			$(".search").keyup(function(){
				var searchTerm = $(".search").val();
				var listItem = $('.results tbody').children('tr');
				var searchSplit = searchTerm.replace(/ /g, "'):containsi('");
				
				$.extend($.expr[':'],{'containsi': function(elem, i, match, array){
					return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;	
				}
				});
				
				$(".results tbody tr").not(":containsi('" + searchSplit + "')").each(function(e){
					$(this).attr('visible','false');
				  });
				$(".results tbody tr:containsi('" + searchSplit + "')").each(function(e){
					$(this).attr('visible','true');
				  });
				var jobCount = $('.results tbody tr[visible="true"]').length;
				$('.counter').text(jobCount + ' item');
				
				if(jobCount == '0') {$('.no-result').show();}
				else {$('.no-result').hide();}
			});
			
			/* 페이징 처리 */
			var pager = jQuery('#ampaginationsm').pagination({
				
			    maxSize: 7,	    		// max page size
			    totals: '${dbCount}',	// total pages	
			    page: '${rpage}',		// initial page		
			    pageSize: 8,			// max number items per page
			
			    // custom labels		
			    lastText: '&raquo;&raquo;', 		
			    firstText: '&laquo;&laquo;',		
			    prevText: '&laquo;',		
			    nextText: '&raquo;',
					     
			    btnSize:'sm'	// 'sm'  or 'lg'		
			});
			
			jQuery('#ampaginationsm').on('am.pagination.change',function(e){
				  //jQuery('.showlabelsm').text('The selected page no: '+e.page);
		           $(location).attr('href', "http://localhost:9000/lawtion/introduce_list.do?rpage="+e.page);         
		    });
			
			$("#introduce").smoothWheel();
			
		});
</script>
</head>
<body>
	<jsp:include page="../header3.jsp"></jsp:include>
	<!-- 하부 메뉴 네비게이션 -->
		<nav class="cd-stretchy-nav">
				<a class="cd-nav-trigger" href="#0">
					<span aria-hidden="true"></span>
				</a>
			<ul>
				<li><a href="http://localhost:9000/lawtion/index.do" class="active"><span>Home</span></a></li>
				<li><a href="#0"><span>LawTalk</span></a></li>
				<li><a href="#0"><span>KakaoTalk</span></a></li>
				<li><a href="#0"><span>Schedule</span></a></li>
				<li><a href="#0"><span>Contact</span></a></li>
			</ul>

			<span aria-hidden="true" class="stretchy-nav-bg"></span>
		</nav>
		
	<div class="introduce" id="introduce">
		<section class="content_style">
			<div class="breadCrumbHolder module">
				<div class="review-title">
					<div class="title-sub">
						<img src="http://localhost:9000/lawtion/images/introducetitle.jpg" width="500" height="100" class="title">
					</div>	
				</div>
			</div>
			
			
			<!-- 검색 기능  -->
			
			
			<div class="form-group pull-right">
				<input type="text" class="search form-control" placeholder="원하는 태그를 입력하세요">
			
			</div>
			<!--<span class= "counter pull-right"></span>-->
			
			
			
			<table class="table table-hover table-bordered results" >
				<thead>
				<tr align=center>
					<th>번호</th>
					<th colspan="2">이름</th>			
					<th>소속</th>
					<th>전문 분야</th>
				</tr>
				<tr class="warning no-result" align="center">
					<td colspan="5"><i class="fa fa-warning"></i><br>검색 결과가 없습니다</td>
				</tr>	
				</thead>
				<tbody>
				<c:forEach items="${list}" var="vo">
				<tr align=center class="law" id="${vo.no}" >
				<th scope="row" class="number">${vo.rno}</th>
					<td class="profile">
						<img src="http://localhost:9000/lawtion/images/profile2.jpg" class="rounded-circle">
					</td>
					<td class="content">
						${vo.name }
					</td>
					<td class="group">
						<a href="http://www.shinkim.com">${vo.dname }</a>
					</td>
					<td>${vo.part }</td>			
				</tr>
				</c:forEach>
				<tr>
					<td colspan="5">
						<div id="ampaginationsm" style="text-align:center;"></div>
                 	 	<!--  <span> << 1 2 3 4 5 6 7 8 9 10 >> </span>-->	
                 	 </td>
				</tr>
				</tbody>
			</table>
			
		
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>