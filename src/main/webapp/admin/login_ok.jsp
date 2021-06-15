<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	boolean db_success = false;
	boolean has_id = false;
	boolean is_same_password = true;
	//폼데이터 가져오기
	String admin_id = request.getParameter("id");
	String admin_password = request.getParameter("password");

	//서버 접속
	try{
		//오라클 DB 접속, scott/tiger
		String url = "jdbc:mysql://localhost:3306/team2_db";
		String user = "team2";
		String password = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, password);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt = con.prepareStatement("select * from admin where admin_id=?");
		pstmt.setString(1, admin_id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			//아이디가 있니?
			has_id = true;
			//비밀번호가 일치하니?
			if(admin_password.equals(rs.getString("admin_password"))){
				is_same_password = true;
				//이후 관리자페이지를 검증하는 세션
				session.setAttribute("admin", "verified");
			}else{
				is_same_password = false;
			}
		}else{
			has_id = false;
		}
		db_success = true;
		
		System.out.println("admin DB 접속 성공");
	}catch(Exception e){
		e.printStackTrace();
		System.out.println("admin DB 접속 실패");
	}
%>
<!DOCTYPE html>
<script>
//DB 접속 실패
if(<%=db_success%>==false){
	alert("DB 접속에 실패했습니다.");
	history.back();	
}
//아이디가 없음
if(<%=has_id%>==false){
	alert("관리자 아이디가 아닙니다.");
	history.back();
}
//비밀번호 틀림
if(<%=has_id%>==true && <%=is_same_password%>==false){
	alert("비밀번호가 틀렸습니다.");
	history.back();
}
//로그인 성공
if(<%=has_id%>==true && <%=is_same_password%>==true){
	alert("로그인에 성공했습니다.");
	location.href="main.jsp";
}
</script>