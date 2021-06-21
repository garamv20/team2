<%@page import="notice.NoticeDBBean"%>
<%@page import="notice.NoticeBean"%>
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
	
	int n_num = 0;
	
	if (request.getParameter("n_num") != null) {
		n_num = Integer.parseInt(request.getParameter("n_num"));
	}
	
	//해당 글 작성자 
	String con_id = "";
	if(request.getParameter("n_id") != null) {
		con_id = request.getParameter("n_id");
	}
	System.out.println(u_id + "   u_id");
	System.out.println(con_id+"   con_id");
	
	NoticeDBBean db = NoticeDBBean.getInstance();
	NoticeBean nb = null;
	
	if(u_id.equals(con_id)) {
		nb = db.getBoard(n_num,false);
	} else {
		nb = db.getBoard(n_num,true);
	}
	
	//관리자
	int re = db.confirmManager(u_id);
	
	String n_title = "", n_content = "", n_id="";
	
	if ((nb) != null) {
		n_title = nb.getN_title();
		n_content = nb.getN_content();
		n_id = nb.getU_id();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script src="https://kit.fontawesome.com/60f6a26247.js"crossorigin="anonymous"></script>
	<link rel="stylesheet" href="board.css" type="text/css">
	<link rel="stylesheet" href="notice.css" type="text/css">
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
					<!--   로그인 상태는 > HOME 
       		 비로그인 상태는 > LOGIN 보이게  -->
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
		<P>
			<h1>공 지 사 항</h1>
		</P>
		
<div id="s_list">		
	<form method="post" action="n_delete_ok.jsp?n_num=<%= n_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>" name="show_frm">
		<table>
			<tr>
				<td>제목  <%= n_title %></td>
			</tr>

			<tr>
				<td>내용   <%= n_content %></td>
			</tr>
			
			<tr>
				<td>
						<div class="s_button">
			<% 
                	if( re == 0 ) {
            %>
				<input type="button" value="수정" onclick="location.href='n_edit.jsp?n_num=<%= n_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
							&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="button" value="삭제" onclick="delete_ok()"> &nbsp;&nbsp;&nbsp;&nbsp;
			<%
                	}
          	%>
				<input type="button" value="목록으로" onclick="location.href='notice.jsp?u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
			</div>
				
				</td>
			</tr>
		</table>
		
			<br>
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