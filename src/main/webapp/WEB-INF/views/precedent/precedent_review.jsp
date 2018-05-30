<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="lawtion.vo.*, lawtion.dao.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/lawtion/css/lawtion.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9000/lawtion/css/am-pagination.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://localhost:9000/lawtion/js/paging.js"></script>
<script> 
$(document).ready(function(){
    $("#ban1").click(function(){
       $(this).css("display","none");
       $("#ban2").css("display","block").animate({width:'300px',height:'600px'})
       $("#ban3").animate({width:'20px',height:'20px'})
     })
    $("#ban3").click(function(){
            $(this).css('display','none');
            $("#ban2").css('display','none');
            $('#ban1').css('display','block');

    })

	$("#search").click(function(){
		if($("#search_form").val()==""){
			alert("�˻�� �Է��ϼ���.");
			$("#search_form").focus();
			return false;
		} 		
		searchform.submit();

	});
    
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: 7,	    		// max page size
		    totals: '${dbCount}',	// total pages	
		    page: '${rpage}',		// initial page		
		    pageSize: 10,			// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/lawtion/precedent_review.do?rpage="+e.page);         
	    });
		
 	});
</script> 
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ı��Ƿ�</title>
</head>
<body>
	<jsp:include page="../header1.jsp"/>
	<div class="review-title1">
		<div class="title-sub">
			<img src="http://localhost:9000/lawtion/images/precedenttitle.jpg" width="500" height="100" class="title">
		</div>	
	</div>
	<div class="whereru">
	<ul>
		<li>�ǷʰԽ���</li>>
		<li><a href="precedent_normal.do">�ı��Ƿ�</a></li>
	</ul>
	</div>
	<div class="precedent">
	<form name="searchform" action="search_input.do" method="post">	
		<div class="gogo">
			<input type="text" name="search2" class="s_input" placeholder="  �˻�� �Է��ϼ���" id="search_form">
			<input type="hidden" name="s_param" value="">
			<a href="#"><img src="http://localhost:9000/lawtion/images/magnifier.jpg" id="search"></a>
		</div>
	</form>	
		<table class="table1">	
			<tr>
				<td colspan="6">
					<a href="precedent_normal.do"><button type="button" class="gobtn1">�����Ƿ�</button></a>
					<a href="precedent_review.do"><button type="button" class="gobtn2">�ı��Ƿ�</button></a>
				</td>
			</tr>			
			<tr>
				<th>ī�װ�</th>
				<th width="50px">��ȣ</th>
				<th width="1300px">�Ҽ۸�</th>
				<th>����</th>
				<th>��纯ȣ��</th>
				<th>��ȸ��</th>
			</tr>
			<tr>
				<td rowspan="11" class="category">
						<ul class="tree">
							<li class="tree_li">
							<input type="checkbox" id="root"/>
						    <label for="root">��ü</label>
						    
					   
					    <ul class="tree"> 
					        <li>
					            <input type="checkbox" id="one" checked="checked">
					            <label for="one">�������</label>
					            <ul class="tree">
					                <li><a href="tree_cate.do?category=1&wpage=review">���λ�</a></li>
					                <li><a href="tree_cate.do?category=2&wpage=review">������</a></li>
					                <li><a href="tree_cate.do?category=3&wpage=review">������</a></li>
					                <li><a href="tree_cate.do?category=4&wpage=review">��Ư��</a></li>
					                <li><a href="tree_cate.do?category=5&wpage=review">������</a></li>
					                <li><a href="tree_cate.do?category=6&wpage=review">���Ϲ�����</a></li>
					            </ul>
					        </li>
					     </ul>
					    					     
					     <ul class="tree"> 
					        <li>
					            <input type="checkbox" id="two" checked="checked">
					            <label for="two">��������</label>
					            <ul class="tree">
					                <li><a href="tree_scale.do?scale=1&wpage=review">�������</a></li>
					                <li><a href="tree_scale.do?scale=2&wpage=review">��������</a></li>
					                <li><a href="tree_scale.do?scale=3&wpage=review">���ϱ޽�</a></li>
					            </ul>
					        </li>
					     </ul>
					     
					     <ul class="tree">
					        <li>
					            <input type="checkbox" id="three" checked="checked">
					            <label for="three">�Ҽ۰��</label>
					            <ul class="tree">
					                <li><a href="tree_result.do?result=1&wpage=review">���¼�</a></li>
					                <li><a href="tree_result.do?result=2&wpage=review">���м�</a></li>
					            </ul>
					        </li>
					    </ul>
					    </li>
					    </ul>
				</td>
				<c:forEach items="${list }" var="vo">
					<tr>
						<td>${vo.rno }</td>
						<td><a href="http://localhost:9000/lawtion/precedent_content_review.do?no=${vo.no }&rno=${vo.rno}">
						${vo.title }
						</a></td>
						<td>${vo.result }</td>
						<td>${vo.lname }</td>
						<td>${vo.hits }</td>
					</tr>
				</c:forEach>
		</table>
		
		<div class="gzua">
			<table class="table2">
				<tr>
					<td colspan="5">
						<!--  <span> << 1 2 3 4 5 6 7 8 9 10 >> </span> -->
							<div id="ampaginationsm"></div>
					</td>
				</tr>	
			</table>		
		</div>	
	</div>
	
	<jsp:include page="../footer.jsp"/>	
	
	<div class="wrap">
		<div class="btn">
			<img src="http://localhost:9000/lawtion/images/btn_search_log_off.png" id="ban1">
		</div>
		<div class="done" id="ban2">
			<table border=1 class="table3">
				<tr>
					<th>�ֱٰ˻��̷�(${count }��)</th>
					<th><img src="http://localhost:9000/lawtion/images/close.png" id="ban3"></th>
				</tr>
	
				<c:forEach items="${list1 }" var="vo">
				<tr class="search_tr">
					<td colspan="2"><a href="search_input2.do?wpage=review&sno=${vo.sno }">${vo.keyword }</a></td>
				</tr>
				</c:forEach>

				<tr class="table3_last">
					<td colspan="2"><a href="http://localhost:9000/lawtion/search_delete.do?wpage=review">�ֱٰ˻��̷»���</a></td>
				</tr>
			</table>
		</div>
	</div>
	

</body>
</html>