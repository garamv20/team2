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
	<center>
		<h1>R E V I E W</h1>
		<table cellspacing="0" width="600" border="1">
			<tr>
				<td width="100" align="center" >글제목</td>
				<td colspan="3"> </td>
			</tr>
	
			<tr align="center">
				<td width="100">상품명</td>
				<td width="200"> </td>
				<td width="100">작성자</td>
				<td width="200"> </td>
			</tr>
			<tr>
				<td>파일</td>
				<td colspan="3">
					
				</td>
			</tr>
		
			<tr>
				<td width="100" align="center" >글내용</td>
				<td colspan="3"> </td>
			</tr>
			<tr>
				<td colspan="4">후기가 도움이 되었습니까? 좋아요기능추가</td>
			</tr>
		</table>
		<br><br>
		
		
		
        <form method="post" action="" name="">
            <table>
                <tr>
                    <td>댓글쓰기</td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <textarea name="" placeholder="욕설, 비방하는 내용 금지" rows="3" cols="45">
                        </textarea>
                    </td>
                    <td>
                    	
                			<input type="button" value="등록" onclick="" class="write-submit">
            			
                    </td>
                </tr>
                <tr>
                	<td>
                	<br><br>
                		<input type="button" value="글수정" onclick="location.href='edit.jsp'"class="write-submit" >
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="글삭제" onclick="" class="write-submit">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="글목록" onclick="location.href='list.jsp?'" class="write-submit" >
                	</td>
                </tr>
            </table>
        </form>
    	<br><br>
    

	</center>
</body>
</html>