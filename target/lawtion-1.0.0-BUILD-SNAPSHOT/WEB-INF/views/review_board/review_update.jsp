<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  import="lawtion.vo.ReviewBoardVO, lawtion.dao.ReviewBoardDAO, java.util.*"%>
<%
   String no = request.getParameter("no");
   String rno = request.getParameter("rno");
   ReviewBoardDAO dao = new ReviewBoardDAO();   
   ReviewBoardVO vo = dao.getResultVO(no);
   dao.closed();
%>
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
<script src="../write_resource/ckeditor.js"></script>
<link rel="stylesheet" href="write_resource/samples/sample.css">

<script>	
	$(document).ready(function(){
		$("#btnupdate").click(function(){
			if($("#title").val()==""){
				alert("������ �Է����ּ���.");
				$("title").focus();
				return false;
			}else if ($.trim($("#contents").val(CKEDITOR.instances['contents'].getData()))==""){
				alert("������ �Է����ּ���");
				$("content").focus();
				return false;
			}else if($("#category").val()=="����"	){
				alert("ī�װ��� �������ּ���.");
				return false;
			}else if($("#lawsuit").val()==""){
				alert("�Ҽ۸��� �Է����ּ���");
				$("lawsuit").focus();
			}
			boardForm.submit();
			});
		
	});
</script>
<script>
	CKEDITOR.config.width=790;
	CKEDITOR.config.height=500;
	CKEDITOR.replace('content',{
		filebrowserImageUploadUrl:"ckeditor/plugins/imgupload.php"
	});
</script>
</head>
<body>
	<jsp:include page ="../header.jsp"/>
	<div class="review">
		<div class="review-title">
			<img src="http://localhost:9000/lawtion/images/talktitle.PNG" width="200" height="60" class="title">
		</div>
		<nav class="review-select">
			<div class="select">
				<ul>
					<li class="select1"><a href="review_board_list.jsp">��ü</a></li>
					<li class="select2"><a href="review_board_list_action.jsp">�����</a></li>
					<li class="select2"><a href="review_board_list_lawtion.jsp">Lawtion�ı�</a></li>
				</ul>
			</div>
		</nav>
		<div class="write-title">
			<img src ="http://localhost:9000/lawtion/images/write.png" width="40" height="40">
			<label>�ı� �ۼ�</label>
		</div>
		<div class="write">
			<form name="writeForm" action="review_update_controller.jsp" method="post">
				<table  class="review-Write">
					<tr>
						<td>
							<label>�۾���</label>
							<input type ="text"	name="name" value="hyeona" disabled>
						</td>
						<td>
							<label>ī�װ�</label>
							<select class="category" name ="category" id="category">
								<option value="����">����</option>
								<option value="����� �ı�">����� �ı�</option>
								<option value="Lawtion �ı�">Lawtion �ı�</option>
							</select>
						</td>
						<td>
							<label>��纯ȣ��</label>
							<input type="text" id="lawyersearch" class="lawyersearch" name ="lawyer"  disabled="disabled" value="">
		                    <a href='http://localhost:9000/lawtion/review_board/lawyer_search.jsp' onclick="window.open(this.href,'�˾�â','width=400, height=500'); return false;">
		                    	<img src="http://localhost:9000/lawtion/images/lawyerfind.jpg" width="28" height="27"></a>
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<label>����</label>
							<input type ="text" name="title" id="title" value="<%=vo.getTitle()%>" >
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<label>�Ҽ۸�</label>
							<input type ="text" name="lawsuit" id="lawsuit" value="<%=vo.getLawsuit()%>">
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<label>����</label>
							<textarea class="ckeditor" id="content" cols="5" name="content" rows="200"><%=vo.getContent()%></textarea>
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<label>÷������</label>
							<input type ="file" name="fname" id="fname" value="<%=vo.getFname()%>">
						</td>
					</tr>
					<tr>
						<td colspan=3>
							<div class="write_button">
								<input type="hidden" name="no" value="<%=no%>" >
								<button type="submit" id="btnupdate" name="btnupdate">�����Ϸ�</button>
								<button type="reset" name="reset">���</button>
								<a href="review_board_content.jsp?no=<%=no %>&rno=<%=rno%>"><button type="button">���� ������</button></a>
							</div>
						</td>
					</tr>
				</table>	
			</form>
		</div>
	</div>
	<jsp:include page ="../footer.jsp"/>
	
</body>
</html>