<%@page import="faq.FaqDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="faq" class="faq.FaqBean"></jsp:useBean>
<jsp:setProperty property="*" name="faq" />
<%
	String u_id = request.getParameter("u_id");

	FaqDBBean db = FaqDBBean.getInstance();
	
	if(db.insertBoard(faq, u_id) == 1) {
		response.sendRedirect("faq.jsp?u_id=" + u_id);
	} else {
		response.sendRedirect("f_write.jsp?u_id=" + u_id);
	}
%>