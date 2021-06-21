<%@page import="comment.CommentBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="qna.QnaBean"%>
<%@page import="qna.QnaDBBean"%>
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

int q_num = 0;

if (request.getParameter("q_num") != null) {
	q_num = Integer.parseInt(request.getParameter("q_num"));
}

//해당 글 작성자 
String con_id = "";
if(request.getParameter("q_id") != null) {
	con_id = request.getParameter("q_id");
}
System.out.println(u_id + "   u_id");
System.out.println(con_id+"   con_id");

QnaDBBean db = QnaDBBean.getInstance();
QnaBean qb = null;

if(u_id.equals(con_id)) {
	qb = db.getBoard(q_num,false);
} else {
	qb = db.getBoard(q_num,true);
}


	//관리자와 사용자
	int re = db.confirmManager(u_id);
	
	int q_hit = 0;
	String q_title = "", q_category="", q_content = "",q_id="";
	Timestamp q_date = null;
	
	if (qb != null) {
		q_title = qb.getQ_title();
		q_category = qb.getQ_category();
		q_content = qb.getQ_content();
		q_hit = qb.getQ_hit();
		q_date = qb.getQ_date();
		q_id = qb.getU_id();
	}

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	QnaDBBean cdb = QnaDBBean.getInstance();
	ArrayList<CommentBean> comList = cdb.listComment(q_num);
	
	int com_num = 0, com_ref = 0, com_step = 0, com_level = 0, table_num = 0;
	String com_table = "", com_content = "", com_uid = "";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="board.css" type="text/css">
<link rel="stylesheet" href="qna.css" type="text/css">
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
					<!--   로그인 상태는 > HOME 		 비로그인 상태는 > LOGIN 보이게  -->
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
		<h1>Q&A</h1>
	</p>
		
<div id="s_list">		
		<form method="post" action="q_delete_ok.jsp?q_num=<%= q_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>"
			name="show_frm">
			<table>
				<tr>
					<td>
						<span class="title"><%= q_title %></span>
						 <span class="con_etc">
							<span class="date"><%= q_date %></span>&nbsp;&nbsp;
							<span class="id"><%= q_id %></span>
						</span>
					</td>
				</tr>

				<tr>
					<td>내용<%= q_content %></td>
				</tr>
			<tr>
				<td>
					<div class="s_button">
			<% 
                	if(u_id.equals(q_id) ) {
            %>
				<input type="button" value="수정" onclick="location.href='q_edit.jsp?q_num=<%= q_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>'">&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="button" value="삭제" onclick="delete_ok()"> &nbsp;&nbsp;&nbsp;&nbsp;
			<%
                	}
          	%>
				<input type="button" value="목록으로" onclick="location.href='qna.jsp?u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
					</div>
				</td>
			</tr>
			</table>
	</form>
</div>

<%--댓글 --%>
<div id="comment">
<form method="post" action="q_show_ok.jsp?q_id=<%=q_id %>&q_num=<%= q_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>" name="">
	<table>
		<tr>
			<td colspan="2">댓글쓰기</td>
		</tr>
		<tr>
			<td>
				<textarea name=""  rows="4" cols="130">
                </textarea>
            </td>
			<td>
				&nbsp;&nbsp;<input type="button" value="등록" onclick="" class="c_button">
			</td>
		</tr>
	</table>
</form>

 <table id="com_list">
     	<%
       		for(int i = 0; i < comList.size(); i++) {
       			CommentBean cb = comList.get(i);
       			com_num = cb.getCom_num();
       			com_table = cb.getCom_table();
       			com_content = cb.getCom_content();
       			com_ref = cb.getCom_ref();
       			com_step = cb.getCom_step();
       			com_level = cb.getCom_level();
       			com_uid = cb.getU_id();
       			table_num = cb.getTable_num();
       	%>

       	<tr>
       		<td>
       			<div class="com_title">
       				<%= com_uid %>
       			</div>
                <div class="com_con">
                   	<%= com_content %>
		    <%
           			if(u_id.equals(com_uid) || re == 0) {
        	%>
            		<input type="button" value="삭제" style="cursor: pointer;" onclick="location.href=''">
            <%
            		}
            %>
                </div>
        	</td>		
        </tr>		
        	<%
        		}
        	%>
</table>
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