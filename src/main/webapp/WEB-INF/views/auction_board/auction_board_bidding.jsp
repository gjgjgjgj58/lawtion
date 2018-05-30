<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/lawtion/css/lawtion.css">
<style>
	html, body{
	overflow-y:auto;
	overflow-x:hidden;
	}
	div.a{
	witdh:100%;
	height:100%;
	background-color:white;
	border:1px solid white;
	text-align:center;
	}
	div.b{
	margin:auto;
	text-align:left;
	padding:0px 20px 0px 20px;
	border:1px solid #eee;
	}
	table tr td a{
	text-decoration:none;
	color:#555;
	font:bold 12px tahoma;
	padding-left:10px;
	}
	span.y{
	margin-right:350px;
	font:bold 14px tahoma;
	}
	section.y{
	padding:10px;
	}
	span.a{
	margin-left:310px;
	font:bold 14px tahoma;
	}
	section.a{
	padding:10px 10px 30px 10px;
	}
	select{
	height:24px;
	}
	.abw_money{
	height:18px;
	}
</style>
<script src="http://localhost:9000/lawtion/js/jquery-3.3.1.min.js"></script>
<script>
//function abcclose(){
	//window.opener.location.href="http://localhost:9900/lawtion/auction_board_content_check.do";
	//self.close();
//}

$(document).ready(function(){
	$(".reply-write-button2").click(function(){
    	var content = $(".reply-write-content2").val(); // 해당하는 frm을 serialize를 해줍니다. ajax로 데이터를 보내기위해서 하는 작업입니다.
    	var no = "${no}"; // id값은 기본키이자 바뀌면안되는것이고 id값으로 조건을 줄꺼라서 고유 id 값을 받아옵니다.
    	
    	$.ajax({
    		url : "http://localhost:9000/lawtion/reply_write_check2.do", // controller로 보낼 url
    		type : "GET", // post방식으로 전송
        	data : 'content='+content+'&no='+no, // data로는 위에서 serialize한 frm을 보냅니다.
        	async : false, // 전역변수 사용을 위해서 설정해준다
        	dataType : "json", // serialize하면 json형태로 값을 보내줘야합니다.
        	contentType: "application/x-www-form-urlencoded; charset=UTF-8", // 인코딩 설정
        	success : function(data){
        		
        		window.opener.reply_view_load();//부모 창에 있는 댓글 확인 함수를 불러온다.
        		//window.opener.location.reload();
            	self.close(); // 변경 후 자식 창을 받아줍니다.
            
        	}
    	});
	});
});

</script>
</head>
<body>
	
	<div class="a">
	<h1>입찰 신청하기</h1>
	<br>
	<section class="y"><span class="y">[필수] 역경매 입찰 이용약관</span></section>
	<div class="b" style="white-space:nowrap; overflow:auto;width:500px;height:200px;font-size:12px;">제1조 (개인정보의 처리 및 이용 목적)<br><br>회사는 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적 이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.<br><br>

1.     회사의 의·약학적 연구 활동: 임상활동을 통해 수집한 데이터 분석 등 의약학적 연구 및 개발 업무 수행<br><br>

2.     회사의 마케팅 및 의·약학적 정보 전달 업무: 시장조사, 제품설명회 등 보건의료전문가를 대상으로 하는 마케팅 또는 의약학적 정보 취득 및 전달 활동 수행<br><br>

3.     계약의 체결·이행: 계약 당사자의 신원 확인, 계약 체결 여부의 결정, 대금/서비스료 지급 등 계약의 이행, 내용증명 발송·가압류 신청·소 제기 등 채무불이행에 대한 대응<br><br>

4.     회사의 법적·행정적 의무 이행: 부작용·이상사례 보고, 사용성적조사 결과 보고, 법인세·부가가치세 등 각종 세금의 신고·납부, 영수증·세금계산서의 발급·교부 등 회사에 부과되는 법적•행정적 의무의 이행<br><br>

5.     고객관계 관리(CRM), 불만고객의 질의에 대한 답변<br><br>

6.     내부 감사 및 향후 회사 영업의 전부 또는 일부 양도에 대비한 실사<br><br>

