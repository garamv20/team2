<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	body{
		max-width: 1200px;
		margin: 0 auto;
		overflow-x:hidden;
	}
	#topMenu{
	    margin-bottom: 50px;
	    float: right;
	}
	
	#topMenu ul{
		list-style-type: none;
	}
	
	#topMenu ul li{
		display: inline-block;
		padding: 0 5px;
		
		font-size: 12px;
	}
	#topMenu ul li a{
		text-decoration: none;
		color: black;
	}
	
	
	/* 로고 밑에 메뉴바 */
	#wMenu{
		background: black;
		display: center;
	}
	
	#wMenu ul{
		list-style-type: none;
	}
	
	#wMenu ul li{
		display: inline-block;
		padding: 0 20px;		
		font-size: 18px;
	}
	#wMenu ul li a{
		text-decoration: none;
		color: white;
	}
	
	/*하위메뉴 이름*/
	#mDownTitle{
		margin-left: 50px;
	}
	
	/* top10 상품  */
	#top10 a{
		text-decoration: none;
		color: black;
	}
	#top10 img{
		width: 400px;
		height: 450px;
		float: left;
		margin-left: 125px;
		border: 1px solid #ccc;
	}
	#top10 .container{
		clear: both;
	}
	
	#top10 .contents{
		margin-left: 20px;
	}
	.rContents{
		transform: translate(33%, -3%);
	}
	.contents span{
		padding-left: 120px;
	}
	.total{
		font-size: 25px;
	}
	
	/*가운데 메뉴바 >> 상품후기 등 */
	#centerMenu ul{
		list-style-type: none;
		text-align: center;
	}
	
	#centerMenu ul li{
		display: inline-block;
		padding: 0 5px;
		font-size: 12px;
	}
	#centerMenu ul li a{
		text-decoration: none;
		color: black;
	}
</style>
</head>
<body>
	<nav id="topMenu">
		<ul >
			<li><a href="#">로그인(로그아웃)</a></li>
			<li><a href="#">회원가입</a></li>
			<li><a href="#">마이페이지</a></li>
			<li><a href="#">공지사항</a></li>
		</ul>
	</nav>
	
	<h1>로고이미지</h1>
	
	<nav id="wMenu">
		<ul>
			<li><a href="#">Best10</a></li>
			<li><a href="#">Outer</a></li>
			<li><a href="#">Bottom</a></li>
			<li><a href="#">Top</a></li>
			<li><a href="#">Ops/skirts</a></li>
			<li><a href="#">Bag/acc</a></li>
			<li><a href="#">shoes</a></li>
		</ul>
	</nav>
	
	<h4 id="mDownTitle">Best10</h4>
	<hr>
	<br><br>
	
	<section id="top10">
		<div class="container">
			<img src="img/f2.jpg">
			
			<div class="contents">
				<span><b>[Best]인기상품1</b></span>
				<hr style="border: 1px solid #ccc; width:450px;">
				
				<br>
				<span>price: 50,000원</span><br><br>
				<span>sale price: 0</span><br><br>
				<span>code: top1(임의)</span><br><br>
				<hr style="border: 1px solid #ccc; width:450px;">			

				<br>
				<span>
					color:
					<select name="color">
						<option value="none" selected>선택안함</option>
						<option value="white">white</option> 					
						<option value="black">black</option> 					
						<option value="shyblue">skyblue</option> 					
						<option value="green">green</option> 					
					</select> &nbsp;*필수선택
				</span>
				<br><br>
				
				<span>
					Size: 
					<label><input type="radio" name="size" value="S">S</label>
					<label><input type="radio" name="size" value="M">M</label>
					<label><input type="radio" name="size" value="L">L</label>
					<label><input type="radio" name="size" value="XL">XL</label>
				</span> &nbsp;*필수선택
				<br><br>
				<span>
					Count:
					<input style="WIDTH: 30pt; HEIGHT: 20pt" type=button value="-"
								onClick="danmugi.value--;"> <input type="number"
								id="danmugi" value="0" min="0" size="5" style="width: 50pt">
					<input style="WIDTH: 30pt; HEIGHT: 20pt" type=button value="+"
								onClick="danmugi.value++;">
				</span>
				<hr style="border: 1px solid #ccc; width:450px;">
				<br>			
				
				<div class="rContents">
					<div class="total"> Total: 0</div><br>
					<button id="buy">바로구매</button>
					<button id="cart">장바구니</button>				
				</div>
			</div>
		</div>
	</section>
	
	<br><br><br>
	<hr style="border: 0.5px solid #ccc; width:1000px;">
	<nav id="centerMenu">
		<ul>
			<li><a href="#">상품상세정보 |</a></li>
			<li><a href="#">상품후기 |</a></li>
			<li><a href="#">상품문의</a></li>
		</ul>
	</nav>
</body>
</html>