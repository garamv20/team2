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
    ��Ʈ������ ���θ�
  <div id="loginArea">
   <ul>
     <li><a href="exMain.jsp">Home</a></li>
     <li><a href="Login.jsp">LogIn</a></li>

     <!-- �ֹ����� Ȯ��? �������� Ȯ��? -->
     <li><a href="">MyPage</a></li> 
     <!-- ��ٱ��� -->
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
    <li>��?</li>
    <li>����?</li>
    <li>����?</li>
    <li>�ܿ�?</li>
    <li class="hot">�Ż�ǰ</li>
  </ul>
 </aside>
 <section> 
  
</section>
 <footer> GreenAcademy 2021-06-02 by Team2 </footer>
</body>
</html>