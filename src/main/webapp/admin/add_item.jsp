<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//���� admin�� verified���� �������� ����
	String verified = (String)session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ǰ ���</title>
</head>
<body>
<form name="form" method="post" action="add_item_ok.jsp">
<table>
<tr><td>��ǰ��*</td>
<td><input type="text" name="item_name"></td></tr>
<tr><td>��ǰ����1*</td>
<td><input type="text" name="item_type1"></td></tr>
<tr><td>��ǰ����2</td>
<td><input type="text" name="item_type2"></td></tr>
<tr><td>�ɼ�</td>
<td><input type="text" name="item_option"></td></tr>
<tr><td>����*</td>
<td><input type="number" name="item_price"></td></tr>
<tr><td>���η�</td>
<td><input type="number" name="item_discount_rate"></td></tr>
<tr><td>���*</td>
<td><input type="number" name="item_remains"></td></tr>
<tr><td>�޸�</td>
<td><input type="text" name="item_memo"></td></tr>
<tr><td></td><td><input type="button" name="register" value="����ϱ�" onClick="click_register()"></td></tr>
<script>
function click_register(){
	//�� �׸���� �ԷµǾ��� �� �˻�
	if(form.item_name.value==""){
		form.item_name.focus();
		alert("��ǰ���� �Է����ּ���.");
		return;
	}
	if(form.item_type1.value==""){
		form.item_type1.focus();
		alert("��ǰ����1�� �Է����ּ���.");
		return;
	}
	if(form.item_price.value==""){
		form.item_price.focus();
		alert("������ �Է����ּ���.");
		return;
	}
	if(form.item_remains.value==""){
		form.item_remains.focus();
		alert("����� �Է����ּ���.");
		return;
	}
	//��ǰ����2, �ɼ�, ���η�, �޸�� �Է� ���ص� ��
	//�Է� ���ϸ� ����Ʈ�� �ָ� ��
	form.submit();
}
</script>
</table>
</form>
<script>
	if("<%=verified%>" != "verified"){
		alert("�����ڷ� �α��ε��� �ʾҽ��ϴ�. �����ڷ� �α������ּ���.");
		location.href="login.jsp";
	}
</script>
</body>
</html>