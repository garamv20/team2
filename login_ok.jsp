<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%

String id = request.getParameter("u_id");
String pwd = request.getParameter("u_pwd");
if( id.equals("user")){
	if(pwd.equals("1234")){
		session.setAttribute("user","userID");
		%>
		<script type="text/javascript">
		alert("�α��ο� �����߽��ϴ�.");
		location.href="exMain.jsp";
		</script>
		<%
	}else{
		System.out.println("��й�ȣ 1234 �ƴ�");
	}
		
}else{
	System.out.println("id �� user <");
	%>
	<script type="text/javascript">
	alert("�α��ο� �����߽��ϴ�.");
	location.href="exMain.jsp";
	</script>
	<%
}


%>