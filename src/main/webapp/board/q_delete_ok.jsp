<%@page import="qna.QnaDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String u_id = "";
	
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	} else {
		response.sendRedirect("qna.jsp");
	}
	
	int qna_num = 0;
	
	if (request.getParameter("q_num") != null) {
		qna_num = Integer.parseInt(request.getParameter("q_num"));
	}
	
	QnaDBBean db = QnaDBBean.getInstance();
	int re = db.deleteBoard(qna_num);
	
	if(re == 1) {
%>
<script language="JavaScript">
			alert("�����Ǿ����ϴ�.");
		</script>
<%
		response.sendRedirect("qna.jsp?u_id=" + u_id);
	} else if(re == -1) {
%>
<script language="JavaScript">
			alert("������ �����Ͽ����ϴ�.");
			history.go(-1);
		</script>
<%
	}
	
%>