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

<form name="form" method="post" action="add_item_ok.jsp" enctype="Multipart/form-data">
<table>
<tr><td>��ǰ����</td>
<td><select name="item_type">
<option value="�ƿ���">�ƿ���</option>
<option value="����">����</option>
<option value="����">����</option>
<option value="�������">�������</option>
<option value="����">����</option>
<option value="�Ǽ��縮">�Ǽ��縮</option>
</select></td></tr>
<tr><td>��ǰ��*</td>
<td><input type="text" name="item_name"></td></tr>
<tr><td>����*</td>
<td><input type="number" name="item_price"></td></tr>
<tr><td>���η�</td>
<td><input type="number" name="item_discount_rate" value="0"></td></tr>
<tr><td>�޸�</td>
<td><input type="text" name="item_memo"></td></tr>
<tr><td>��ǰ �̹���*</td><td><input type="file" name="item_image"></td></tr>
<tr><td>��ǰ���� �̹���*</td><td><input type="file" name="item_explain_image"></td></tr>
<tr><td></td><td><input type="button" name="register" value="����ϱ�" onClick="click_register()"></td></tr>
</table>
</form>

<script>
form.item_register_date.value = Date();
function click_register(){
	//�� �׸���� �ԷµǾ��� �� �˻�
	if(form.item_name.value==""){
		form.item_name.focus();
		alert("��ǰ���� �Է����ּ���.");
		return;
	}
	if(form.item_price.value==""){
		form.item_price.focus();
		alert("������ �Է����ּ���.");
		return;
	}
	if(form.item_image.value==""){
		form.item_image.focus();
		alert("��ǰ �̹����� ���ε����ּ���.");
		return;
	}
	if(form.item_explain_image.value==""){
		form.item_explain_image.focus();
		alert("��ǰ ���� �̹����� ���ε����ּ���.");
		return;
	}
	form.submit();
}
</script>
<script>
	if("<%=verified%>" != "verified"){
		alert("�����ڷ� �α��ε��� �ʾҽ��ϴ�. �����ڷ� �α������ּ���.");
		location.href="login.jsp";
	}
</script>
</body>
</html>