<%@page import="qna.QnaDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<jsp:useBean id="qna" class="qna.QnaBean"></jsp:useBean>
<jsp:setProperty property="*" name="qna" />
<%
	String u_id = request.getParameter("u_id");

	QnaDBBean db = QnaDBBean.getInstance();
	if(db.insertBoard(qna) == 1) {
		response.sendRedirect("qna.jsp?u_id=" + u_id);
	} else {
		response.sendRedirect("q_write.jsp?u_id=" + u_id);
	}
%>