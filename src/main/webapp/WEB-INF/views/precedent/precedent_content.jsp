<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="lawtion.dao.*, lawtion.vo.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/lawtion/css/lawtion.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9000/mycgv/am-pagination.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://localhost:9000/mycgv/js/paging.js"></script>
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
    
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���</title>
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
		<li><a href="precedent_normal.do">�����Ƿ�</a></li>>
		<li>�Ƿʳ���</li>
	</ul>
	</div>
	<div class="precedent">	
		<form name="searchform" action="search_input.do" method="post">
		<div class="gogo">
			<input type="text" name="search1_c" class="s_input" placeholder="  �˻�� �Է��ϼ���" id="search_form">
			<a href="#"><img src="http://localhost:9000/lawtion/images/magnifier.jpg" id="search"></a>
		</div>
		</form>
		
		<table class="table1">	
			<tr>
				<td colspan="4">
					<a href="precedent_normal.do"><button type="button" class="gobtn1">�������</button></a>
					<a href="#"><button type="button" class="gobtn2">��Ǻ�</button></a>
				</td>
			</tr>			
			<tr>
				<th>ī�װ�</th>
				<th width="50px"></th>
				<th width="1500px">${vo.title }</th>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<td rowspan="10" class="category">
						<ul class="tree">
							<li class="tree_li">
							<input type="checkbox" id="root"/>
						    <label for="root">��ü</label>
						    
					   
					    <ul class="tree"> 
					        <li>
					            <input type="checkbox" id="one" checked="checked">
					            <label for="one">�������</label>
					            <ul class="tree">
					                <li><a href="">���λ�</a></li>
					                <li><a href="">������</a></li>
					                <li><a href="">������</a></li>
					                <li><a href="">��Ư��</a></li>
					                <li><a href="">������</a></li>
					                <li><a href="">���Ϲ�����</a></li>
					            </ul>
					        </li>
					     </ul>
					    					     
					     <ul class="tree"> 
					        <li>
					            <input type="checkbox" id="two" checked="checked">
					            <label for="two">��������</label>
					            <ul class="tree">
					                <li><a href="">�������</a></li>
					                <li><a href="">��������</a></li>
					                <li><a href="">���ϱ޽�</a></li>
					            </ul>
					        </li>
					     </ul>
					     
					     <ul class="tree">
					        <li>
					            <input type="checkbox" id="three" checked="checked">
					            <label for="three">�Ҽ۰��</label>
					            <ul class="tree">
					                <li><a href="">���¼�</a></li>
					                <li><a href="">���м�</a></li>
					            </ul>
					        </li>
					    </ul>
					    </li>
					    </ul>
				</td>
			</tr>
			<tr>
				<td rowspan="10"></td>
				<td rowspan="10">
					${vo.content }
				</td>
				<td rowspan="10"></td>
				<td rowspan="10"></td>
			</tr>
			
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
					<td colspan="2"><a href="search_input2.do?wpage=normal&sno=${vo.sno }">${vo.keyword }</a></td>
				</tr>
				</c:forEach>
				<tr class="table3_last">
					<td colspan="2"><a href="http://localhost:9000/lawtion/search_delete.do?wpage=normal">�ֱٰ˻��̷»���</a></td>
				</tr>
			</table>
		</div>

		<!--  <div class="btn2">
			<img src="http://localhost:9000/lawtion/images/btn_search_log_off.png" id="ban3">
		</div>
		<div class="done2" id="ban4"></div>-->
	</div>
	
	
</body>

</html>