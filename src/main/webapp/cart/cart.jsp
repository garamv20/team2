<%@page import="cart.CartVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cart.CartDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//String id = (String) session.getAttribute("id"); 나중에 세션으로 아이디 가져옴
	String u_id = "test1";
	CartDB db = CartDB.getInstance();
	ArrayList<CartVO> list = db.cartList(u_id);
	int c_code, item_number, c_qty, c_price, delivery;
	String item_name,c_option1, c_option2;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="cart.css">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">  
<title>Insert title here</title>
  <script src="https://kit.fontawesome.com/60f6a26247.js" crossorigin="anonymous"></script>
  <script defer src="cart.js"></script>

</head>
<body>
<body>
  <div id="wrap">
    <header>
      <div class="top">
        <div class="top__search">
          <li><input type="text"></li>
          <li><a href=""><i class="fas fa-search"></i></a></li>
        </div>
        <ul class="top__list">
          <li><a href="">LOGIN</a></li>
          <li><a href="">JOIN</a></li>
          <li><a href="">MY PAGE</a></li>
          <li><a href="">CART</a></li>
        </ul>
      </div>

      <div class="logo">
        <img src="../images/pinterest_profile_image.jpg" alt="">
      </div>

      <nav class="mainbar">
        <li><a href="">BEST50</a></li>
        <li><a href="">OUTER</a></li>
        <li><a href="">TOP</a></li>
        <li><a href="">PANTS</a></li>
        <li><a href="">SKIRT&DRESS</a></li>
      </nav>
    </header>
    <main>
      <div class="main_title">
        <h2>SHOPPING CART</h2>
      </div>
      <div class="main_cart">
        <table class="cart_table">
          <colgroup>
            <col style="width: 25px;">
            <col style="width: 95px;">
            <col style="width: auto;">
            <col style="width: 95px;">
            <col style="width: 75px;">
            <col style="width: 95px;">
            <col style="width: 95px;">
            <col style="width: 95px;">
            <col style="width: 110px;">
          </colgroup>
          <thead>
            <tr>
              <td scope="col"><input type="checkbox" name="all" onclick="check_all(this)"></td>
              <td scope="col">이미지</td>
              <td scope="col">상품정보</td>
              <td scope="col">판매가</td>
              <td scope="col">수량</td>
              <td scope="col">적립금</td>
              <td scope="col">배송비</td>
              <td scope="col">합계</td>
              <td scope="col">선택</td>
            </tr>
          </thead>
          <%
          	for(int i = 0; i < list.size(); i++){
          		CartVO cart = list.get(i);
          		c_code = cart.getC_code();
          		item_number = cart.getItem_number();
          		item_name = cart.getItem_name();
          		c_option1 = cart.getC_option1();
          		c_option2 = cart.getC_option2();
          		c_qty = cart.getC_qty();
          		c_price = cart.getC_price();
          		
          		if((c_price * c_qty) >= 50000){
          			delivery = 0;
          		}else{
          			delivery = 3000;
          		}
          %>
          <tbody>
            <tr>
              <td><input type="checkbox" name="<%=item_number%>" class="list" value="<%=c_price*c_qty%>" onclick="total_price()"></td>
              <td><img src="..images/clothes/<%=item_number%>.jpg" alt="" width="80px" height="100px"></td>
              <td>
                <ul>
                  <li><strong><%=item_name%></strong></li>
                  <li>[옵션1: <%=c_option1%>]</li>
                  <li>[옵션2: <%=c_option2%>]</li>
                  <li><input type="button" value="옵션변경"></li>
                </ul>
              </td>
              <td><%=c_price%></td>
              <td>
                <ul>
                  <li><input type="number" value="<%=c_qty%>" style="width: 50px;"></li>
                  <li><input type="button" value="변경"></li>
                </ul>
              </td>
              <td><%=c_price * c_qty * 0.05%></td>
              <td><%=delivery%></td>
              <td><%=(c_price * c_qty+delivery)%></td>
              <td>
                <ul>
                  <li><input type="button" value="주문하기"></li>
                  <li><input type="button" value="삭제"></li>
                </ul>
              </td>
            </tr>
          </tbody>
          <%
          	}
          %>
          <tfoot>
            <tr align="right">
              <td colspan="9">상품구매금액 <span id="items"></span> + 배송비 <span id="delivery"></span> = 합계: <strong><span id="total"></span></strong></td>
            </tr>
          </tfoot>
        </table>
      </div>
    </main>
    <br><br><br>
    <footer>
      <div class="info1">
        <li>
          <h3>about us</h3>
          <p>company: MOODON</p>
          <p>business no: 123-45-67890</p>
          <p>tel. 02-1111-1111</p>
          <p>address: 부산광역시 그린구 그린로 123</p>
          <p><i>Copyright. MOODON all rights reserved.</i></p>
        </li>
        <li>
          <h3>C/S CENTER</h3>
          <p><strong>02-1111-1111</strong></p>
          <p>mon-fri pm1:00~pm6:00</p>
          <p>sat, sun, holiday off</p>
        </li>
      </div>
    </footer>
  </div>
</body>
</body>
</html>