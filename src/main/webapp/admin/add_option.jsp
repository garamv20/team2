<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int item_number = Integer.parseInt((String)request.getParameter("item_number"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>옵션 추가</title>
</head>
<body>
<form name="form" method="post" action="add_option_ok.jsp">
<table>
<tr><td>상품번호</td>
<td><input type="number" name="item_number" value="<%=item_number %>" readonly></td></tr>
<tr><td>옵션1(사이즈)</td>
<td><input type="text" name="option1"></td></tr>
<tr><td>옵션2(색상)</td>
<td><input type="text" name="option2"></td></tr>
<tr><td>판매량</td>
<td><input type="number" name="sell" value="0" readonly></td></tr>
<tr><td>재고량</td>
<td><input type="number" name="remains"></td></tr>

<tr><td></td><td><input type="button" name="add" value="추가하기" onClick="click_add()"></td></tr>
</table>
</form>


<script>
function click_add(){
	form.submit();
}
</script>

</body>
</html>