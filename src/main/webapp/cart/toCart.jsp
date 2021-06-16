<%@page import="cart.CartDB"%>
<%@page import="myUtil.HanConv2"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cart" class="cart.CartVO"></jsp:useBean>
<jsp:setProperty property="*" name="cart"/>
<%
	CartDB db = CartDB.getInstance();
	System.out.println(db.checkCart(cart));
	
	//장바구니에 동일한 상품있는지 확인
	if (db.checkCart(cart) != 0){
		int c_code = db.checkCart(cart);
%>
		<script>
			let sameItem = confirm("장바구니에 동일한 상품이 있습니다.<br>장바구니에 추가하시겠습니까?");
			if(sameItem){
<%
			db.upItemQty(c_code, cart.getC_qty());
%>			
			let toCart = confirm("장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?");
				if(toCart){
					location.href="cart.jsp";
				}else{
					history.go(-1);
				}
			}else{
				history.go(-1);
			}
		</script>
<%	
	}else{ //동일상품 없을때 바로 장바구니 추가 
		if(db.insertCart(cart) == 1){
%>
	<script>
		let toCart = confirm("장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?");
		if(toCart){
			location.href="cart.jsp";
		}else{
			history.go(-1);
		}
	</script>
<%
	}
}

%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>