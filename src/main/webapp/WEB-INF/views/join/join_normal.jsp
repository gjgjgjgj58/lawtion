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
				alert("이름을 입력해주세요.");
				$("#name").focus();
				return false;
			}else if($("#birth1").val()==""){
				alert("생년월일을 입력해주세요.")
				$("#birth1").focus();
				return false;
			}else if($("#phone1").val()==""){
				alert("핸드폰번호를 입력해주세요.")
				$("#phone1").focus();
				return false;
			}else if($("#phone2").val()==""){
				alert("핸드폰번호를 입력해주세요.")
				$("#phone2").focus();
				return false;
			}else if($("#phone3").val()==""){
				alert("핸드폰번호를 입력해주세요.")
				$("#phone3").focus();
				return false;
			}else if($("#birth2").val()==""){
				alert("생년월일을 입력해주세요.")
				$("#birth2").focus();
				return false;
			}else if($("#birth3").val()==""){
				alert("생년월일을 입력해주세요.")
				$("#birth3").focus();
				return false;
			}else if($("#email").val()==""){
				alert("생년월일을 입력해주세요.")
				$("#email").focus();
				return false;
			}else if($("#id").val()==""){
				alert("id를 입력해주세요.")
				$("#id").focus();
				return false;
			}else if($("#pass").val()==""){
				alert("비밀번호를 입력해주세요.")
				$("#pass").focus();
				return false;
			}else if($("#passCheck").val()==""){
				alert("비밀번호 확인해주세요.")
				$("#passCheck").focus();
				return false;
			}
			memberInfo.submit();
			
		});
		$("#passCheck").focusout(function(){
			if($("#pass").val()==""){
				alert("비밀번호를 입력해주세요");
				$("#pass").focus();
				return false;
			}else{
				if($("passCheck").val()!=""){
					if($("#pass").val()==$("#passCheck").val()){
						$("#msg").css("font-size","9pt").css("color","blue").css("display","block");
						$("#msg").text("비밀번호가 동일합니다.");
						return false;
					}else {
						$("#msg").css("font-size","9pt").css("color","red").css("display","block");
						$("#msg").text("비밀번호가 틀립니다.");
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
	<h1 class="joinPage">LAWTION 회원가입</h1>
	<hr class="joinHr">
	<p>
	<div class="join_process">
	약관동의 > <a class="join_tag">정보입력 ></a> 가입완료
	</div>
	<p>
	<div class="normalForm">
	<h4 class="join_h4">회원님 정보</h4>
		<form name="memberInfo" action="join_check.do" method="post">
			<ul>
				<li>
					<label>회원님 성함</label>
					<p>
					<input type="text" name="name" id="name">
				</li>					
				<li>
					<p><br>
					<label>생년월일</label>
					<p>
						<select name="years" id="birth1">
							<option value="year">연도</option>
							<option value="1992">1992</option>
							<option value="1993">1993</option>
							<option value="1994">1994</option>
						</select>
						<select name="months"id="birth2">
							<option value="month">월</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
						<select name="days" id="birth3">
							<option value="day">일</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
				</li>
				<li>
					<p><br>
					<label>휴대폰 번호</label>
					<p>
					<select name="phone1" id="phone1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="017">017</option>
					</select>
					-<input type="text" name="phone2" class="phone" id="phone2">
					-<input type="text" name="phone3" class="phone" id="phone3">
					<p>
					<button type="button">본인 인증</button>
				</li>
				<li>
					<p><br>
					<label>이메일</label>
					<p>
					<input type="text" name="email" placeholder="Email주소 전체를 입력해주세요." id="email">
				</li>
			</ul>
			<p><br>
		<h4>계정 정보</h4>
			<ul>
				<li>
					<label>아이디</label>
					<p>
					<input type="text" name="id" id="id">
				</li>
				<p>
				<li>
					<label>패스워드</label>
					<p>
					<input type="password" name="password" id="pass">
				</li>
				<p>
				<li>
					<label>패스워드 확인</label>
					<p>
					<input type="password" name="passCheck" id="passCheck">
					<span id="msg"></span>
				</li>
				<li class="note">
					비밀번호는 영문, 숫자, 특수문자를 혼합하여 만드시면 보다 안전합니다.
					계정, 전화번호와 같은 번호나 연속된 문자열은 권장하지 않습니다.
				</li>
				<li>
					<p><br>
					<button type="button" id="join_bt">회원 가입</button>
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