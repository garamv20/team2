<%@page import="user.UserDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<jsp:useBean id="user" class="user.UserBean"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<%	
//폰번호를 하나씩 가져와서 합치고 저장한다 
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
			alert("회원 가입을 축하합니다 \n 회원으로 로그인 해주세요 ");
			location.href="Login.jsp";
			</script>
<%
		}else{
%> 
			<script>
			alert("회원 가입에 실패했습니다");
			history.back();
			</script>
<%
		}
	 
%>