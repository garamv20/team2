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
	//�������� ��������
	String admin_id = request.getParameter("id");
	String admin_password = request.getParameter("password");

	//���� ����
	try{
		//����Ŭ DB ����, scott/tiger
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
			//���̵� �ִ�?
			has_id = true;
			//��й�ȣ�� ��ġ�ϴ�?
			if(admin_password.equals(rs.getString("admin_password"))){
				is_same_password = true;
				//���� �������������� �����ϴ� ����
				session.setAttribute("admin", "verified");
			}else{
				is_same_password = false;
			}
		}else{
			has_id = false;
		}
		db_success = true;
		
		System.out.println("admin DB ���� ����");
	}catch(Exception e){
		e.printStackTrace();
		System.out.println("admin DB ���� ����");
	}
%>
<!DOCTYPE html>
<script>
//DB ���� ����
if(<%=db_success%>==false){
	alert("DB ���ӿ� �����߽��ϴ�.");
	history.back();	
}
//���̵� ����
if(<%=has_id%>==false){
	alert("������ ���̵� �ƴմϴ�.");
	history.back();
}
//��й�ȣ Ʋ��
if(<%=has_id%>==true && <%=is_same_password%>==false){
	alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
	history.back();
}
//�α��� ����
if(<%=has_id%>==true && <%=is_same_password%>==true){
	alert("�α��ο� �����߽��ϴ�.");
	location.href="main.jsp";
}
</script>