<%@page import="notice.NoticeDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:useBean id="notice" class="notice.NoticeBean"></jsp:useBean>
<jsp:setProperty property="*" name="notice"/>
<%
	String u_id = "";
	
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	} else {
		response.sendRedirect("notice.jsp");
	}
	
	int n_num = 0;
	
	if (request.getParameter("n_num") != null) {
		n_num = Integer.parseInt(request.getParameter("n_num"));
	}
	
	NoticeDBBean db = NoticeDBBean.getInstance();
	int re = db.editBoard(notice);
	
	if (re == 1) {
		response.sendRedirect("notice.jsp?u_id=" + u_id);
	} else if (re == -1) {
%>
	<script language="JavaScript">
			alert("글 수정에 실패하였습니다.");
			history.go(-1);
	</script>
<%
	}
%>