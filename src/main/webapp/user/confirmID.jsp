<%@page import="user.UserBean"%>
<%@page import="user.UserDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
String id = request.getParameter("u_id");
UserDBBean db = UserDBBean.getInstance();



 
if( id.equals("") ){
	%>
	<script>
		alert("���̵� �Է����ּ��� !");
		history.go(-1);
	</script>
	<%
}
if (db.confirmID(id) == 1) {
%>
<script>
	alert("�ߺ��� ID�Դϴ� !");
	history.back();
</script>
<%
} else {
%>
<script>
	alert("��밡���� ID �Դϴ�!");
	history.back();
</script>
<%
}
%>
