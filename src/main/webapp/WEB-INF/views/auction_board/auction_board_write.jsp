<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	select{height:24px;}
</style>
</head>
<body>
<jsp:include page="../header1.jsp" /><!-- ..�� ������ ���������� ���� �ǹ��Ѵ�. "http://localhost:9000/lawtion/images/hehe.png"-->
<p><div class="review-title">
	<div class="title-sub">
		<img src="http://localhost:9000/lawtion/images/actiontitle.jpg" width="500" height="100" class="title">
	</div>	
</div>
	<div class="auction_content">
			<section class="auction_style">
				<br><br>
				<form name="boardForm" action="auction_board_check.do" method="post" class="auction_board_write">
				<table class="auction_table_write">
					<tr><th colspan="2"></th></tr>
					<tr>
						<td>ī�װ�</td>
						<td>
						<select name="category" id="category">
							<option value="ex1">�λ�</option>
							<option value="ex2">����</option>
						</select>
						</td>
					</tr>
					<tr>
						<td>�����Ͻ�</td>
						<td><input type="date" class="abw_edate" name="edate" id="edate" value="${dl.tm}" min="${dl.tm}" max="${dl.maxtm}"><br>*�����Ͻô� �ּ� �ۼ��Ϸκ��� 24�ð� �����Դϴ�. �ִ� 3�ֱ��� �����մϴ�.</td>
					</tr>
					<tr>
						<td>����</td>
						<td>
						<select name="area" id="area">
							<option value="1">����</option>
							<option value="2">���</option>
						</select>
						</td>
					</tr>
					<tr>
						<td>�ۼ���</td>
						<td><input type="text" class="abw_name" name="name" id="name" disabled></td>
					</tr>
					<tr>
						<td>����</td>
						<td><input type="text" class="abw_title" name="title" id="title"></td>
					</tr>
					<tr>
						<td>����</td>
						<td>
						<textarea rows="15" cols="60" name="content" placeholder="����, ���۱� ħ��, ��ȸ��, û�ҳ� ���ع�, ��Ÿ ���� �ڷ�, ������� ���� �Խ��ϸ� �ش� �Խù��� ��� ���� �����Ǹ�, �Խ��ڴ� ������ ���� ¡���� �Ǵ� �������� ó���� �� �ֽ��ϴ�.
						
�ۼ��Ǵ� ���� ������ �ִ� 1MB ���� �ۼ� �����մϴ�."></textarea></td>
					</tr>
					<tr>
						<td>÷������</td>
						<td><input type="file" name="fname"></td>
					</tr>
					<tr>
						<td>��������</td>
						<td><input type="checkbox" name="agree" id="agree" class="agree-checkbox"><span>üũ�Ͻø� �Ϲ� ȸ���鵵 ������ �����մϴ�.</span></td>
					</tr>
					
				
				
				<!-- <form name="boardform" action="#" method="post">
				<ul>
					<li>
						<label>����</label>
						<input type="text" name="title">				
					</li>
					<li>
						<label>����</label>
						<textarea rows="10" cols="50"></textarea>
					</li>
					<li>
						<label>÷������</label>
						<input type="file" name="fname">
					</li>
					<li>
						
						<button type="button">�Ϸ�</button>
						<button type="reset">���</button>
						<a href="http://localhost:9000/mycgv/board/board_content.jsp"><button type="button">���� ������</button></a>
						<a href="http://localhost:9000/mycgv/board/board_list.jsp"><button type="button">��ü ����Ʈ</button></a>
						
					</li>
				</ul>
				</form> -->
				
				
				
				<tr>
					<td colspan="2" class="abw_success">
						<button>�Ϸ�</button>
						<a href="auction_board.do"><button type="button">���</button></a>
					</td>
				</tr>
			</table>	
			</form>
			<br><br><br><br>
			</section>
		</div>
		
		<jsp:include page="../footer.jsp" /><!-- ..�� ������ ���������� ���� �ǹ��Ѵ�. -->
	</body>
</html>