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
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
	}
	
	FaqDBBean db = FaqDBBean.getInstance();
	ArrayList<FaqBean> faqList = db.listBoard(pageNum);
	
	//관리자
	int re = db.confirmManager(u_id);
	
	int f_num = 0;
	String f_title = "", f_category="", f_content = "", f_id = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/60f6a26247.js"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="faq.js" charset="utf-8"></script>
<link rel="stylesheet" href="board.css" type="text/css">
<link rel="stylesheet" href="faq.css" type="text/css">

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
			<h4>자주 묻는 질문 게시판입니다.</h4>
		</p>
<div id="list">
	<div class="write_button">
			<%
            		if(re == 1) { 
            	%>
			<input type="button" value="글쓰기" onclick="manager_rq()">
			<%
            		} else {
            	%>
			<input type="button" value="글쓰기"
				onclick="location.href='f_write.jsp?u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
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
			</tr>
			
				<%
                	for(int i = 0; i < faqList.size(); i++) {
                		FaqBean faq = faqList.get(i);
                		f_num = faq.getF_num();
                		f_category = faq.getF_category();
                		f_title = faq.getF_title();
                		f_content = faq.getF_content();
                		f_id = faq.getU_id();
               	  %>
            <tr>
				<td><%= f_num %></td>
				<td><%=f_category %></td>
				<td><a href="f_show.jsp?f_id=<%= f_id %>&f_num=<%= f_num %>&pageNum=<%= pageNum %>"><%= f_title %></a></td>
				<td><%= f_id %></td>
			</tr>
				<%
                	}
                 %>
			

		</table>
</div>

	</center>

	<center>
		<%= FaqBean.pageNumber(5, u_id) %>
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