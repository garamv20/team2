<%@page import="cart.CartVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cart.CartDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<form action="toCart.jsp" method="post">
		<input type="hidden" name="item_number" value="301">
		<input type="hidden" name="c_price" value="30000">
		<input type="hidden" name="u_id" value="test1">
			<table>
				<tr>
					<th>상품명:</th>
					<td>라이크데님</td>
				</tr>
				<tr>
					<th>판매가:</th>
					<td>30,000</td>
				</tr>
				<tr>
					<th>색상:</th>
					<td>
						<select name="c_option1">
							<option value="*">empty</option>
							<option value="연청">연청</option>
							<option value="진청">진청</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>사이즈:</th>
					<td>
						<select name="c_option2">
							<option value="*">empty</option>
							<option value="S">S</option>
							<option value="M">M</option>
							<option value="L">L</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="number" value="0" min="0" size="5" style="width: 50pt" name="c_qty">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="add to cart">
					</td>
				</tr>
			</table>
		</form>	
		<br><br><br>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
</body>
</html>