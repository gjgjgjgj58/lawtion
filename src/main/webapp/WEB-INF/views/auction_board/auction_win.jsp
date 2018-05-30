<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/lawtion/css/layer1.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://localhost:9000/lawtion/js/jquery-3.3.1.min.js"></script> 
<script>

$(document).ready(function(){
	
	$(".ellipsis").click(function(){
		
		alert("만료된 페이지입니다.");
		
	});
	
	$('.btn-example').click(function(){
        var $href = $(this).attr('href');
        layer_popup($href);
    });
    
	function layer_popup(el){

        var $el = $(el);        //레이어의 id를 $el 변수에 저장
        var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

        var $elWidth = ~~($el.outerWidth()),
            $elHeight = ~~($el.outerHeight()),
            docWidth = $(document).width(),
            docHeight = $(document).height();

        // 화면의 중앙에 레이어를 띄운다.
        if ($elHeight < docHeight || $elWidth < docWidth) {
            $el.css({
                marginTop: -$elHeight /2,
                marginLeft: -$elWidth/2
            })
        } else {
            $el.css({top: 0, left: 0});
        }

        $el.find('a.btn-layerClose').click(function(){
            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
            return false;
        });

        $('.layer .dimBg').click(function(){
            $('.dim-layer').fadeOut();
            return false;
        });

    }
});



