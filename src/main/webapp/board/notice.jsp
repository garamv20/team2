<%@page import="review.ReviewBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>�� �� �� ��</h1>
		<input type="button" onclick="location.href='notice.jsp'" value="��������">
		<input type="button" onclick="location.href='faq.jsp'" value="FAQ">
		<input type="button" onclick="location.href='review.jsp'" value="�ı�">
		<input type="button" onclick="location.href='qna.jsp'" value="Q&A">
				<br><br>
		
		
			<table width="800" border="1" cellspacing="0" >
				<tr>
					<td width="40" align="center" >�۹�ȣ</td>
					<td width="300" align="center">������</td>
					<td width="100" align="center">�ۼ���</td>
					<td width="100" align="center">��¥</td>
				</tr>
				<tr>
						<td>1</td>
						<td>6�� �̺�Ʈ �ȳ�</td>
						<td>������</td>
						<td>6/5</td>
				</tr>
			
			</table>
			<br><br>
			
			<select id="">
            	<option>��ü</option>
                <option value="01">�ֹ�/����</option>
                <option value="02">��ȯ/��ǰ</option>
                <option value="03">���/ȯ��</option>
                <option value="04">��۹���</option>
                <option value="05">���ϸ���</option>
            </select>
			<input type="text" name="search">
			<input type ="submit" value="�˻�">
			<br><br>
			
		</center>
		<br><br>
		
		<div class="page">
				<%=  %>
		</div>
</body>
</html>