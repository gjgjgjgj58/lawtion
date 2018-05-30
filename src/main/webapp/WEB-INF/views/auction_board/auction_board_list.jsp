<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/lawtion/css/button1.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9000/lawtion/css/lawtion.css">

<!-- ����¡ ó�� �ڵ� ���� -->

<link rel="stylesheet" type="text/css" href="http://localhost:9000/lawtion/css/am-pagination.css">
<script src="http://localhost:9000/lawtion/js/jquery-3.3.1.min.js"></script>
<script src="http://localhost:9000/lawtion/js/am-pagination.js"></script>
<script>
	$(document).ready(function(){
		
		//alert("d");
		
		var pager = jQuery('#ampaginationsm').pagination({

		    maxSize: 10,	    		// max page size
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
			  // jQuery('.showlabelsm').text('The selected page no: '+e.page);			
	           $(location).attr('href', "http://localhost:9000/lawtion/auction_board.do?rpage="+e.page);         
	    });
		
		$(".searchButton").click(function(){
			
			var input = $(".searchInput").val();
			var category = $(".searchCategory").val();
			var area = $(".searchArea").val();
			
			if(category == "���"){
				category = "";
			}
			
			if(area == "����"){
				area = "";
			}
	    	
	    	location.href = "http://localhost:9000/lawtion/auction_board.do?input="+encodeURI(input,"UTF-8")+
	    					"&category="+encodeURI(category,"UTF-8")+"&area="+encodeURI(area,"UTF-8");
	    	
		});
		
	});
	
</script>

<!-- ����¡ ó�� �ڵ� ���� -->

</head>
<body>
	<jsp:include page="../header1.jsp" /><!-- ..�� ������ ���������� ���� �ǹ��Ѵ�. -->
	<div class="review-title1">
		<div class="title-sub">
			<img src="http://localhost:9000/lawtion/images/actiontitle.jpg" width="500" height="100" class="title">
		</div>	
	</div>	
	<div class="auction_content"><!-- class -->
			<!-- carouse1 -->
			<section class="auction_style"><!-- class -->
				
				
			
			<br><br>
			
			<table class="auction_table_list">
				<tr>
				<td colspan="6">
				<a href="auction_board_write.do"><div class="button_base b05_3d_roll">
        <div>�۾���</div>
        <div>�۾���</div>
    </div></a>
				
				</td>
				</tr>
						
					
					<tr>
						<th class="nth1">�Ƿ��Ͻ�</th>
						<th class="nth2">�����Ͻ�</th>
						<th>��û��</th>
						<th class="nth4">����</th>
						<th>��ȸ��</th>
						<th class="nth6">������</th>
					</tr>
	<c:forEach items="${list}" var="vo">
	<%-- for(AuctionBoardVO vo : list){ --%>				
	<tr>		
	<td>${vo.adate }</td>
	<c:choose>
		<c:when test="${vo.e < 4}">
			<td style="color:tomato;"><strong>D - ${vo.e }</strong></td>
		</c:when>
		<c:otherwise>
			<td>D - ${vo.e }</td>
		</c:otherwise>
	</c:choose>
	<td class="writer">
		<span>
			<a href="#">
			��**</a>
		</span>
	</td>
	<td class="subject">
		<a href="http://localhost:9000/lawtion/auction_board_content.do?no=${vo.no}&rno=${vo.rno}&rpage=${rpage }">[${vo.category}] [${vo.area}] ${vo.title}</a>
	</td>
	<td>${vo.hits}</td>
	<c:choose>
		<c:when test="${vo.btotal == 0}">
			<td align="left" class="bidding" style="color:#ccc;">${vo.btotal }��</td>
		</c:when>
	
		<c:otherwise>
			<td align="left" class="bidding">${vo.btotal }��</td>
		</c:otherwise>
	</c:choose>
	</tr>
	
	<%-- } --%>
	</c:forEach>
		
			
				
				<tr>
				<td colspan="6" class="num">
						<br>
						
								<select class="searchCategory">
									<option>���</option>
									<option value="�λ�">�λ�</option>
									<option value="����">����</option>
								</select>
							
								<select class="searchArea">
									<option>����</option>
									<option value="����">����</option>
									<option value="���">���</option>
								</select>
								
								<div class="searchDiv">
									<input type="text" placeholder="�˻��� �Է�" class="searchInput">
									<button class="searchButton">�˻�</button>
								</div>
							
						<br>
						<div id="ampaginationsm">
						</div>
					</td>
				</tr>
				
			</table>
			<br><br><br><br>
			</section>
		</div>
		
				
			
		
		<jsp:include page="../footer.jsp" /><!-- ..�� ������ ���������� ���� �ǹ��Ѵ�. -->
</body>
</html>