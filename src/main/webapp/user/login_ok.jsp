<%@page import="java.net.URLEncoder"%>
<%@page import="myUtil.HanConv"%>
<%@page import="user.UserDBBean"%>
<%@page import="user.UserBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%

	String id = HanConv.toKor(request.getParameter("u_id"));
	String pwd = request.getParameter("u_pw");
	String loginChk = request.getParameter("loginChk");
	
	
	UserDBBean db = UserDBBean.getInstance();
	int check = db.userCheck(id, pwd);
	UserBean ub = db.getUser(id);
	if (ub == null) {
	%>
	<script>
		alert("�������� �ʴ� ȸ���Դϴ� ȸ�� ������ ���ּ��� !");
		history.go(-1);
	</script>
	<%
	} else {

	if (check == 1) {
		
		session.setAttribute("id", id);
		// ������� �α��� ���� ���θ� null üũ�� Ȯ�� 
		
		if (loginChk != null) { // üũ�� ���
			Cookie c = new Cookie("id",URLEncoder.encode( id,"UTF-8"));
			c.setMaxAge(24 * 60 * 60); //��Ű ���� �ð� �Ϸ� 
			c.setPath("/");
			response.addCookie(c);
		}
	%>
	<script type="text/javascript">
		alert("  Mood On \n\n �α��� �Ϸ�  ");
		location.href = "Main.jsp";
	</script>
	<%
	} else if (check == 0) {
	%>
	<script>
		alert("��й�ȣ�� Ȯ���� �ּ���");
		history.go(-1);
	</script>

	<%
	} else {
	/*�ʿ���� �κ��ε� ���� ������ �����ѱ� */
	%>
	<script>
		alert("���̵� ���� �ʽ��ϴ�");
		history.go(-1);
	</script>
	<%
	}
	}
	%>
</body>
</html>