7.     입사지원 행정 처리 및 입사자 채용업무<br><br>

 

제2조 (개인정보의 처리 및 보유 기간) 

관계법령 규정에 의해 이용자의 개인정보를 보존할 의무가 없는 한 이용자의 개인정보는 원칙적으로 각 항목별 개인정보의 처리목적이 달성되면 지체 없이 파기합니다. 다만, 입사지원자 중 최종 입사자를 제외한 나머지 입사 미대상자에 대하여는 법령에 따로 정함이 없는 한 채용 여부 결정시까지만 보유·이용합니다.

 

제3조 (개인정보의 제3자 제공) 

회사는 원칙적으로 이용자의 개인정보를 제1조 (개인정보의 처리 목적)에서 명시한 목적 범위 내에서 처리하며, 이용자의 사전 동의 없이는 본래의 범위를 초과하여 처리하거나 제3자에게 제공하지 않습니다. 단, 다음의 경우에는 개인정보를 제3자에게 제공하거나 목적 범위를 넘어서 처리할 수 있습니다.

1.     이용자가 사전에 제3자 제공 및 공개에 동의한 경우

2.     법령에 의하여 명시적으로 개인정보 제3자 제공이 요구되는 경우

3.     정보주체 또는 그 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소 불명 등으로 사전 동의를 받을 수 없는 경우로서 정보주체나 제3자의 급박한 생명, 신체, 재산의 이익을 위하여 필요하다고 인정되는 경우

4.     개인을 식별할 수 없는 상태로 가공하여 이용하는 경우</div>

		<section class="a"><span class="a">역경매 이용약관에 동의합니다.</span><input type="checkbox"></section>
		
		<!-- form name="boardForm" action="board_controller.jsp" method="post" class="auction_board_write"> -->
				<table class="auction_table_write">
					<tr><th colspan="2"></th></tr>
					<tr>
						<td>의뢰자</td>
						<td><input type="text" class="abw_customer" name="customer" id="customer" disabled value="정미숙"><a href="#">의뢰자 정보보기</a></td>
					</tr>
					<tr>
						<td>신청자</td>
						<td><input type="text" class="abw_lawyer" name="lawyer" id="lawyer" disabled value="김선웅"></td>
					</tr>
					<tr>
						<td>제안서</td>
						<td>
						<textarea rows="10" cols="60"  class="reply-write-content2" name="content" placeholder="이용약관에 따라 작성해주시기 바랍니다."></textarea></td>
					</tr>
					<tr>
						<td>예상 <br>의뢰비용</td>
						<td><input type="text" class="abw_money" name="money" id="money">
							<select name="money" id="money">
								<option value="self">미결정</option>
								<option value="self">직접입력</option>
							</select><br>*추후에도 의뢰인과 금액을 상의할 수 있습니다.
						</td>
					</tr>
					<tr>
						<td>공개설정</td>
						<td><input type="checkbox" name="agree" id="agree" class="agree-checkbox"><span>체크하시면 일반 회원들도 제안서 열람이 가능합니다.</span></td>
					</tr>
					
				
				
				<!-- <form name="boardform" action="#" method="post">
				<ul>
					<li>
						<label>제목</label>
						<input type="text" name="title">				
					</li>
					<li>
						<label>내용</label>
						<textarea rows="10" cols="50"></textarea>
					</li>
					<li>
						<label>첨부파일</label>
						<input type="file" name="fname">
					</li>
					<li>
						
						<button type="button">완료</button>
						<button type="reset">취소</button>
						<a href="http://localhost:9900/mycgv/board/board_content.jsp"><button type="button">이전 페이지</button></a>
						<a href="http://localhost:9900/mycgv/board/board_list.jsp"><button type="button">전체 리스트</button></a>
						
					</li>
				</ul>
				</form> -->
				
				
				
				<tr>
					<td colspan="2" class="abw_success">
						<a href="#"><button class="reply-write-button2">완료</button></a>
					</td>
				</tr>
			</table>	
			<!-- </form> -->
	</div>
	
</body>
</html>