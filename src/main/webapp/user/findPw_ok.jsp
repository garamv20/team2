<%@page import="myUtil.HanConv"%>
<%@page import="user.UserBean"%>
<%@page import="user.UserDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<% 
			String id  = HanConv.toKor(request.getParameter("u_id"));
			String name = HanConv.toKor(request.getParameter("u_name"));
		/* 	System.out.print(name); */
			UserDBBean db = UserDBBean.getInstance();
			UserBean user =  db.getUser(id);
			if(user==null){
				%>
				<script>
					alert("�������� �ʴ� ȸ���Դϴ� ID Ȯ�� �� ���ּ��� !");
					history.go(-1);
				</script>
				<%
			}else{
				if(!name.equals(user.getU_name())){
					%>
					<script>
						alert("ȸ�� �̸��� �ٸ��ϴ� �̸��� Ȯ�����ּ��� !");
						history.go(-1);
					</script>
					<%
				}
				
				
			String pw = user.getU_pw();
			
				%>
				<script>
				var u_name = "<%=name %>";
					alert(  u_name +"���� ��й�ȣ�� '" + <%=pw %>+"' �Դϴ�");
					 
					location.href("Login.jsp");
				</script>
				<%
			}


%>