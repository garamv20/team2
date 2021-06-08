package SENS;

public class Sample {

	public static void main(String[] args) {
		Send.SMS("01048516339", "테스트 메시지 전송", "ncp:sms:kr:262195421504:message_sender", "1zB1FNZZofZBbLlwgesB", "wRREJhsLJRf46hyM28laTvoqp5yIpnndEuRYeM9A");
		//참고사항
		//SMS는 단문, LMS는 장문
		//발신번호는 01048516339로 고정, 변경 불가
	}

}
