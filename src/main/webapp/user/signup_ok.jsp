<%@page import="user.UserDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<jsp:useBean id="user" class="user.UserBean"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<%	
//����ȣ�� �ϳ��� �����ͼ� ��ġ�� �����Ѵ� 
String p1 = request.getParameter("phone1");
String p2 = request.getParameter("phone2");
String p3 = request.getParameter("phone3");
String u_phone = p1+p2+p3;

String address = request.getParameter("postcode") + request.getParameter("roadAddress") 
				+request.getParameter("jibunAddress")+ request.getParameter("detailAddress")
				+request.getParameter("extraAddress");
user.setU_phone(u_phone);
user.setU_address(address);
	UserDBBean db = UserDBBean.getInstance();
	
		int re =db.signup(user);
		if(re==1){
%>
			<script>
			alert("ȸ�� ������ �����մϴ� \n ȸ������ �α��� ���ּ��� ");
			location.href="Login.jsp";
			</script>
<%
		}else{
%> 
			<script>
			alert("ȸ�� ���Կ� �����߽��ϴ�");
			history.back();
			</script>
<%
		}
	 
%>