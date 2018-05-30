<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="http://localhost:9000/lawtion/css/lawtion.css">
<script src="http://localhost:9000/mycgv/js/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btnLogin").click(function(){
			
			if($("#id").val() == ""){
				alert("아이디를 입력하세요");
				$("#id").focus();
				return false;
			}else if($("#pass").val() == ""){
				alert("패스워드를 입력하세요");
				$("#pass").focus();
				return false;
			}
			
			loginForm.submit();	
		});
		
	});

</script>
<title>Insert title here</title>
</head>
	<jsp:include page ="../header1.jsp"/>
<body>
	<div class="logincontent">
		<h1 class="loginLogo">LAWTION</h1>
			<form name="loginForm" action="login_check.do" method="post">
					<ul>
						<li>
							<label class="login-label1">ID</label>
							<p class="p1">
							<input type="text" name="id" id="id">
						</li>
						<li>
							<label class="login-label1">PASSWORD</label>
							<p class="p1">
							<input type="password" name="password" id="pass">
						</li>
						<li>
							<label class="login-label2">아이디/비밀번호 찾기</label> 
						</li>
						<li>
							<p>
							<button type="button" id="btnLogin">LOGIN</button>
							<h3>or</h3>
							<a href="http://localhost:9000/lawtion/join_select.do"><button type="button">JOIN</button></a>
						</li>
					</ul>
			</form>
			
	</div>
</body>
	<jsp:include page ="../footer.jsp"/>
</html>