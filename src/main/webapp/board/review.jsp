<%@page import="java.util.ArrayList"%>
<%@page import="review.ReviewBean"%>
<%@page import="review.ReviewDBBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%

	String u_id = "";
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	}
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	ReviewDBBean db = ReviewDBBean.getInstance();
	ArrayList<ReviewBean> reviewList = db.listBoard(pageNum);
	
	/*관리자는 0*/
	int re = db.confirmManager(u_id);
	
	int r_num = 0, r_hit = 0, r_grade=0, item_num=0, r_like=0;
	String r_title = "", r_content = "", r_id="";
	Timestamp r_date = null;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/60f6a26247.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="board.css" type="text/css">
<link rel="stylesheet" href="review.css" type="text/css">
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
	<form method="post" action="" name="list_frm">	
		<p>
			<h2>후기 게시판</h2>
		</p>

		<p>
			<h3>이번 주 TOP3 후기</h3>
		</p>

		<table cellspacing="0">
			<tr>
				<td height="80" align="center"><img src="./images/shirts.jpg"
					style="max-width: 200px; height: 200px;"><br> 셔츠
				</td>
				<td height="80" align="center"><img src="./images/tshirts1.jpg"
					style="max-width: 200px; height: 200px;"><br> 카키색 셔츠
				</td>
				<td height="80" align="center"><img src="./images/pants.jpg"
					style="max-width: 200px; height: 200px;"><br> 바지
				</td>
			</tr>
		</table>

		<div id="list">

			<div class="write_button">
				<%
            		if(u_id.isEmpty()) { 
            	%>
						<input type="button" value="글쓰기" onclick="login_rq()">
				<%
            		} else {
            	%>
						<input type="button" value="글쓰기" onclick="location.href='r_write.jsp?u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
				<%
            		}
            	%>
			</div>

			<table>
				<tr>
					<td>글번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
				</tr>
				
		<%
                	for(int i = 0; i < reviewList.size(); i++) {
                		ReviewBean review = reviewList.get(i);
                		r_num = review.getR_num();
                		r_title = review.getR_title();
                		r_content = review.getR_content();
                		r_grade = review.getR_grade();
                		r_date = review.getR_date();
                		r_hit = review.getR_hit();
                		r_like = review.getR_like();
                		item_num = review.getItem_num();
                		r_id = review.getU_id();
        %>
        		<tr>
					<td><%= r_num %></td>
					<td><a href='r_show.jsp?r_id=<%= r_id %>&r_num=<%= r_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>'><%=r_title %></td>
					<td><%= r_id %></td>
					<td><%= r_date %></td>
				</tr>
		<%
               	}
         %>
			</table>
		</div>

		<div>
			<%= ReviewBean.pageNumber(5, u_id) %>
		</div>
	</form>		
</center>
	<br>

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
