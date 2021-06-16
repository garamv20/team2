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
		alert("아이디를 입력해주세요 !");
		history.go(-1);
	</script>
	<%
}
if (db.confirmID(id) == 1) {
%>
<script>
	alert("중복된 ID입니다 !");
	history.back();
</script>
<%
} else {
%>
<script>
	alert("사용가능한 ID 입니다!");
	history.back();
</script>
<%
}
%>
