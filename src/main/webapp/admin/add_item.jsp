<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//세션 admin이 verified여야 페이지가 보임
	String verified = (String)session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품 등록</title>
</head>
<body>
<form name="form" method="post" action="add_item_ok.jsp">
<table>
<tr><td>상품명*</td>
<td><input type="text" name="item_name"></td></tr>
<tr><td>상품종류1*</td>
<td><input type="text" name="item_type1"></td></tr>
<tr><td>상품종류2</td>
<td><input type="text" name="item_type2"></td></tr>
<tr><td>옵션</td>
<td><input type="text" name="item_option"></td></tr>
<tr><td>가격*</td>
<td><input type="number" name="item_price"></td></tr>
<tr><td>할인률</td>
<td><input type="number" name="item_discount_rate"></td></tr>
<tr><td>재고량*</td>
<td><input type="number" name="item_remains"></td></tr>
<tr><td>메모</td>
<td><input type="text" name="item_memo"></td></tr>
<tr><td>상품 이미지</td><td><input type="file" name="item_image"></td></tr>
<tr><td>상품설명 이미지</td><td><input type="file" name="item_explain_image"></td></tr>
<tr><td></td><td><input type="button" name="register" value="등록하기" onClick="click_register()"></td></tr>
<script>
function click_register(){
	//각 항목들이 입력되었는 지 검사
	if(form.item_name.value==""){
		form.item_name.focus();
		alert("상품명을 입력해주세요.");
		return;
	}
	if(form.item_type1.value==""){
		form.item_type1.focus();
		alert("상품종류1을 입력해주세요.");
		return;
	}
	if(form.item_price.value==""){
		form.item_price.focus();
		alert("가격을 입력해주세요.");
		return;
	}
	if(form.item_remains.value==""){
		form.item_remains.focus();
		alert("재고량을 입력해주세요.");
		return;
	}
	//상품종류2, 옵션, 할인률, 메모는 입력 안해도 됨
	//입력 안하면 디폴트값 주면 됨
	form.submit();
}
</script>
</table>
</form>
<script>
	if("<%=verified%>" != "verified"){
		alert("관리자로 로그인되지 않았습니다. 관리자로 로그인해주세요.");
		location.href="login.jsp";
	}
</script>
</body>
</html>