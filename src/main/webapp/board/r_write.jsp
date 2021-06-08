<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <link href="./css/review.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<p>green shopping</p>
	</header>
	
	<center>
	<form action="write_ok.jsp" method="post">
		<table>
			<tr>
				<td>글제목</td>
				<td colspan="3"><input type="text" name=""></td>
				<te>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input type="text" name="" size="30"> </td>
				<td>
          			  <div class="rating">
           			     <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
              			  <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                		  <label for="rating1"></label>
                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                <label for="rating2"></label>
                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                <label for="rating3"></label>
                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                <label for="rating4"></label>
                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                <label for="rating5"></label>
       		     </div>
				
				</td>
			</tr>
			<tr>
				<td>사진</td>
				<td><input type="file" name=""> </td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea rows="5" cols="70">
				
					</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<input type="button" value="글쓰기" onclick="" class="write-submit">&nbsp;
					<input type="reset" value="다시작성" class="write-submit">&nbsp;
					<input type="button" value="글목록" onclick="location.href='list.jsp'" class="write-submit">
			</tr>
		
		</table>
	
	</form>
	</center>
	<br><br><br>

<footer>
(주)shopping
</footer>
</body>
</html>