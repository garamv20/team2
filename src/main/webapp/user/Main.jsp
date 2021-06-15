<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Aclonica&family=Indie+Flower&family=Sigmar+One&family=Staatliches&family=Suravaram&family=Titan+One&display=swap" rel="stylesheet">
	<script type="text/javascript" src="js/jquery.js"></script> 
	<script type="text/javascript">
		$(document).ready(function(){ 
		var currentPosition = parseInt($("#slidemenu").css("top")); 
		$(window).scroll(function() {
		var position = $(window).scrollTop()+300;
		$("#slidemenu").stop().animate({"top":position+currentPosition+"px"},500);
		});
		});
	</script>
	<style type="text/css">
		/*---------- 폰트 -----------*/
		.sur-font{
			font-family: "Suravaram", sans-serif;
			font-size: 13px;
			color: gray;
		}
		
		/*---------- 헤더 -----------*/
		header {
			width: 1500px;
			margin: 5px auto;
			position: fixed;
			top: 0;
			left: 0;
			right: 0;
			background: rgb(251,251,251);
		}
		header div {
			display: inline-block;
		}
		header a {
			color: gray;
			text-decoration: none;
		}
		header #lefthead a:hover {
			font-family: "Suravaram", sans-serif;
			color: black;
			font-weight: bold;			
		}
		header #righthead a:hover {
			font-family: "Suravaram", sans-serif;
			color: black;
			font-weight: bold;			
		}
		#lefthead{
			font-family: "Suravaram", sans-serif;
			float: left;
		}
		#righthead{
			font-family: "Suravaram", sans-serif;
			float: right;		
		}
		.box{
			padding-top: 30px;
		}
		/*--------- 메뉴바 ---------*/
        #nav {
            height: 50px;
            padding: 0 50px;
        }

        .menu {
            width: 900px;
            margin: 0 auto;
        }

        .menu p {
            width: 120px;
            text-align: center;
            display: inline-block;
        }
        ul p{
            width: 120px;
            text-align: center;
            display: inline-block;
        }

        .menu p a {
			font-family: "Aclonica", sans-serif;
            font-weight: bold;
            font-size: 15px;
            color: #444;
            text-decoration: none;
        }
        ul p a {
			font-family: "Aclonica", sans-serif;
            font-weight: bold;
            font-size: 15px;
            text-decoration: none;
        }

        .menu p a:hover {
			font-family: "Aclonica", sans-serif;
            font-size: 16px;
            font-weight: bolder;
            color:  rgb(31, 95, 212);
            transition: 0.3s;
        }
        ul li p a:hover {
        	font-family: "Aclonica", sans-serif;
            font-size: 16px;
            font-weight: bolder;
            color:  rgb(31, 95, 212);
            transition: 0.3s;
        }
        ul, li {
            list-style:none;
            margin:0;
            padding:0;
        }
        ul.myMenu {
        }
        ul.myMenu > li {
            display:inline-block;
            width:110px;
            padding:0 10px;
            position:relative;
            margin-left: 50px;
        }
        ul.myMenu > li:hover {
            /* background:#fff; */
        }
        ul.myMenu > li ul.submenu {
            display:none;
            position:absolute;
		}
        ul.myMenu > li:hover ul.submenu {
            display:block;
        }
        ul.myMenu > li ul.submenu > li {
        	font-family: "Aclonica", sans-serif;
            display:inline-block;
            width:110px;
            padding:0 8px;
            background: lightgray;
            opacity: 0.8;
            border:1px solid rgb(245, 245, 245);
            border-radius: 2px;
        }
        ul.myMenu > li ul.submenu > li:hover {
            background: rgb(253,253,253);
        }
        a {
            text-decoration: none;
            color: black;
        }
        .menu{
        	margin-left: 50px;
        	width: auto;
        }
        
        /*--------- 슬라이드바 ----------*/
        #slidemenu{
        	position: absolute;
        	margin-right: 20px;
        	top: 50px;
        	right: 10px;
        }
		#slidemenu img{
			width: 40px;
			height: 40px;
		}
		/*---------- 타이틀 ---------*/
		#title {
			padding-left: 15px;
			padding-bottom: 20px;
			text-align: center;
		}
		#title a{
			font-family: "Sigmar One", sans-serif;
			font-size: 30px;
			color: black;
			text-decoration: none;
		}
		
		/*--------- 바디 ----------*/
		body {
			width: 1200px;
			margin: 0 auto;
			padding-top: 120px;
		}
		
		#weeklyb p{
			font-family: "Indie Flower", sans-serif;
			font-size: 20px;
		}
		
		.image{
			text-align: center;
		}
		.img{
			width: 300px;
			height: 450px;
			float: right;
		}
		#chatbot{
		}
		.clothes {
			display: inline-block;
		}
		.clothes span{
			font-family: "Titan One", sans-serif;
		}
		.clothes img{
			width: 280px;
			height: 300px;
		}
		#likeimg{
			width: 20px;
			height: 15px;
			float: right;
		}
		.clear {
			clear: both;
		}
		/*--------- 푸터 ----------*/
		footer{
			width: 1500px;
			margin-top: 20px;
			background: rgb(242,242,242);
			text-align: center;
			padding-top: 30px;
			padding-bottom: 30px;
			margin-left: -150px;
		}
		.sur-font a {
			font-size: 15px;
			padding-right: 12px;
		}
	</style>
