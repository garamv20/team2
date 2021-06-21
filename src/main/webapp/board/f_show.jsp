<%@page import="java.util.ArrayList"%>
<%@page import="faq.FaqDBBean"%>
<%@page import="faq.FaqBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String u_id = "";
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	}
	
	String pageNum = "";
	
	if(request.getParameter("pageNum") != null) {
		pageNum = request.getParameter("pageNum");
	} else {
		pageNum = "1";
	}
	
	int f_num = 0;
	
	if (request.getParameter("f_num") != null) {
		f_num = Integer.parseInt(request.getParameter("f_num"));
	}
	
	//해당 글 작성자 
	String con_id = "";
	if(request.getParameter("f_id") != null) {
		con_id = request.getParameter("f_id");
	}
	System.out.println(u_id + "   u_id");
	System.out.println(con_id + "   con_id");
	
	FaqDBBean db = FaqDBBean.getInstance();
	FaqBean fb = null;
	
	if(u_id.equals(con_id)) {
		fb = db.getBoard(f_num,false);
	} else {
		fb = db.getBoard(f_num,true);
	}
	
	//관리자
	int re = db.confirmManager(u_id);
	
	String f_title = "", f_content = "", f_id="", f_category="";
	
	if ((fb) != null) {
		f_title = fb.getF_title();
		f_content = fb.getF_content();
		f_category = fb.getF_category();
		f_id = fb.getU_id();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link rel="stylesheet" href="board.css" type="text/css">
	<link rel="stylesheet" href="faq.css" type="text/css">
	<script type="text/javascript" src="faq.js" charset="utf-8"></script>
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
		<p>
		<h1>F A Q</h1>
		</p>
		
<div id="s_list">		
	<form method="post" action="f_delete_ok.jsp?f_num=<%= f_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>"
			name="show_frm">
		<table>
			<tr>
				<td>제  목 <%= f_title %></td>
			</tr>
			<tr>
				<td>내  용   <%= f_content %></td>
			</tr>
			<tr>
				<td>
					<div class="s_button">
			<% 
                	if( re == 0 ) {
             %>
				<input type="button" value="수정" onclick="location.href='f_edit.jsp?f_num=<%= f_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
				&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="button" value="삭제" onclick="delete_ok()"> &nbsp;&nbsp;&nbsp;&nbsp;
			<%
             	  	}
          	 %>
				<input type="button" value="목록으로" onclick="location.href='faq.jsp?u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
			</div>
					</td>
				</tr>
			</table>
			<br>
	</form>
</div>
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