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

<form name="form" method="post" action="add_item_ok.jsp" enctype="Multipart/form-data">
<table>
<tr><td>상품종류</td>
<td><select name="item_type">
<option value="아우터">아우터</option>
<option value="상의">상의</option>
<option value="하의">하의</option>
<option value="언더웨어">언더웨어</option>
<option value="슈즈">슈즈</option>
<option value="악세사리">악세사리</option>
</select></td></tr>
<tr><td>상품명*</td>
<td><input type="text" name="item_name"></td></tr>
<tr><td>가격*</td>
<td><input type="number" name="item_price"></td></tr>
<tr><td>할인률</td>
<td><input type="number" name="item_discount_rate" value="0"></td></tr>
<tr><td>메모</td>
<td><input type="text" name="item_memo"></td></tr>
<tr><td>상품 이미지*</td><td><input type="file" name="item_image"></td></tr>
<tr><td>상품설명 이미지*</td><td><input type="file" name="item_explain_image"></td></tr>
<tr><td></td><td><input type="button" name="register" value="등록하기" onClick="click_register()"></td></tr>
</table>
</form>

<script>
form.item_register_date.value = Date();
function click_register(){
	//각 항목들이 입력되었는 지 검사
	if(form.item_name.value==""){
		form.item_name.focus();
		alert("상품명을 입력해주세요.");
		return;
	}
	if(form.item_price.value==""){
		form.item_price.focus();
		alert("가격을 입력해주세요.");
		return;
	}
	if(form.item_image.value==""){
		form.item_image.focus();
		alert("상품 이미지를 업로드해주세요.");
		return;
	}
	if(form.item_explain_image.value==""){
		form.item_explain_image.focus();
		alert("상품 설명 이미지를 업로드해주세요.");
		return;
	}
	form.submit();
}
</script>
<script>
	if("<%=verified%>" != "verified"){
		alert("관리자로 로그인되지 않았습니다. 관리자로 로그인해주세요.");
		location.href="login.jsp";
	}
</script>
</body>
</html>