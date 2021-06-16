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
session.invalidate(); // 세션 초기화

// 로그인 유지 쿠키 삭제
Cookie[] c = request.getCookies();
if (c != null) {
	for (Cookie cf : c) {
		if (cf.getName().equals("id")) {
			cf.setMaxAge(0);
			cf.setPath("/");
			response.addCookie(cf);
			request.getSession().invalidate();
			
		}
	}
}
/* session.invalidate(); */
%>
<script>
alert("로그아웃 되었습니다.");
location.href='Main.jsp';
</script>



</body>
</html>