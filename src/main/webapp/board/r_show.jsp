<%@page import="review.ReviewBean"%>
<%@page import="review.ReviewDBBean"%>
<%@page import="java.util.ArrayList"%>
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
	if(request.getParameter("r_id") != null) {
		con_id = request.getParameter("r_id");
	}
	System.out.println("u_id  "+u_id);
	System.out.println("con_id  "+con_id);
	
	ReviewDBBean db = ReviewDBBean.getInstance();
	ReviewBean rb = null;
	
	if(u_id.equals(con_id)) {
		rb = db.getBoard(r_num, false);
	} else {
		rb = db.getBoard(r_num, true);
	}
	
	int re = db.confirmManager(u_id);
	
	int r_grade=0, item_num=0, r_like=0;
	String r_title = "", r_content = "", r_id="";
	
	if (rb != null) {
		r_title = rb.getR_title();
		r_content = rb.getR_content();
		r_id = rb.getU_id();
		r_grade = rb.getR_grade();
		r_like = rb.getR_like();
		item_num = rb.getItem_num();
	}
	/*--좋아요 중복 막기--*/
	ArrayList<Integer> userLikelist = new ArrayList<Integer>();
	userLikelist = db.userLikeList(u_id);
	int likere = -1;
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
	<h1>R E V I E W</h1>
	<br>
	
<div id="s_list">
	<form method="post" action="r_delete_ok.jsp?r_num=<%= r_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>" name="show_frm"" name="">
		<table cellspacing="0">
			<tr>
				<td>제목   <%=r_title %></td>
			</tr>

			<tr align="center">
				<td >상품명   <%=item_num %>   작성자   <%=r_id %>  파일</td>
			</tr>
			<tr>
				<td>내용   <%=r_content %></td>
			</tr>
			<tr>
				<td>
					<strong>후기가 도움이 되었습니까?</strong> 
			<%
               	if(u_id.equals(r_id)) {
            %> 
               	<a onclick="" style="cursor: pointer;">
					<img src="images/r_like.png" width="20px" height="20px">
				</a>
				<%
               } else {
               		for(int k = 0; k < userLikelist.size(); k++) {
               			if(userLikelist.get(k) == r_num) {
                %>  <a onclick="" style="cursor: pointer;">
						<img src="images/r_like.png" width="20px" height="20px">
					</a>
				<%
                		likere = 1;
                		break;
                	}
                }
                		if(likere != 1) {
                	%>
                	 <a href='r_show?r_num=<%= r_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>'>
					 <img src="./images/r_like.png"  width="20px" height="20px">
					 </a>
					<%
                		}
                			likere = -1;
                		}
                	%> 
                		<%= r_like %>명이 좋아합니다.
				</td>
			</tr>
			<tr>
				<td>
					<div class="s_button">
			    <% 
     			   if(u_id == null){
        		%> 		<input type="button" value="수정" onclick="location.href='r_edit.jsp?r_num=<%= r_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>'">&nbsp;&nbsp;&nbsp;&nbsp; 
						
						<input type="button" value="삭제" onclick=""> &nbsp;&nbsp;&nbsp;&nbsp; 
				<%
     			   }
				%> 
						<input type="button" value="목록" onclick="location.href='review.jsp?u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
					</div>
					</td>
				</tr>
		</table>
	</form>
</div>

		<br>
		<br>

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