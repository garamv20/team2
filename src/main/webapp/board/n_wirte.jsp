<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
	<form action="write_ok.jsp" method="post">
		<table>
			<tr>
				<td>글제목</td>
				<td colspan="3"><input type="text" name=""></td>
				
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
					<input type="button" value="글목록" onclick="location.href='notice.jsp'" class="write-submit">
			</tr>
		</table>
	</form>
	</center>
</body>
</html>