</script>
</head>
<body>
<jsp:include page="../header1.jsp" /><!-- ..은 폴더를 빠져나가는 것을 의미한다. -->
	<h1 class="auction_title2">역경매 현황</h1>
	<div class="auction_content2"><!-- class -->
			
			<section class="auction_style2"><!-- class -->
				
				
			
			<br><br>
			
			<table class="auction_table_list">
						
					
					<tr class="win">
						<th>의뢰일시</th>
						<th>변호사 이름</th>
						<th>제목</th>
						<th>진행상황</th>
						<th>의뢰비용</th>
						<th>변호사 정보</th>
						<th>낙찰 결정</th>
					</tr>
	<tr>		
	<td>2018.02.19 10:59</td>
	<td class="writer">
		<span>송명호</span>
	</td>
	<td class="subject">
		<a href="auction_board_content_lawyer.jsp">화가 납니다 레알루다가!!</a>
	</td>
	
	<td class="bidding">진행중</td>
	
	
	<td>20,000,000원</td>
	
	
	<td class="info"><a href="#">click</a></td>
	
	
	<td><a href="#layer2" class="btn-example">click</a></td>
	</tr>
	
	<tr>		
	<td>2018.02.19 10:59</td>
	<td class="writer">
		<span>이천식</span>
	</td>
	<td class="subject">
		<a href="auction_board_content_lawyer.jsp">화가 납니다 레알루다가!!</a>
	</td>
	
	<td class="bidding">진행중</td>
	
	
	<td>24,000,000원</td>
	
	
	<td class="info"><a href="#">click</a></td>
	
	
	<td><a href="#layer2" class="btn-example">click</a></td>
	</tr>
	
	<tr>		
	<td>2018.02.19 10:59</td>
	<td class="writer">
		<span>심명보</span>
	</td>
	<td class="subject">
		<a href="auction_board_content_lawyer.jsp">화가 납니다 레알루다가!!</a>
	</td>
	
	<td class="bidding">진행중</td>
	
	
	<td>미결정</td>
	
	
	<td class="info"><a href="#">click</a></td>
	
	
	<td><a href="#layer2" class="btn-example">click</a></td>
	</tr>
	
	<tr>		
	<td>2018.02.19 10:59</td>
	<td class="writer">
		<span>이화랑</span>
	</td>
	<td class="subject">
		<a href="auction_board_content_lawyer.jsp">화가 납니다 레알루다가!!</a>
	</td>
	
	<td class="bidding">진행중</td>
	
	
	<td>미결정</td>
	
	
	<td class="info"><a href="#">click</a></td>
	
	
	<td><a href="#layer2" class="btn-example">click</a></td>
	</tr>
	
	<tr>		
	<td>2018.02.16 11:23</td>
	<td class="writer">
		<span>코난</span>
	</td>
	<td class="subject">
		<a href="#"><div class="ellipsis">인성 터질거 같다요 난다고라 류승룡 기모찌 제발 제 사건좀 해결해주실 분?</div></a>
	</td>
	
	<td class="bidding"></td>
	
	
	<td>6,800,000원</td>
	
	
	<td class="info"><a href="#">click</a></td>
	
	
	<td><a href="#"></a></td>
	</tr>
	
	<tr>		
	<td>2018.02.16 11:23</td>
	<td class="writer">
		<span>뿡뿡이</span>
	</td>
	<td class="subject">
		<a href="#"><div class="ellipsis">인성 터질거 같다요 난다고라 류승룡 기모찌 제발 제 사건좀 해결해주실 분?</div></a>
	</td>
	
	<td class="bidding">낙찰</td>
	
	
	<td>6,000,000원</td>
	
	
	<td class="info"><a href="#">click</a></td>
	
	
	<td><a href="#"></a></td>
	</tr>
	
	<tr>		
	<td>2018.02.16 11:23</td>
	<td class="writer">
		<span>쓰레기</span>
	</td>
	<td class="subject">
		<a href="#"><div class="ellipsis">인성 터질거 같다요 난다고라 류승룡 기모찌 제발 제 사건좀 해결해주실 분?</div></a>
	</td>
	
	<td class="bidding"></td>
	
	
	<td>6,200,000원</td>
	
	
	<td class="info"><a href="#">click</a></td>
	
	
	<td><a href="#"></a></td>
	</tr>
	
	<tr>		
	<td>2018.02.16 11:23</td>
	<td class="writer">
		<span>인간성</span>
	</td>
	<td class="subject">
		<a href="#"><div class="ellipsis">인성 터질거 같다요 난다고라 류승룡 기모찌 제발 제 사건좀 해결해주실 분?</div></a>
	</td>
	
	<td class="bidding"></td>
	
	
	<td>7,500,000원</td>
	
	
	<td class="info"><a href="#">click</a></td>
	
	
	<td><a href="#"></a></td>
	</tr>
	
	<tr>		
	<td>2018.02.16 11:23</td>
	<td class="writer">
		<span>천치야</span>
	</td>
	<td class="subject">
		<a href="#"><div class="ellipsis">인성 터질거 같다요 난다고라 류승룡 기모찌 제발 제 사건좀 해결해주실 분?</div></a>
	</td>
	
	<td class="bidding"></td>
	
	
	<td>7,000,000원</td>
	
	
	<td class="info"><a href="#">click</a></td>
	
	
	<td><a href="#"></a></td>
	</tr>
	
	<tr>		
	<td>2018.02.16 11:23</td>
	<td class="writer">
		<span>바보야</span>
	</td>
	<td class="subject">
		<a href="#"><div class="ellipsis">인성 터질거 같다요 난다고라 류승룡 기모찌 제발 제 사건좀 해결해주실 분?</div></a>
	</td>
	
	<td class="bidding"></td>
	
	
	<td>6,900,000원</td>
	
	
	<td class="info"><a href="#">click</a></td>
	
	
	<td><a href="#"></a></td>
	</tr>
	
	

			</table>
<div class="dim-layer">
    <div class="dimBg"></div>
    <div id="layer2" class="pop-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <p class="ctxt mb20"><a href="#"><strong>송명호</strong></a></p>
                <p class="ctxt mb20"><strong>해당 변호사에게 낙찰하시겠습니까?</strong><br>
                *낙찰을 결정하게 되면 다시는 철회할 수 없습니다.<br></p>

                <div class="btn-r">
                	<a href="#" class="btn-layerClose"><strong>예</strong></a>
                    <a href="#" class="btn-layerClose"><strong>아니오</strong></a>
                </div>
                <!--// content-->
            </div>
        </div>
    </div>
</div>
			
			<br><br><br><br>
			</section>
		</div>
		
		
		
				
			
		
		<jsp:include page="../footer.jsp" /><!-- ..은 폴더를 빠져나가는 것을 의미한다. -->
</body>
</html>