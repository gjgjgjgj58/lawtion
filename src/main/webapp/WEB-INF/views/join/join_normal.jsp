<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="http://localhost:9000/lawtion/css/lawtion.css">
<title>Insert title here</title>
<script src="http://localhost:9000/lawtion/js/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("#join_bt").click(function(){
			if($("#name").val()==""){
				alert("�̸��� �Է����ּ���.");
				$("#name").focus();
				return false;
			}else if($("#birth1").val()==""){
				alert("��������� �Է����ּ���.")
				$("#birth1").focus();
				return false;
			}else if($("#phone1").val()==""){
				alert("�ڵ�����ȣ�� �Է����ּ���.")
				$("#phone1").focus();
				return false;
			}else if($("#phone2").val()==""){
				alert("�ڵ�����ȣ�� �Է����ּ���.")
				$("#phone2").focus();
				return false;
			}else if($("#phone3").val()==""){
				alert("�ڵ�����ȣ�� �Է����ּ���.")
				$("#phone3").focus();
				return false;
			}else if($("#birth2").val()==""){
				alert("��������� �Է����ּ���.")
				$("#birth2").focus();
				return false;
			}else if($("#birth3").val()==""){
				alert("��������� �Է����ּ���.")
				$("#birth3").focus();
				return false;
			}else if($("#email").val()==""){
				alert("��������� �Է����ּ���.")
				$("#email").focus();
				return false;
			}else if($("#id").val()==""){
				alert("id�� �Է����ּ���.")
				$("#id").focus();
				return false;
			}else if($("#pass").val()==""){
				alert("��й�ȣ�� �Է����ּ���.")
				$("#pass").focus();
				return false;
			}else if($("#passCheck").val()==""){
				alert("��й�ȣ Ȯ�����ּ���.")
				$("#passCheck").focus();
				return false;
			}
			memberInfo.submit();
			
		});
		$("#passCheck").focusout(function(){
			if($("#pass").val()==""){
				alert("��й�ȣ�� �Է����ּ���");
				$("#pass").focus();
				return false;
			}else{
				if($("passCheck").val()!=""){
					if($("#pass").val()==$("#passCheck").val()){
						$("#msg").css("font-size","9pt").css("color","blue").css("display","block");
						$("#msg").text("��й�ȣ�� �����մϴ�.");
						return false;
					}else {
						$("#msg").css("font-size","9pt").css("color","red").css("display","block");
						$("#msg").text("��й�ȣ�� Ʋ���ϴ�.");
						$("#pass").val("").focus();
						$("#passCheck").val("");
						return false;
					}
				}
			}
				
		});
	});
	
</script>
</head>
	<jsp:include page ="../header1.jsp"/>
<body>
	<p><div class="review-title">
		<div class="title-sub">
			<img src="http://localhost:9000/lawtion/images/jointitle.jpg" width="500" height="100" class="title">
		</div>	
	</div>
	<h1 class="joinPage">LAWTION ȸ������</h1>
	<hr class="joinHr">
	<p>
	<div class="join_process">
	������� > <a class="join_tag">�����Է� ></a> ���ԿϷ�
	</div>
	<p>
	<div class="normalForm">
	<h4 class="join_h4">ȸ���� ����</h4>
		<form name="memberInfo" action="join_check.do" method="post">
			<ul>
				<li>
					<label>ȸ���� ����</label>
					<p>
					<input type="text" name="name" id="name">
				</li>					
				<li>
					<p><br>
					<label>�������</label>
					<p>
						<select name="years" id="birth1">
							<option value="year">����</option>
							<option value="1992">1992</option>
							<option value="1993">1993</option>
							<option value="1994">1994</option>
						</select>
						<select name="months"id="birth2">
							<option value="month">��</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
						<select name="days" id="birth3">
							<option value="day">��</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
				</li>
				<li>
					<p><br>
					<label>�޴��� ��ȣ</label>
					<p>
					<select name="phone1" id="phone1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="017">017</option>
					</select>
					-<input type="text" name="phone2" class="phone" id="phone2">
					-<input type="text" name="phone3" class="phone" id="phone3">
					<p>
					<button type="button">���� ����</button>
				</li>
				<li>
					<p><br>
					<label>�̸���</label>
					<p>
					<input type="text" name="email" placeholder="Email�ּ� ��ü�� �Է����ּ���." id="email">
				</li>
			</ul>
			<p><br>
		<h4>���� ����</h4>
			<ul>
				<li>
					<label>���̵�</label>
					<p>
					<input type="text" name="id" id="id">
				</li>
				<p>
				<li>
					<label>�н�����</label>
					<p>
					<input type="password" name="password" id="pass">
				</li>
				<p>
				<li>
					<label>�н����� Ȯ��</label>
					<p>
					<input type="password" name="passCheck" id="passCheck">
					<span id="msg"></span>
				</li>
				<li class="note">
					��й�ȣ�� ����, ����, Ư�����ڸ� ȥ���Ͽ� ����ø� ���� �����մϴ�.
					����, ��ȭ��ȣ�� ���� ��ȣ�� ���ӵ� ���ڿ��� �������� �ʽ��ϴ�.
				</li>
				<li>
					<p><br>
					<button type="button" id="join_bt">ȸ�� ����</button>
				</li>
			</ul>
		</form>
	</div>
	<p><br>
<hr class="joinHr">
	<p><br>

</body>
	<jsp:include page ="../footer.jsp"/>
</html>