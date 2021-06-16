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
					alert("존재하지 않는 회원입니다 ID 확인 을 해주세요 !");
					history.go(-1);
				</script>
				<%
			}else{
				if(!name.equals(user.getU_name())){
					%>
					<script>
						alert("회원 이름이 다릅니다 이름을 확인해주세요 !");
						history.go(-1);
					</script>
					<%
				}
				
				
			String pw = user.getU_pw();
			
				%>
				<script>
				var u_name = "<%=name %>";
					alert(  u_name +"님의 비밀번호는 '" + <%=pw %>+"' 입니다");
					 
					location.href("Login.jsp");
				</script>
				<%
			}


%>