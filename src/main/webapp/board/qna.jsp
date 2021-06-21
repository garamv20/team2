<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="qna.QnaDBBean"%>
<%@page import="qna.QnaBean"%>
<%@page import="java.util.ArrayList"%>
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
	
	QnaDBBean db = QnaDBBean.getInstance();
	ArrayList<QnaBean> qnaList = db.listBoard(pageNum);
	

	int re = db.confirmManager(u_id);
	
	int q_num = 0, q_hit = 0;
	String q_title = "", q_category="", q_content = "", q_id="";
	Timestamp q_date = null;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="qna.css" type="text/css">
<link rel="stylesheet" href="board.css" type="text/css">
<script type="text/javascript" src="qna.js" charset="utf-8"></script>

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
			<h1>Q & A</h1>
			<h4>문의글을 남겨주세요.</h4>
		</P>
		
<div id="list">
	<div class="write_button">
		<%
           	if(re == 1) { 
        %>
			<input type="button" value="글쓰기" onclick="login_rq()">
		<%
        	} else {
        %>
			<input type="button" value="글쓰기"
				onclick="location.href='q_write.jsp?u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
		<%
            }
        %>
	</div>

		<table>
			<tr>
				<td>번호</td>
				<td>분류</td>
				<td>제목</td>
				<td>작성자</td>
				<td>조회수</td>
			</tr>
			
	<%
          for(int i = 0; i < qnaList.size(); i++) {
              QnaBean qna = qnaList.get(i);
               q_num = qna.getQ_num();
               q_category = qna.getQ_category();
               q_title = qna.getQ_title();
               q_content = qna.getQ_content();
               q_date = qna.getQ_date();
               q_hit = qna.getQ_hit();
               q_id = qna.getU_id();
    %>
			<tr>
				<td><%=q_num %></td>
				<td><%=q_category %></td>
				<td><a href='q_show.jsp?q_id=<%= q_id %>&q_num=<%= q_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>'><%=q_title %></td>
				<td><%= q_id %></td>
				<td><%= q_hit %></td>
			</tr>
	<%
          }
    %>
		</table>
</div>
	
	</center>
	<br>
	<br>
	<center>
		<%= QnaBean.pageNumber(5, u_id) %>
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