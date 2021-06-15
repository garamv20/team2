<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
 <link rel="stylesheet" href="login.css">
<body>
 <header>
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        
        &nbsp;
          	포트폴리오 쇼핑몰
        <div id="loginArea">
         <ul>
           <li><a href="exMain.jsp">Home</a></li>
           <li><a href="Login.jsp">LogIn</a></li>
           <li><a href="">SignUp</a></li>
           <li><a href="">Cart</a></li>
         </ul>
        </div>
       </header>
    <div class="main">
        <p class="sign" align="center">쇼핑몰 로그인 페이지</p>
        
        <form class="form1" name="form" id="form" method="post" action="login_ok.jsp">
          <input class="un " type="text" align="center" placeholder="ID를 입력해 주세요 " name="u_id" id="u_id">
          <input class="pass" type="password" align="center" placeholder="Password를 입력해 주세요" name="u_pwd" id="u_pwd">
          <a class="submit" align="center" onClick="click_login()">로그인</a>
          <p class="forgot" align="center"><a href="#">비밀번호찾기  </a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">가입 하기</a> </p>
          </form>
        </div>
                    
        <footer> GreenAcademy 2021-06-02 by Team2 </footer>
<script>
function click_login(){
	if(form.u_id.value == ""){
		form.u_id.focus();
		alert("아이디를 입력하세요.");
		return;
	}
	if(form.u_pwd.value == ""){
		form.u_pwd.focus();
		alert("비밀번호를 입력하세요.");
		return;
	}
	form.submit();
}
</script>
</body>
</html>