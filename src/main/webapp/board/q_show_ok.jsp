<%@page import="comment.CommentBean"%>
<%@page import="qna.QnaDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="comment" class="comment.CommentBean"></jsp:useBean>
<jsp:setProperty property="*" name="comment"/>
<%
	String u_id = "";
	
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	} else {
		response.sendRedirect("qna.jsp");
	}
	
	int q_num = 0;
	
	if (request.getParameter("q_num") != null) {
		q_num = Integer.parseInt(request.getParameter("q_num"));
	}
	
	
	String q_id = "";
	if(request.getParameter("q_id") != null) {
		q_id = request.getParameter("q_id");
	}
	
	String pageNum = request.getParameter("pageNum");
	
	int com_num = 0, com_ref = 0, com_step = 0, com_level = 0;
	
	com_ref = q_num;
	
	if (request.getParameter("com_num") != null) {
		com_num = Integer.parseInt(request.getParameter("com_num"));
	}
	
	if (com_num != 0) {
		com_ref = Integer.parseInt(request.getParameter("com_ref"));
		com_step = Integer.parseInt(request.getParameter("com_step"));
		com_level = Integer.parseInt(request.getParameter("com_level"));
	} else {
		com_ref = q_num;
	}
	
	QnaDBBean db = QnaDBBean.getInstance();

	
	CommentBean commentB = new CommentBean();
	
	commentB.setCom_content(comment.getCom_content());
	commentB.setCom_ref(com_ref);
	commentB.setCom_step(com_step);
	commentB.setCom_level(com_level);
	commentB.setU_id(u_id);
	commentB.setTable_num(q_num);

	int re = db.insertComment(commentB);
	
	if(re == 1) {
%>
		<script>
			alert("댓글 등록이 등록되었습니다.");
		</script>
<%
		response.sendRedirect("q_show.jsp?q_id=" + q_id + "&q_num=" + q_num + "&u_id=" + u_id + "&pageNum=" + pageNum);
	} else {
%>
		<script>
			alert("댓글 등록에 실패하였습니다.");
		</script>
<%
	}
%>