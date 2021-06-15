<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
   <link rel="stylesheet" href="main.css">
<script src="script.js"></script>
</head>
<body>
 <header>
  &nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;
    포트폴리오 쇼핑몰
  <div id="loginArea">
   <ul>
     <li><a href="exMain.jsp">Home</a></li>
     <li><a href="Login.jsp">LogIn</a></li>

     <!-- 주문정보 확인? 결제내역 확인? -->
     <li><a href="">MyPage</a></li> 
     <!-- 장바구니 -->
     <li><a href="">Cart</a></li>
   </ul>
   
   <form name="search" 	method="post" action=""  onsubmit="">
     <table id="tab">
       <tr>
         <td><input type="text" name="keyword" id="keyword" size="15"></td>
         <td><input type="button" value="search" onclick="keyword_check()"></td>
       </tr>
     </table>
   </form>
  </div>
 </header>

 <nav> 
   <ul>
     <li><a class="menuLink" href="#">Outer</a></li>
     <li><a class="menuLink" href="#">Top</a></li>
     <li><a class="menuLink" href="#">Pants</a></li>
     <li><a class="menuLink" href="#">Unisex</a></li>
     <li><a class="menuLink" href="#">Accessories</a></li>
   </ul>
 </nav>
 <aside>

  <ul>
    <li>봄?</li>
    <li>여름?</li>
    <li>가을?</li>
    <li>겨울?</li>
    <li class="hot">신상품</li>
  </ul>
 </aside>
 <section> 
  
</section>
 <footer> GreenAcademy 2021-06-02 by Team2 </footer>
</body>
</html>