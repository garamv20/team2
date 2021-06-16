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
	
	
	/* �ΰ� �ؿ� �޴��� */
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
	
	/*�����޴� �̸�*/
	#mDownTitle{
		margin-left: 50px;
	}
	
	/* top10 ��ǰ  */
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
	
	/*��� �޴��� >> ��ǰ�ı� �� */
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
			<li><a href="#">�α���(�α׾ƿ�)</a></li>
			<li><a href="#">ȸ������</a></li>
			<li><a href="#">����������</a></li>
			<li><a href="#">��������</a></li>
		</ul>
	</nav>
	
	<h1>�ΰ��̹���</h1>
	
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
				<span><b>[Best]�α��ǰ1</b></span>
				<hr style="border: 1px solid #ccc; width:450px;">
				
				<br>
				<span>price: 50,000��</span><br><br>
				<span>sale price: 0</span><br><br>
				<span>code: top1(����)</span><br><br>
				<hr style="border: 1px solid #ccc; width:450px;">			

				<br>
				<span>
					color:
					<select name="color">
						<option value="none" selected>���þ���</option>
						<option value="white">white</option> 					
						<option value="black">black</option> 					
						<option value="shyblue">skyblue</option> 					
						<option value="green">green</option> 					
					</select> &nbsp;*�ʼ�����
				</span>
				<br><br>
				
				<span>
					Size: 
					<label><input type="radio" name="size" value="S">S</label>
					<label><input type="radio" name="size" value="M">M</label>
					<label><input type="radio" name="size" value="L">L</label>
					<label><input type="radio" name="size" value="XL">XL</label>
				</span> &nbsp;*�ʼ�����
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
					<button id="buy">�ٷα���</button>
					<button id="cart">��ٱ���</button>				
				</div>
			</div>
		</div>
	</section>
	
	<br><br><br>
	<hr style="border: 0.5px solid #ccc; width:1000px;">
	<nav id="centerMenu">
		<ul>
			<li><a href="#">��ǰ������ |</a></li>
			<li><a href="#">��ǰ�ı� |</a></li>
			<li><a href="#">��ǰ����</a></li>
		</ul>
	</nav>
</body>
</html>