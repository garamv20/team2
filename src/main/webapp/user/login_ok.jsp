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
		alert("존재하지 않는 회원입니다 회원 가입을 해주세요 !");
		history.go(-1);
	</script>
	<%
	} else {

	if (check == 1) {
		
		session.setAttribute("id", id);
		// 사용자의 로그인 유지 여부를 null 체크로 확인 
		
		if (loginChk != null) { // 체크한 경우
			Cookie c = new Cookie("id",URLEncoder.encode( id,"UTF-8"));
			c.setMaxAge(24 * 60 * 60); //쿠키 유지 시간 하루 
			c.setPath("/");
			response.addCookie(c);
		}
	%>
	<script type="text/javascript">
		alert("  Mood On \n\n 로그인 완료  ");
		location.href = "Main.jsp";
	</script>
	<%
	} else if (check == 0) {
	%>
	<script>
		alert("비밀번호를 확인해 주세요");
		history.go(-1);
	</script>

	<%
	} else {
	/*필요없는 부분인데 오류 날수도 있으닌깐 */
	%>
	<script>
		alert("아이디가 맞지 않습니다");
		history.go(-1);
	</script>
	<%
	}
	}
	%>
</body>
</html>