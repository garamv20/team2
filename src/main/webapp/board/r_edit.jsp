<%@page import="comment.CommentBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="review.ReviewDBBean"%>
<%@page import="review.ReviewBean"%>
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
	
	int r_num = 0;
	
	if (request.getParameter("r_num") != null) {
		r_num = Integer.parseInt(request.getParameter("r_num"));
	}
	
	String con_id = "";
	if(request.getParameter("ht_id") != null) {
		con_id = request.getParameter("ht_id");
	}
	System.out.println(u_id);
	System.out.println(con_id);
	
	ReviewDBBean db = ReviewDBBean.getInstance();
	ReviewBean rb = null;
	
	if(u_id.equals(con_id)) {
		rb = db.getBoard(r_num, false);
	} else {
		rb = db.getBoard(r_num, true);
	}
	
	int re = db.confirmManager(u_id);
	
	String r_title = "", r_content = "", r_id = "";
	int r_hit = 0;
	Timestamp r_date = null;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	if (rb != null) {
		r_title = rb.getR_title();
		r_content = rb.getR_content();
		r_id = rb.getU_id();
		r_hit = rb.getR_hit();
		r_date = rb.getR_date();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link rel="stylesheet" href="board.css" type="text/css">
	<link rel="stylesheet" href="review.css" type="text/css">
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
		<h1>글 수 정 하 기</h1>
		<form name="form" action="edit_ok.jsp?u_id=<%= u_id %>&r_num=<%= r_num %>" method="post">
			<table>
				<tr>
					<td colspan="2"> 제  목 <input type="text" name="" class="title"> </td>
						
				</tr>
				<tr>
					<td>상품명   <input type="text" name="" size="30" class="title"></td>
						
					<td>
						<div class="rating">
							<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
							<input type="checkbox" name="rating" id="rating1" value="1"
								class="rate_radio" title="1점"> <label for="rating1"></label>
							<input type="checkbox" name="rating" id="rating2" value="2"
								class="rate_radio" title="2점"> <label for="rating2"></label>
							<input type="checkbox" name="rating" id="rating3" value="3"
								class="rate_radio" title="3점"> <label for="rating3"></label>
							<input type="checkbox" name="rating" id="rating4" value="4"
								class="rate_radio" title="4점"> <label for="rating4"></label>
							<input type="checkbox" name="rating" id="rating5" value="5"
								class="rate_radio" title="5점"> <label for="rating5"></label>
					</td>
				</tr>
				<tr>
					<td>사진</td>
					<td>
						<input type="file" name="">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea rows="15" cols="150"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<div class="e_button">
							<input type="button" value="수정" onclick="">&nbsp;
							<input type="reset" value="다시작성">&nbsp;
							<input type="button" value="목록으로" onclick="location.href='review.jsp?u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
						</div>
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