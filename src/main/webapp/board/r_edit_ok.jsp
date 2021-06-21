<%@page import="review.ReviewDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="review" class="review.ReviewBean"></jsp:useBean>
<jsp:setProperty property="*" name="review" />
<%
	String u_id = "";
	
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	} else {
		response.sendRedirect("review.jsp");
	}
	
	int review_num = 0;
	
	if (request.getParameter("review_num") != null) {
		review_num = Integer.parseInt(request.getParameter("review_num"));
	}
	
	ReviewDBBean db = ReviewDBBean.getInstance();
	int re = db.editBoard(review);
	
	if (re == 1) {
		response.sendRedirect("review.jsp?u_id=" + u_id);
	} else if (re == -1) {
%>
		<script language="JavaScript">
			alert("글 수정에 실패하였습니다.");
			history.go(-1);
		</script>
<%
	}
%>