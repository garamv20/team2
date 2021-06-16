<%@page import="java.net.URLDecoder"%>
<%@page import="myUtil.HanConv"%>
<%@page import="user.UserBean"%>
<%@page import="user.UserDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<title>Document</title>
<link rel="stylesheet" href="mypage.css">
 <link rel="preconnect" href="https://fonts.gstatic.com">
 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">  
<script src="https://kit.fontawesome.com/60f6a26247.js" crossorigin="anonymous"></script>
<%

Cookie[] c = request.getCookies();
if (c != null) {
	for (Cookie cf : c) {
		if (cf.getName().equals("id")){
			String ids = URLDecoder.decode(cf.getValue(),"UTF-8");
			session.setAttribute("id", ids);
			
			
		}
	}
}

// 세션값 가져오기
String id = (String) session.getAttribute("id"); // Object 타입이므로 다운캐스팅





	
	if (id == null) {//로그아웃후에 main페이지로 주소값을 입력해도 접속되지않게 방지 (로그인페이지호출)
%>
<jsp:forward page="Login.jsp"></jsp:forward>
<%
}
//사용자의 정보를 받아올 변수 
String u_name = "", u_id = "", u_pwd = "", u_tel = "", u_jumin = "", u_address = "",u_email="", u_grade = "";
int point = 0;
 UserDBBean db = UserDBBean.getInstance();
 UserBean user = db.getUser(id);
 
	u_name =user.getU_name();
	u_id =user.getU_id();
	u_pwd =user.getU_pw();
	u_tel =user.getU_phone();
	u_jumin =user.getU_jumin();
	u_email = user.getU_email();
	u_address =user.getU_address();
	point =user.getU_point();
	u_grade =user.getU_grade();
	
	//전화번호 하이픈넣기 
	String telFormat="";
	for(int i=0; i<u_tel.length();i++){
		switch(i){
		case 0 : telFormat+=u_tel.charAt(0);continue;
		case 1 : telFormat+=u_tel.charAt(1);continue;
		case 2 : telFormat+=u_tel.charAt(2);continue;
		case 3 : telFormat+="-"+u_tel.charAt(3);continue;
		case 4 : telFormat+=u_tel.charAt(4);continue;
		case 5 : telFormat+=u_tel.charAt(5);continue;
		case 6 : telFormat+=u_tel.charAt(6);continue;
		case 7 : telFormat+="-"+u_tel.charAt(7);continue;
		case 8 : telFormat+=u_tel.charAt(8);continue;
		case 9 : telFormat+=u_tel.charAt(9);continue;
		case 10 : telFormat+=u_tel.charAt(10);continue;
		case 11 : telFormat+=u_tel.charAt(11);
		}
		 
	}
	
	//이메일 과 주소 없으면 없다고 표시 
	if(u_email==null){
		u_email="아직 이메일이 등록이 되지 않았습니다.";
	}
	if(u_address.equals("null")){
		u_address="아직 주소가 등록 되지 않았습니다.";
	}
	
	//주민등록번호를 숨겨서 보여준다 뒷자리 만 숨기면될듯?
	String hideJumin = "";
	for(int i=0;i<u_jumin.length();i++){
		if(i<6){hideJumin+=u_jumin.charAt(i);}
		if(i==6){hideJumin+=" - *";}
		if(i>=7){hideJumin+="*";}
	}
	
%>


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
			<div id="nav">
				<div class="menu">
					<ul class="myMenu">
						<li class="menu1"><p>
								<a href="#">My Cart </a>
							</p>
							<ul class="menu1 submenu">
								<li><p>
										<a href="#">장바구니</a>
									</p></li>
								<li><p>
										<a href="#">결제내역</a>
									</p></li>
							</ul></li>
						<li class="menu2"><p><a href="#">회원정보 수정</a></p>
							<ul class="menu2 submenu">
								<li><p><a href="change_pw.jsp?u_id=<%=u_id %>">비밀번호 수정</a></p></li>
								<li><p><a href="#">Email 주소 등록하기</a></p></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>

		</header>

	
		<br>
		<br>
		<br>
		<center>
			
			<!-- 회원정보 보여주기 나중에 장바구니 jsp 연결할 부분  -->
			<%=u_name%>님 안녕하세요! <br>
			<br>
			<br>
			<table class="type09">
  <thead>
  <tr>
   
    <th scope="cols">내정보 확인하기</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <th scope="row">ID</th>
    <td><%=u_id %></td>
  </tr>
  <%-- <tr>
    <th scope="row">비밀번호</th>
    <td><%=u_pwd %></td>
  </tr> --%>
  <tr>
    <th scope="row">전화번호</th>
    <td><%=telFormat %></td>
  </tr>
  <tr>
    <th scope="row">주민번호</th>
    <td><%=hideJumin %></td>
  </tr>
  <tr>
    <th scope="row">email</th>
    <td><%=u_email %></td>
  </tr>
  <tr>
    <th scope="row">주소</th>
    <td><%=u_address %></td>
  </tr>
  <tr>
    <th scope="row">포인트</th>
    <td><%=point %></td>
  </tr>
  <tr>
    <th scope="row">등급</th>
    <td><%=u_grade %></td>
  </tr>
  </tbody>
</table>
			<br>
			<br>
			<br>
			<p  class="logout"> <a href="logout_ok.jsp">로그아웃 하기 </a> </p>
			
		</center>
			<br>
			<br>
			<br>

		<div class="clear"></div>
		<footer>
			<div class="info1">
				<li>
					<h3>about us</h3>
					<p>company: MOODON</p>
					<p>business no: 123-45-67890</p>
					<p>tel. 02-1111-1111</p>
					<p>address: 부산광역시 그린구 그린로 123</p>
					<p>
						<i>Copyright. MOODON all rights reserved.</i>
					</p>
				</li>
				<li>
					<h3>C/S CENTER</h3>
					<p>
						<strong>02-1111-1111</strong>
					</p>
					<p>mon-fri pm1:00~pm6:00</p>
					<p>sat, sun, holiday off</p>
				</li>
			</div>
		</footer>
	</div>

</body>
</html>