<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="qna.QnaDBBean"%>
<%@page import="qna.QnaBean"%>
<%@page import="comment.CommentBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String u_id = "";
	
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	} else {
		response.sendRedirect("qna.jsp");
	}
	
	int q_num = 0;
	
	if (request.getParameter("q_num") != null) {
		q_num = Integer.parseInt(request.getParameter("q_num"));
	}
	
	QnaDBBean db = QnaDBBean.getInstance();
	QnaBean qna = db.getBoard(q_num,false);
	
	if(!u_id.equals(qna.getU_id())) {
%>
		<script>
			history.go(-1);
		</script>
<%
	}
	
	String pageNum = request.getParameter("pageNum");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script src="https://kit.fontawesome.com/60f6a26247.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="board.css" type="text/css">
	<link rel="stylesheet" href="qna.css" type="text/css">
	
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
		<form action="q_write_ok.jsp?u_id=<%= u_id %>&q_num=<%= q_num %>" method="post">
			<table>
				<tr> 제    목
					<td>
						<input type="text" value="<%= qna.getQ_title() %>" name="" class="title">
					</td>

				</tr>
				<tr>
					<td>
						<textarea rows="15" cols="150">
							<%= qna.getQ_content() %>
						</textarea>
					</td>
				</tr>
				<tr>
					<td>
						<div class="e_button">
							<input type="button" value="수정" onclick="">&nbsp;
							<input type="reset" value="다시작성">&nbsp;
							<input type="button" value="목록으로" onclick="location.href='qna.jsp?u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
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