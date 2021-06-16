<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="signup.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap"
	rel="stylesheet">
<link
	rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/60f6a26247.js"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="signup.js" charset="UTF-8"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<title>Document</title>
<body>
	<div id="wrap">
		<header>
			<div class="top">
				<div class="top__search">
					<li><input type="text"></li>
					<li><a href=""><i class="fas fa-search"></i></a></li>
				</div>
				<ul class="top__list">
					<li><a href="Main.jsp">HOME</a></li>
					<li><a href="">JOIN</a></li>
					<li><a href="mypage.jsp">MY PAGE</a></li>
					<li><a href="cart.html">CART</a></li>
				</ul>
			</div>

			<div class="logo">
				<img src="images/pinterest_profile_image.jpg" alt="">
			</div>
		</header>
		<div class="main">
			<p class="sign" align="center">���θ� ȸ������ ������</p>

			<br>

			<center>
				<h3>*ǥ�ô� �ʼ� �Է� �׸��Դϴ�</h3>
				<br>
				<form name="form" method="post" action="signup_ok.jsp">
					<table class="table">

						<tr>
							<td width="80">&nbsp;&nbsp;ȸ���̸�</td>
							<td><input type="text" name="u_name" size="10">*</td>
						</tr>
						<tr>
							<td width="80">&nbsp;&nbsp;&nbsp;&nbsp;ID</td>
							<td><input type="text" id="u_id" name="u_id" size="10">

								<input type="button" class="mybtn2" value="���̵� �ߺ� Ȯ��"
								onclick="confirmID()"></td>
						</tr>
						<tr>
							<td width="80">&nbsp;&nbsp;��й�ȣ</td>
							<td><input type="password" name="u_pw" size="10">* <i
								class="fa fa-eye fa-lg"></i></td>
						</tr>
						<tr>
							<td width="80">&nbsp;&nbsp;���Է�</td>
							<td><input type="password" name="u_pw2" size="10">*
								<i class="fa fa-eye fa-lg"></i></td>
						</tr>
						<tr>

							<td>&nbsp;&nbsp;��ȭ��ȣ</td>
							<td><select name="phone1" id="phone1">
									<option value="010" selected>010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select> -<input type="text" name="phone2" id="phone2" size="4"
								maxlength="4"> -<input type="text" name="phone3"
								id="phone3" size="4" maxlength="4">* </td>
						</tr>


						<tr>
							<td width="80">&nbsp;&nbsp;�ֹι�ȣ</td>
							<td><input type="text" name="u_jumin" size="10">* (
								- ���� �Է�)</td>
						</tr>
						<tr>
							<td width="80">&nbsp;&nbsp;E-mail</td>
							<td><input type="text" name="u_email" size="15"></td>
						</tr>
						<tr>
						<td>�ּ�</td>
							<td><input type="text" id="postcode" name="postcode" placeholder="�����ȣ" size="10">
							 <input class="mybtn3" type="button"onclick="sample4_execDaumPostcode()" value="�ּ� ã��" ><br>
								<input type="text" id="roadAddress" name="roadAddress" placeholder="���θ��ּ�">
								<input type="text" id="jibunAddress" name="jibunAddress" placeholder="�����ּ�">
								<span id="guide" style="color:#999;display:none"></span>
								 <inputtype="text" id="detailAddress" name="detailAddress" placeholder="���ּ�">
								<input type="text" id="extraAddress" name="extraAddress" placeholder="�����׸�">
							</td>
						</tr>
						<tr align="center">
							<td colspan="3" align="center"><input class="mybtn"
								type="button" width="150" value="�����ϱ�" onclick="check_signup()">

								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input class="mybtn"
								type="reset" value="�ٽ��Է�">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						</tr>
					</table>
				</form>
			</center>
		</div>

		<footer>
			<div class="info1">
				<li>
					<h3>about us</h3>
					<p>company: MOODON</p>
					<p>business no: 123-45-67890</p>
					<p>tel. 02-1111-1111</p>
					<p>address: �λ걤���� �׸��� �׸��� 123</p>
					<p>
						<i>Copyright. MOODON all rights reserved.</i>
					</p>
				</li>
				<li>
					<h3>C/S CENTER</h3>
					<p>
						<strong>02-1111-1111</strong>
					</p>
					<p>mon-fri pm1:00~pm6:00</p>
					<p>sat, sun, holiday off</p>
				</li>

			</div>
		</footer>

	</div>
	<!-- ���̵� �ߺ��˻� -->
	<script type="text/javascript">
		function confirmID() {
			//encodeURI  -> get������� �ѱ涧 �ѱ۱��� ���� �����ϴ¹�� ! ���߿� �α���Ȯ�� �̳� ����Ȯ���Ҷ� �ᵵ�ɵ�!
			var u_id = encodeURI(document.getElementById('u_id').value);
			location.href("confirmID.jsp?u_id=" + u_id);
		}
	</script>

	<!--���� ������ ��й�ȣ�� �ؽ�Ʈ�� �ٲٴ� �ڵ� �Դϴ� -->
	<script type="text/javascript">
		$(document).ready(
				function() {
					$('.table i').on(
							'click',
							function() {
								$('input').toggleClass('active');
								if ($('input').hasClass('active')) {
									$(this).attr('class',
											"fa fa-eye-slash fa-lg").prev(
											'input').attr('type', "text");
								} else {
									$(this).attr('class', "fa fa-eye fa-lg")
											.prev('input').attr('type',
													'password');
								}
							});
				});
	</script>

<script>

    //�� ���������� ���θ� �ּ� ǥ�� ��Ŀ� ���� ���ɿ� ����, �������� �����͸� �����Ͽ� �ùٸ� �ּҸ� �����ϴ� ����� �����մϴ�.
    function sample4_execDaumPostcode() {
    	
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� ǥ���Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var roadAddr = data.roadAddress; // ���θ� �ּ� ����
                var extraRoadAddr = ''; // ���� �׸� ����

                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                // �����׸� ���ڿ��� ���� ��� �ش� �ʵ忡 �ִ´�.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(���� ���θ� �ּ� : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(���� ���� �ּ� : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

</body>
</html>