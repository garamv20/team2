package SENS;

public class Sample {

	public static void main(String[] args) {
		Send.SMS("01048516339", "테스트 메시지", "ncp:sms:kr:262195421504:message_sender", "1zB1FNZZofZBbLlwgesB", "wRREJhsLJRf46hyM28laTvoqp5yIpnndEuRYeM9A");
		//SMS 단문, LMS 장문
		//수신자, 메시지, 키, 키, 키 형태, 발신자는 01048516339 고정
	}

}
