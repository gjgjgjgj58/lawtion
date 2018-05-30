<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="lawtion.vo.MemberVO, lawtion.dao.MemberDAO, java.util.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href= "http://localhost:9000/lawtion/css/lawtion.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9000/mycgv/css/am-pagination.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="http://localhost:9000/mycgv/js/paging.js"></script>
<script>
	$(document).ready(function(){
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: 10,	    		// max page size
		    totals: '${dbCount}',	// total pages	
		    page: '${rpage}',			// initial page		
		    pageSize: 2,			// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   //jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/lawtion/lawyer_search.do?rpage="+e.page);         
	    });
		
 	});
</script> 
</head>
<body>
	<div class= "lawyersearchContent">
		<form name="searchinput" action="lawyer_search.do" method="post">
		<table border=0 class="searchinput">
			<tr>
			<td><input type ="text" name = "lawyersearch" value="예) 홍길동" onfocus="if(this.value=='예) 홍길동'){this.value=''}" onblur="if(this.value==''){this.value='예) 홍길동'}"></td> 
			<td><button type="reset" name="searchbutton1"><img src ="http://localhost:9000/lawtion/images/close.png" width="30" height="30" ></button></td>
			<td><button type="button" name="searchbutton2"><img src ="http://localhost:9000/lawtion/images/search.png" width="30" height="30"></button></td>
			</tr>
		</table>
		</form>
		<div class="searchnotice">
			<span>찾으시려는 변호사의 이름 또는 로펌명을 입력해주세요.
   				<br>예) 변호사명 : 홍길동 / 로펌명 : 로우옥션
      			<br>단, 로펌명에서 변호사사무실까지 작성하실 필요는 없습니다.
			</span>
		</div>
		<div class="searchtext">
			<table border =0>
				<tr>
					<td>
					</td>
					<td>
					</td>
				</tr>
				<c:forEach items = "${lawyerlist}" var = "vo">
				<tr>
					<td rowspan=3>
					<img src="http://localhost:9000/lawtion/images/lawyer1.jpg">
					</td>
					<td>
						<span class="searchcontent1">${vo.name }변호사</span>
					</td>
				</tr>
				<tr>
					<td>
						<span class="searchcontent2" >${vo.dname} </span><br>
						<span class="lawyeraddress">${vo.address }</span>
					</td>
				</tr>
				<tr>
					<td>
						<span class="searchcontent2">${vo.part }</span>
					</td>
				</tr>
				</c:forEach>
			</table>
			<div id="ampaginationsm"></div>
			</div>
			
			
		</div>
	</div>
	
	
</body>
</html>