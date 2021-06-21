<%@page import="faq.FaqDBBean"%>
<%@page import="faq.FaqBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String u_id = "";
	
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	} else {
		response.sendRedirect("faq.jsp");
	}
	
	int f_num = 0;
	
	if (request.getParameter("f_num") != null) {
		f_num = Integer.parseInt(request.getParameter("f_num"));
	}
	
	FaqDBBean db = FaqDBBean.getInstance();
	FaqBean faq = db.getBoard(f_num, false);
	
	if(!u_id.equals(faq.getU_id())) {
%>
	<script>
			history.go(-1);
	</script>
<%
	}
	/*--pageNum값 받기--*/
	String pageNum = request.getParameter("pageNum");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="faq.js" charset="utf-8"></script>
	<link rel="stylesheet" href="board.css" type="text/css">
	<link rel="stylesheet" href="faq.css" type="text/css">
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

					<% 
        	if(u_id==null){
        %>
					<li><a href="Login.jsp">LOGIN</a></li>
					<%  
        	}else{
        %>
					<li><a href="Main.jsp">HOME</a></li>
					<% 
        	}
        %>
					<li><a href="#">JOIN</a></li>
					<li><a href="mypage.jsp">MY PAGE</a></li>
					<li><a href="cart.html">CART</a></li>
				</ul>
			</div>

			<div class="logo">
				<img src="images/pinterest_profile_image.jpg" alt="">
			</div>
	</div>
	<div id="nav">
		<div class="menu">
			<ul class="myMenu">
				<li class="menu1"><p>
						<a href="notice.jsp">공지사항</a>
					</p></li>
				<li class="menu2"><p>
						<a href="faq.jsp">F A Q</a>
					</p></li>
				<li class="menu3"><p>
						<a href="qna.jsp">Q & A</a>
					</p></li>
				<li class="menu4"><p>
						<a href="review.jsp">후 기 </a>
					</p></li>
			</ul>
		</div>
	</div>
</header>
</div>
	
	<center>
		<form action="f_write_ok.jsp?u_id=<%= u_id %>&f_num=<%= f_num %>" method="post">
			<table>
				<tr>
					<td>글제목</td>
					<td colspan="3">
						<input type="text" value="<%= faq.getF_title() %>" class="title">
					</td>
				</tr>
				<tr>
					<td>글분류</td>
					<td><input type="text" size="30"
						value="<%= faq.getF_category() %>"></td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="5" cols="70">
							<%= faq.getF_content() %>
						</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<div class="e_button">
							<input type="button" value="수정하기" onclick="write_ok()">&nbsp; 
							<input type="reset" value="다시작성">&nbsp;
							<input type="button" value="목록으로" onclick="location.href='faq.jsp?u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
						</div>
					</td>
				</tr>
			</table>
		</form>
	</center>

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

</body>
</html>