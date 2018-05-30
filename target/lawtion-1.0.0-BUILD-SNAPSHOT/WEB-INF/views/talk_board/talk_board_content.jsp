<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" 
    import="lawtion.vo.*,lawtion.dao.*,java.util.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href= "http://localhost:9000/lawtion/css/lawtion.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btndelete").click(function(){
			if(confirm("�����Ͻðڽ��ϱ�?")!=0){
				$(location).attr('href','talk_delete_check.do?no=${vo.no}');
				
			}else{
				alert("������ ��ҵǾ����ϴ�.");
				return false;
			}
		});
		
		//��� ��Ϲ�ư	
		$(".reply-write-button").click(function(){
			
			var check_value = $("#reply-content-check").val(); 
			
			if(check_value == "hide"){				
				$(".reply-content").css("display","inline-block");			
				$("#reply-content-check").val("show");
			}else{
				$(".reply-content").css("display","none");
				$("#reply-content-check").val("hide");
			}
			
			/* ��� ��� ���� */
			var content = $(".reply-write-content").text();
			var no = "${vo.no}";
			alert(no);
			alert(content);
			
			$.ajax({
				url : 'http://localhost:9000/mycgv/reply_write_check.do',
				type :'GET',
				data : 'content='+content+'&no='+no,
				dataType : 'json',
				contentType : 'application/x-www-form-urlencoded;charset=utf-8',
				success : function(data){
					alert("aaaaa");
					if(data.length != 0){	
						alert("��� ��� �Ϸ�");	
						$(".reply-write").css("display","none");
						$("#reply-write-check").val("hide");
					}
				}
			});	//end of ajax	
			
		});	
	});
	
</script>
</head>
<body>
	<jsp:include page ="../header.jsp"/>
	<div class="review">
		<div class="review-title">
			<img src="http://localhost:9000/lawtion/images/talktitle.PNG" width="240" height="60" class="title">
		</div>
		<div class="talknotice">
			<label class="talktitle">
				�� �Խ����� ����� �Խ��ǵ� �ı� �Խ��ǵ� �ƴմϴ�.<br>�ֺ��� �ϼҿ����� ���ϴ� ���, ����� ���� �ֺ������ ����, ����, ��� �޴� �����Դϴ�. <br>�������� �����ٴ� ������ ���� ������ּ���			
			</label>
		</div>
		<div class="review-content">
			<ul>
				<li><a href="#"><img src="http://localhost:9000/lawtion/images/previous.png" width="25" height="20">������</a></li>
				<li><a href="http://localhost:9000/lawtion/talk_board.do">���</a></li>
				<li><a href="#">������<img src="http://localhost:9000/lawtion/images/next.png" width="25" height="20"></a></li>
			</ul>
			<table border=0 class="content">
				
				<tr>
					<td colspan=8>
						${vo.title}
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
					</td>
					<td>
					</td>
					<td>
					</td>
					<td>
						������
					</td>
					<td>
						${vo.tdate}
					</td>
					<td>
						${vo.hits}
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td colspan=5>
							${vo.content}
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td colspan=6>
					<button type="button" name="btndelete" id="btndelete">�� �����ϱ�</button>
					<input type="hidden" name="no" value="${vo.no}">
					<a href="http://localhost:9000/lawtion/talk_update.do?no=${vo.no}&rno=${rno}">
					<button type="button" name="btnupdate">�� �����ϱ�</button></a></td>
				</tr>
			</table>
		
			<table border=0 class="replylist">
			<c:forEach items = "${alllist}" var = "vo">
				<tr>
					<td>${vo.trcontent}</td>
					<td>${vo.name}</td>
					<td>${vo.trdate}</td>
				</tr>
			</c:forEach>
			</table>
			<form name="talk_replyform" action="talk_reply_controller.do" method="post">
			<table border=0 class="replywrite">
				<tr>
					<td>
						<input type="text" name="name">
					</td>
					<td>
						<textarea class="trcontent" name="trcontent" style="resize:none;">
						</textarea>
					</td>
					<td>
						<input type="hidden" id="reply-write-check" value="hide">
						<button type="submit" id="reply-write" >���</button>
					</td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	<jsp:include page ="../footer.jsp"/>
	
</body>
</html>