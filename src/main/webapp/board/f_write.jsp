<%@page import="faq.FaqDBBean"%>
<%@page import="faq.FaqBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String u_id = "";
	
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	} else {
		response.sendRedirect("faq.jsp");
	}

	String pageNum = request.getParameter("pageNum");
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
			<h1>F A Q 글쓰기</h1>	
		</p>
		
		<form action="f_write_ok.jsp?u_id=<%= u_id %>" method="post" name="faq_frm">
			
			<table>
				<tr>
					<td>제 목 </td>
					<td colspan="3">
						<input type="text" name="f_title" class="title">
					</td>
				</tr>
				
				<tr>
					<td>
					 <label for ="catogory">분류</label>
					</td>
					 <td colsapn="3">
        					<select id="" name="" size="1">
            				<option value="">선택하세요</option>
            				<option value="주문/결제">주문/결제</option>
            				<option value="배송문의">배송문의</option>
            				<option value="회원관련">회원관련</option>
            				<option value="취소/교환/반품">취소/교환/반품</option>
        					</select>
        			</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="15" cols="150" name="f_content"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<div class="w_button">
							<input type="button" value="쓰기" onclick="write_ok()"> &nbsp;
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