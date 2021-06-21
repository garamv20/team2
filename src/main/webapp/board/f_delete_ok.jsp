<%@page import="faq.FaqDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String u_id = "";
	
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	} else {
		response.sendRedirect("faq.jsp");
	}
	
	int f_num = 0;
	
	if (request.getParameter("f_num") != null) {
		f_num = Integer.parseInt(request.getParameter("f_num"));
	}
	
	FaqDBBean db = FaqDBBean.getInstance();
	int re = db.deleteBoard(f_num);
	
	if(re == 1) {
%>
<script language="JavaScript">
			alert("삭제되었습니다.");
		</script>
<%
		response.sendRedirect("faq.jsp?u_id=" + u_id);
	} else if(re == -1) {
%>
<script language="JavaScript">
			alert("삭제에 실패하였습니다.");
			history.go(-1);
		</script>
<%
	}
	
%>