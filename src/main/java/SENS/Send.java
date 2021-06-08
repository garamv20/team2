package SENS;

import java.io.OutputStream;
import java.net.URL;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;

import com.fasterxml.jackson.databind.ObjectMapper;

public class Send {
	public static void SMS(String to, String content, String api_key, String access_key, String secret_key) {
		try {
			LocalDateTime now = LocalDateTime.now();
			String timeStamp = String.valueOf(Timestamp.valueOf(now).getTime());
			URL url = new URL("https://sens.apigw.ntruss.com/sms/v2/services/"+api_key+"/messages");
			HttpsURLConnection con = (HttpsURLConnection)url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/json; charset=utf-8");
			con.setRequestProperty("x-ncp-apigw-timestamp", timeStamp);
			con.setRequestProperty("x-ncp-iam-access-key", access_key);
			con.setRequestProperty("x-ncp-apigw-signature-v2", Signature.makeSignature(timeStamp, api_key, access_key, secret_key));

			List<Messages> messages = new ArrayList<Messages>();
			messages.add(new Messages(to,content));
			Request request = new Request("SMS", "COMM", "82", "01048516339", "메시지", messages);
			ObjectMapper mapper = new ObjectMapper();
			String jsonBody = mapper.writeValueAsString(request);
			con.setDoInput(true);
			con.setDoOutput(true);
			
			OutputStream out = con.getOutputStream();
			byte[] input = jsonBody.getBytes("utf-8");
			out.write(input,0,input.length);
			out.flush();
			out.close();
			
			System.out.println(con.getResponseCode());
			System.out.println(con.getResponseMessage());
			if(con.getResponseCode()==202) {
				System.out.println("발신 성공");
				System.out.println(to);
				System.out.println(content);
			} else {
				System.out.println("발신 실패");
			}
		} catch(Exception e) {
			System.out.println("접속 오류");
		}
	}

	public static void LMS(String to, String content, String api_key, String access_key, String secret_key) {
		try {
			LocalDateTime now = LocalDateTime.now();
			String timeStamp = String.valueOf(Timestamp.valueOf(now).getTime());
			URL url = new URL("https://sens.apigw.ntruss.com/sms/v2/services/"+api_key+"/messages");
			HttpsURLConnection con = (HttpsURLConnection)url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/json; charset=utf-8");
			con.setRequestProperty("x-ncp-apigw-timestamp", timeStamp);
			con.setRequestProperty("x-ncp-iam-access-key", access_key);
			con.setRequestProperty("x-ncp-apigw-signature-v2", Signature.makeSignature(timeStamp, api_key, access_key, secret_key));

			List<Messages> messages = new ArrayList<Messages>();
			messages.add(new Messages(to,content));
			Request request = new Request("MMS", "COMM", "82", "01048516339", "메시지", messages);
			ObjectMapper mapper = new ObjectMapper();
			String jsonBody = mapper.writeValueAsString(request);
			con.setDoInput(true);
			con.setDoOutput(true);
			
			OutputStream out = con.getOutputStream();
			byte[] input = jsonBody.getBytes("utf-8");
			out.write(input,0,input.length);
			out.flush();
			out.close();
			
			System.out.println(con.getResponseCode());
			System.out.println(con.getResponseMessage());
			if(con.getResponseCode()==202) {
				System.out.println("발신 성공");
				System.out.println(to);
				System.out.println(content);
			} else {
				System.out.println("발신 실패");
			}
		} catch(Exception e) {
			System.out.println("접속 오류");
		}
	}
}
