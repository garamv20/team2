<%@page import="review.ReviewBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	/*   사용자 아이디   */
	String u_id = "";
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	}
	
	/*   pageNum   */
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
			
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
	
	<center>
		<h1>후기 게시판</h1>
		<input type="button" onclick="location.href='notice.jsp'" value="공지사항">
		<input type="button" onclick="location.href='faq.jsp'" value="FAQ">
		<input type="button" onclick="location.href='review.jsp'" value="후기">
		<input type="button" onclick="location.href='qna.jsp'" value="Q&A">
				<br><br>
		
		
		<h3>이번 주 TOP3 후기</h3>
		<table border="1" cellspacing="0" width="800">
			<tr>
				<td height="80" align="center">
					<img src="./images/shirts.jpg" style="max-width: 200px; height: 200px;"><br>
					셔츠
					
				</td>
				<td height="80" align="center">
					<img src="./images/tshirts1.jpg" style="max-width: 200px; height: 200px;"><br>
					카키색 셔츠
				</td>
				<td height="80" align="center">
					<img src="./images/pants.jpg" style="max-width:200px; height: 200px;"><br>
					바지
				</td>
			</tr>
		</table>
		<br><br>
			 
			<table>
				<tr>
					
					<td align="right">
					<select id="">
                    	 <option>상품</option>
                     	<option value="01">상품</option>
                     	<option value="02">제목</option>
                     	<option value="03">작성자</option>
                	</select>
					<input type="text" name="search">
					<input type ="submit" value="검색">
					<a href="write.jsp?pageNum=<%= pageNum %>">글 쓰 기</a>
					</td>
				</tr>
			</table>
		
			<table width="1000" border="1" cellspacing="0" >
				<tr>
					<td width="40" align="center" >상품명</td>
					<td width="450" align="center">글제목</td>
					<td width="120" align="center">작성자</td>
					<td width="130" align="center">작성일</td>
					<td width="60" align="center">별점</td>
				</tr>
				<tr>
						<td>하의</td>
						<td><a href="r_show.jsp">바지 구매 후기</a></td>
						<td>admin</td>
						<td>June</td>
						<td>(3.0/5.0)</td>
				</tr>
			
			</table>
			<br><br>
			
			<div class="page">
				<%= ReviewBean.pageNumber(5, u_id) %>
			</div>
		</center>
		<br><br>
		<center>
				페이징
		</center>
</body>
</html>