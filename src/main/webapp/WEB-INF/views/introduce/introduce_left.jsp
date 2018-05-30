<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lawtion.vo.*,lawtion.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  	<link rel="stylesheet" type="text/css" href="http://localhost:9000/mycgv/css/am-pagination.css">
  	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
  	<link rel="stylesheet" href="http://localhost:9000/lawtion/css/lawtion.css">
  	<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
  	<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="/data/201011/IJ12885672102633/featureList.js"></script>
<title>Insert title here</title>
		<script>
		$(document).ready(function(){


			//데이터 전송
			
			$(".law").click(function(){
				var no = $(this).attr("id");
				parent.ifram2.location.href="http://localhost:9000/lawtion/introduce_right.do?no="+no;
				

				
				
		
			});
			
			//검색 기능
			$(".search").keyup(function(){
				var searchTerm = $(".search").val();
				var listItem = $('.results2 tbody').children('tr');
				var searchSplit = searchTerm.replace(/ /g, "'):containsi('");
				
				$.extend($.expr[':'],{'containsi': function(elem, i, match, array){
					return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;	
				}
				});
				
				$(".results2 tbody tr").not(":containsi('" + searchSplit + "')").each(function(e){
					$(this).attr('visible','false');
				  });
				$(".results2 tbody tr:containsi('" + searchSplit + "')").each(function(e){
					$(this).attr('visible','true');
				  });
				var jobCount = $('.results2 tbody tr[visible="true"]').length;
				$('.counter').text(jobCount + ' item');
				
				 if(jobCount == '0') {$('.no-result').show();}
					else {$('.no-result').hide();}
						  });
			//end of search
			
			
			//페이징 처리
			var pager = jQuery('#ampaginationsm').pagination({
				
			    maxSize: 7,	    		// max page size
			    totals: '${dbCount}',	// total pages	
			    page: '${rpage}',		// initial page		
			    pageSize: 20,			// max number items per page
			
			    // custom labels		
			    lastText: '&raquo;&raquo;', 		
			    firstText: '&laquo;&laquo;',		
			    prevText: '&laquo;',		
			    nextText: '&raquo;',
					     
			    btnSize:'sm'	// 'sm'  or 'lg'		
			});
			
			jQuery('#ampaginationsm').on('am.pagination.change',function(e){
				  //jQuery('.showlabelsm').text('The selected page no: '+e.page);
		           $(location).attr('href', "http://localhost:9000/lawtions/introduce_left.do?page="+e.page);         
			
			});
			
			
				
				
			
			
		});
	</script>
	<style>
	body{
		background-color:white;
	}
	</style>
</head>
<body>
<div class="introduce">
	<section class="content_style2">			
		
		<div class="left-iframe">
			    <div class="form-group pull-right">
					<input type="text" class="search form-control" placeholder="원하는 태그를 입력하세요">	
				</div>
			
			<span class= "counter pull-right"></span>
			
			<table class="table table-hover table-bordered results2" align=center>
				<thead>
			 	<tr class="warning no-result" align="center">
					<td colspan="5"><i class="fa fa-warning"></i><br>검색 결과가 없습니다</td>
				</tr>	 
				</thead>
				
				
				<tbody >
				<c:forEach items="${list}" var="vo">
				
				 <tr class="law"  align=center id="${vo.no}">
					<td  scope="row" style="cursor:pointer;" class="profile">
						<img src="http://localhost:9000/lawtion/images/profile2.jpg" class="rounded-circle">
						<span class="content">${vo.name}</span><br>
						<span class="group">${vo.dname}</span><br>
						<span>#${vo.part }</span>			
					</td>
				</tr>
				
				</c:forEach>
				</tbody>
				
			
				
			</table>
			

			</div>
		</section>

	</div>
</body>
</html>
































