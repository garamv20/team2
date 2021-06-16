<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="findPw.css">
 <link rel="preconnect" href="https://fonts.gstatic.com">
 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">  
 <script src="https://kit.fontawesome.com/60f6a26247.js" crossorigin="anonymous"></script>
</head>
<body>
<div id="wrap">
    <header>
      <div class="top">
        <div class="top__search">
          <li><input type="text"></li>
          <li><a href=""><i class="fas fa-search"></i></a></li>
        </div>
        <ul class="top__list">
          <li><a href="Main.jsp">HOME</a></li>
          <li><a href="">JOIN</a></li>
          <li><a href="mypage.jsp">MY PAGE</a></li>
          <li><a href="cart.html">CART</a></li>
        </ul>
      </div>

      <div class="logo">
        <img src="images/pinterest_profile_image.jpg" alt="">
      </div>
    </header>
    <div class="main">
        <p class="sign" align="center">비밀번호 찾기 </p>
        
        <form class="form1" name="form" id="form" method="post" action="findPw_ok.jsp">
          <input class="un " type="text" align="center" placeholder="ID를 입력해 주세요 " name="u_id" id="u_id">
          <input class="pass" type="text" align="center" placeholder="이름을 입력해 주세요" name="u_name" id="u_name">
          <a class="submit" align="center" onClick="check()">확인</a> <br>            
          <p class="forgot" align="center">
     
          </p>
          </form>
        </div>
                    
        <footer>
      <div class="info1"> 
        <li>
          <h3>about us</h3>
          <p>company: MOODON</p>
          <p>business no: 123-45-67890</p>
          <p>tel. 02-1111-1111</p>
          <p>address: 부산광역시 그린구 그린로 123</p>
          <p><i>Copyright. MOODON all rights reserved.</i></p>
        </li>
        <li>
          <h3>C/S CENTER</h3>
          <p><strong>02-1111-1111</strong></p>
          <p>mon-fri pm1:00~pm6:00</p>
          <p>sat, sun, holiday off</p>
        </li>

      </div>
    </footer>
    </div>
    <script>
function check(){
	if(form.u_id.value == ""){
		form.u_id.focus();
		alert("아이디를 입력하세요.");
		return;
	}
	if(form.u_name.value == ""){
		form.u_name.focus();
		alert("이름을  입력하세요.");
		return;
	}
	form.submit();
}
</script>
</body>
</html>