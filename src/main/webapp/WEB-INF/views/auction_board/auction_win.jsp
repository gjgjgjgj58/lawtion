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
		
		alert("����� �������Դϴ�.");
		
	});
	
	$('.btn-example').click(function(){
        var $href = $(this).attr('href');
        layer_popup($href);
    });
    
	function layer_popup(el){

        var $el = $(el);        //���̾��� id�� $el ������ ����
        var isDim = $el.prev().hasClass('dimBg');   //dimmed ���̾ �����ϱ� ���� boolean ����

        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

        var $elWidth = ~~($el.outerWidth()),
            $elHeight = ~~($el.outerHeight()),
            docWidth = $(document).width(),
            docHeight = $(document).height();

        // ȭ���� �߾ӿ� ���̾ ����.
        if ($elHeight < docHeight || $elWidth < docWidth) {
            $el.css({
                marginTop: -$elHeight /2,
                marginLeft: -$elWidth/2
            })
        } else {
            $el.css({top: 0, left: 0});
        }

        $el.find('a.btn-layerClose').click(function(){
            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // �ݱ� ��ư�� Ŭ���ϸ� ���̾ ������.
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
<jsp:include page="../header1.jsp" /><!-- ..�� ������ ���������� ���� �ǹ��Ѵ�. -->
	<h1 class="auction_title2">����� ��Ȳ</h1>
	<div class="auction_content2"><!-- class -->
			
			<section class="auction_style2"><!-- class -->
				
				
			
			<br><br>
			
			<table class="auction_table_list">
						
					
					<tr class="win">
						<th>�Ƿ��Ͻ�</th>
						<th>��ȣ�� �̸�</th>
						<th>����</th>
						<th>�����Ȳ</th>
						<th>�Ƿں��</th>
						<th>��ȣ�� ����</th>
						<th>���� ����</th>
					</tr>
	<tr>		
	<td>2018.02.19 10:59</td>
	<td class="writer">
		<span>�۸�ȣ</span>
	</td>
	<td class="subject">
		<a href="auction_board_content_lawyer.jsp">ȭ�� ���ϴ� ���˷�ٰ�!!</a>
	</td>
	
	<td class="bidding">������</td>
	
	
	<td>20,000,000��</td>
	
	
	<td class="info"><a href="#">click</a></td>
	
	
	<td><a href="#layer2" class="btn-example">click</a></td>
	</tr>
	
	<tr>		
	<td>2018.02.19 10:59</td>
	<td class="writer">
		<span>��õ��</span>
	</td>
	<td class="subject">
		<a href="auction_board_content_lawyer.jsp">ȭ�� ���ϴ� ���˷�ٰ�!!</a>
	</td>
	
	<td class="bidding">������</td>
	
	
	<td>24,000,000��</td>
	
	
	<td class="info"><a href="#">click</a></td>
	
	
	<td><a href="#layer2" class="btn-example">click</a></td>
	</tr>
	
	<tr>		
	<td>2018.02.19 10:59</td>
	<td class="writer">
		<span>�ɸ�</span>
	</td>
	<td class="subject">
		<a href="auction_board_content_lawyer.jsp">ȭ�� ���ϴ� ���˷�ٰ�!!</a>
	</td>
	
	<td class="bidding">������</td>
	
	
	<td>�̰���</td>
	
	
	<td class="info"><a href="#">click</a></td>
	
	
	<td><a href="#layer2" class="btn-example">click</a></td>
	</tr>
	
	<tr>		
	<td>2018.02.19 10:59</td>
	<td class="writer">
		<span>��ȭ��</span>
	</td>
	<td class="subject">
		<a href="auction_board_content_lawyer.jsp">ȭ�� ���ϴ� ���˷�ٰ�!!</a>
	</td>
	
	<td class="bidding">������</td>
	
	
	<td>�̰���</td>
	
	
	<td class="info"><a href="#">click</a></td>
	
	
	<td><a href="#layer2" class="btn-example">click</a></td>
	</tr>
	
	<tr>		
	<td>2018.02.16 11:23</td>
	<td class="writer">
		<span>�ڳ�</span>
	</td>
	<td class="subject">
		<a href="#"><div class="ellipsis">�μ� ������ ���ٿ� ���ٰ�� ���·� ����� ���� �� ����� �ذ����ֽ� ��?</div></a>
	</td>
	
	<td class="bidding"></td>
	
	
	<td>6,800,000��</td>
	
	
	<td class="info"><a href="#">click</a></td>
	
	
	<td><a href="#"></a></td>
	</tr>
	
	<tr>		
	<td>2018.02.16 11:23</td>
	<td class="writer">
		<span>�׻���</span>
	</td>
	<td class="subject">
		<a href="#"><div class="ellipsis">�μ� ������ ���ٿ� ���ٰ�� ���·� ����� ���� �� ����� �ذ����ֽ� ��?</div></a>
	</td>
	
	<td class="bidding">����</td>
	
	
	<td>6,000,000��</td>
	
	
	<td class="info"><a href="#">click</a></td>
	
	
	<td><a href="#"></a></td>
	</tr>
	
	<tr>		
	<td>2018.02.16 11:23</td>
	<td class="writer">
		<span>������</span>
	</td>
	<td class="subject">
		<a href="#"><div class="ellipsis">�μ� ������ ���ٿ� ���ٰ�� ���·� ����� ���� �� ����� �ذ����ֽ� ��?</div></a>
	</td>
	
	<td class="bidding"></td>
	
	
	<td>6,200,000��</td>
	
	
	<td class="info"><a href="#">click</a></td>
	
	
	<td><a href="#"></a></td>
	</tr>
	
	<tr>		
	<td>2018.02.16 11:23</td>
	<td class="writer">
		<span>�ΰ���</span>
	</td>
	<td class="subject">
		<a href="#"><div class="ellipsis">�μ� ������ ���ٿ� ���ٰ�� ���·� ����� ���� �� ����� �ذ����ֽ� ��?</div></a>
	</td>
	
	<td class="bidding"></td>
	
	
	<td>7,500,000��</td>
	
	
	<td class="info"><a href="#">click</a></td>
	
	
	<td><a href="#"></a></td>
	</tr>
	
	<tr>		
	<td>2018.02.16 11:23</td>
	<td class="writer">
		<span>õġ��</span>
	</td>
	<td class="subject">
		<a href="#"><div class="ellipsis">�μ� ������ ���ٿ� ���ٰ�� ���·� ����� ���� �� ����� �ذ����ֽ� ��?</div></a>
	</td>
	
	<td class="bidding"></td>
	
	
	<td>7,000,000��</td>
	
	
	<td class="info"><a href="#">click</a></td>
	
	
	<td><a href="#"></a></td>
	</tr>
	
	<tr>		
	<td>2018.02.16 11:23</td>
	<td class="writer">
		<span>�ٺ���</span>
	</td>
	<td class="subject">
		<a href="#"><div class="ellipsis">�μ� ������ ���ٿ� ���ٰ�� ���·� ����� ���� �� ����� �ذ����ֽ� ��?</div></a>
	</td>
	
	<td class="bidding"></td>
	
	
	<td>6,900,000��</td>
	
	
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
                <p class="ctxt mb20"><a href="#"><strong>�۸�ȣ</strong></a></p>
                <p class="ctxt mb20"><strong>�ش� ��ȣ�翡�� �����Ͻðڽ��ϱ�?</strong><br>
                *������ �����ϰ� �Ǹ� �ٽô� öȸ�� �� �����ϴ�.<br></p>

                <div class="btn-r">
                	<a href="#" class="btn-layerClose"><strong>��</strong></a>
                    <a href="#" class="btn-layerClose"><strong>�ƴϿ�</strong></a>
                </div>
                <!--// content-->
            </div>
        </div>
    </div>
</div>
			
			<br><br><br><br>
			</section>
		</div>
		
		
		
				
			
		
		<jsp:include page="../footer.jsp" /><!-- ..�� ������ ���������� ���� �ǹ��Ѵ�. -->
</body>
</html>