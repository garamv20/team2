<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="notice.NoticeBean"%>
<%@page import="notice.NoticeDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String u_id = "";
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	}
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
	}
	
	NoticeDBBean db = NoticeDBBean.getInstance();
	ArrayList<NoticeBean> noticeList = db.listBoard(pageNum);
	
	//관리자는 0
	int re = db.confirmManager(u_id);
	
	int n_num = 0;
	String n_title = "", n_content = "", n_id="";
	Timestamp n_date = null;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script src="https://kit.fontawesome.com/60f6a26247.js" crossorigin="anonymous"></script>
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

<form method="post" action="" name="list_frm">
		<P>	<center>
			<h1>공 지 사 항</h1>
			<h4>MOODON 고객님들께 알려드리는 공지사항입니다.</h4></center>
		</P>

<div id="list">
	<div class="write_button">
		<%
        if(re == 0) { 
    %>
		<input type="button" value="글쓰기">
		<%
         } else {
    %>
		<input type="button" value="글쓰기" onclick="location.href='n_write.jsp?u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
		<%
          }
    %>
    </div>
	<table>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>날짜</td>
			</tr>
		<%
                	for(int i = 0; i < noticeList.size(); i++) {
                			NoticeBean nb = noticeList.get(i);
                			n_num = nb.getN_num();
                			n_title = nb.getN_title();
                			n_content = nb.getN_content();
                			n_date = nb.getN_date();
                			n_id = nb.getU_id();
         %>
			<tr>
				<td><%= n_num %></td>
				<td><a href='n_show.jsp?n_id=<%= n_id %>&n_num=<%= n_num %>&pageNum=<%= pageNum %>'><%= n_title %></a></td>
				<td><%= n_id %></td>
				<td><%= sdf.format(n_date) %></td>
			</tr>
		<%
                	}
         %>
		</table>
</form>
		<br>
		<br>
		<div class="page">
			<%= NoticeBean.pageNumber(5, u_id) %>
		</div>
	</div>

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