</head>
<body>
	<header>
		<div id="lefthead">
			<a href="#">MAIN</a>
		</div>
		<div id="righthead">
			<a href="#">LOGIN</a> | 
			<a href="#">JOIN</a> | 
			<a href="#">ORDER</a> | 
			<a href="#">CART</a> | 
			<a href="#">MY SHOP</a>
		</div>
		<div class="box">
			<div id="title">
				<a href="#">Green Street</a>
			</div>
			<div id="nav">
				<div class="menu">
					<ul class="myMenu">
						<li class="menu1"><p><a href="#">MEN's</a></p>
							<ul class="menu1 submenu">
								<li><p><a href="#">Top</a></p></li>
								<li><p><a href="#">Pants</a></p></li>
							</ul>
						</li>
						<li class="menu2"><p><a href="#">WOMEN's</a></p>
							<ul class="menu2 submenu">
								<li><p><a href="#">Top</a></p></li>
								<li><p><a href="#">Pants</a></p></li>
							</ul>
						</li>
						<li class="menu3"><p><a href="#">SHOES&BAG</a></p>
							<ul class="menu3 submenu">
								<li><p><a href="#">Shoes</a></p></li>
								<li><p><a href="#">Bag</a></p></li>
							</ul>
						</li>
						<li class="menu4"><p><a href="#">ACC</a></p>
							<ul class="menu4 submenu">
								<li><p><a href="#">EarAcc</a></p></li>
								<li><p><a href="#">NeckAcc</a></p></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</header>
	
	<div id="slidemenu">
		<div>
			<a href="#"><img src="clothes/slidemenu2.png"></a>			
		</div>
		<div>
			<a href="#"><img src="clothes/slidemenu1.png"></a>
		</div>
	</div>
	
	<section id="">
		<div id="weeklyb">
				<p>★Weekly Best Item★</p>
			<div class="clothes">
				<img src="clothes/cloth1.png"><br>
				<a href="#"><span>상의 1번</span></a>
				<a href="#"><img src="clothes/like.png" id="likeimg"></a><br>
				<span>29,900원</span>
			</div>
			<div class="clothes">
				<img src="clothes/cloth2.png"><br>
				<a href="#"><span>상의 2번</span></a>
				<a href="#"><img src="clothes/like.png" id="likeimg"></a><br>
				<span>29,900원</span>
			</div>
			<div class="clothes">
				<img src="clothes/cloth3.png"><br>
				<a href="#"><span>상의 3번</span></a>
				<a href="#"><img src="clothes/like.png" id="likeimg"></a><br>
				<span>29,900원</span>
			</div>
			<div class="clothes">
				<img src="clothes/cloth4.png"><br>
				<a href="#"><span>상의 4번</span></a>
				<a href="#"><img src="clothes/like.png" id="likeimg"></a><br>
				<span>29,900원</span>
			</div>
		</div>
		<div id="chatbot">
			<div class="image">
				<img src="clothes/chatbot.png" class="img">
			</div>
		</div>
	</section>
	<div class="clear"></div>
	<footer>
		<div>
            <span class="sur-font">
            	<a href="#">AGREEMENT</a>&nbsp;
            	<a href="#">PRIVACY POLICY</a>&nbsp;
            	<a href="#">GUIDE</a>&nbsp;<br>
            	COMPANY: 그린스트릿<br>
            	ADDRESS: 부산광역시 그린구 그린로 123<br>
            	BUSINESS LICENSE:123-45-67890<br>
	        	Copyright. 그린스트릿 all rights reserved.
	        </span>
        </div>
	</footer>
</body>
</html>