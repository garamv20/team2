<%@page import="review.ReviewDBBean"%>
<%@page import="review.ReviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="comment.CommentBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String u_id = "";
	int rc_num = 0;
	
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	} else {
		response.sendRedirect("review.jsp");
	}
	
	/*--pageNum�� �ޱ�--*/
	String pageNum = request.getParameter("pageNum");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="review.js" charset="utf-8"></script>
<link rel="stylesheet" href="review.css" type="text/css">
<link rel="stylesheet" href="board.css" type="text/css">
<script src="https://kit.fontawesome.com/60f6a26247.js"
	crossorigin="anonymous"></script>
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
					<!--   �α��� ���´� > HOME 
       		 ��α��� ���´� > LOGIN ���̰�  -->
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
						<a href="notice.jsp">��������</a>
					</p></li>
				<li class="menu2"><p>
						<a href="faq.jsp">F A Q</a>
					</p></li>
				<li class="menu3"><p>
						<a href="qna.jsp">Q & A</a>
					</p></li>
				<li class="menu4"><p>
						<a href="review.jsp">�� �� </a>
					</p></li>
			</ul>
		</div>
	</div>
	</header>
	</div>

	<center>
		<p>
		<h2>�ı� �Խ��� �۾���</h2>
		</p>
		<form action="write_ok.jsp?u_id=<%= u_id %>" method="post">
			<table>
				<tr>
					<td>����</td>
					<td colspan="3"><input type="text" name="" class="title"></td>
				</tr>
				<tr>
					<td>��ǰ</td>
					<td><input type="text" name="" size="30" class="title"></td>

					<td colspan="2">
						<div class="review_rating">
							<div class="warning_msg">������ �����ϼ���</div>
							<div class="rating">

								<input type="checkbox" name="rating" id="rating1" value="1"
									class="rate_radio" title="1��"> <label for="rating1"></label>
								<input type="checkbox" name="rating" id="rating2" value="2"
									class="rate_radio" title="2��"> <label for="rating2"></label>
								<input type="checkbox" name="rating" id="rating3" value="3"
									class="rate_radio" title="3��"> <label for="rating3"></label>
								<input type="checkbox" name="rating" id="rating4" value="4"
									class="rate_radio" title="4��"> <label for="rating4"></label>
								<input type="checkbox" name="rating" id="rating5" value="5"
									class="rate_radio" title="5��"> <label for="rating5"></label>
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td>����</td>
					<td><input type="file" name=""></td>
				</tr>

				<tr>
					<td colspan="4">
						<textarea rows="15" cols="150"></textarea>
					</td>
				</tr>

				<tr>
					<td colspan="4">
						<div class="w_button">
							<input type="button" value="�۾���" onclick="">&nbsp; 
							<input type="reset" value="�ٽ��ۼ�">&nbsp; 
							<input type="button" value="�۸��" onclick="location.href='review.jsp?u_id=<%= u_id %>&pageNum=<%= pageNum %>'"><br>
						</div>
					</td>
					<br>
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
				<p>address: �λ걤���� �׸��� �׸��� 123</p>
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