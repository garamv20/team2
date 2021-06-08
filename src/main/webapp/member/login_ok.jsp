<%@page import="myUtil.HanConv"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
String id = request.getParameter("u_id");
String pwd = request.getParameter("u_pwd");
try{
	//오라클 DB 접속, scott/tiger
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String password = "tiger";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String name =""; //세션이용할 변수 
	Connection con = DriverManager.getConnection(url, user, password);
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	pstmt = con.prepareStatement("select * from s_user where u_id=?");
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	//아이디가 저장되어있고
	if(rs.next()){
		//비밀번호가 저장된거랑 같으면
		if(pwd.equals(rs.getString("u_pwd"))){
			name  = rs.getString("u_name");
		//네임 세션에 유져 이름 가져와서 저장
		session.setAttribute("name", name);
		%>
		<script type="text/javascript">
		alert("로그인성공 .");
		location.href="exMain.jsp";
		</script>
		<%
		}
		//비밀번호가 다르면?
		else{
			%>
			<script type="text/javascript">
			alert("비밀번호가 다릅니다.");
			location.href="exMain.jsp";
			</script>
			<%
		}
	}//아이디가 없으면 
	else{
		%>
		<script type="text/javascript">
		alert("로그인에 실패했습니다.");
		location.href="exMain.jsp";
		</script>
		<%
	}
}catch (Exception e) {
	e.printStackTrace();
}

%>
