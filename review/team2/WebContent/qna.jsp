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
		<h1>Q & A</h1>
		<input type="button" onclick="location.href='notice.jsp'" value="공지사항">
		<input type="button" onclick="location.href='faq.jsp'" value="FAQ">
		<input type="button" onclick="location.href='review.jsp'" value="후기">
		<input type="button" onclick="location.href='qna.jsp'" value="Q&A">
		<br><br>
			<table width="800" border="1" cellspacing="0" >
				<tr>
					<td width="40" align="center" >글번호</td>
					<td width="100" align="center">글분류</td>
					<td width="300" align="center">글제목</td>
					<td width="100" align="center">작성자</td>
					<td width="100" align="center">작성일</td>
					<td width="100" align="center">조회수</td>
				</tr>
				<tr>
						<td>1</td>
						<td>배송</td>
						<td>배송문의입니다</td>
						<td>admin</td>
						<td>6월 7일</td>
						<td>3</td>
				</tr>
			
			</table>
			<br><br>
			
			<select id="">
            	<option>전체</option>
                <option value="01">주문/결제</option>
                <option value="02">교환/반품</option>
                <option value="03">취소/환불</option>
                <option value="04">배송문의</option>
                <option value="05">마일리지</option>
            </select>
			<input type="text" name="search">
			<input type ="submit" value="검색">
			<br><br>
			
		</center>
		<br><br>
		<center>
				페이징
		</center>
</body>
</html>