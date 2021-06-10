package SENS;

import java.util.Base64;
import java.util.Base64.Encoder;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;


public class Signature {
	public static String makeSignature(String timeStamp, String api_key, String access_key, String secret_key){
		String space = " ";					// one space
		String newLine = "\n";					// new line
		String method = "POST";					// method
		String url = "/sms/v2/services/ncp:sms:kr:262195421504:message_sender/messages";	// url (include query string)
		String timestamp = timeStamp;			// current timestamp (epoch)
		String accessKey = "1zB1FNZZofZBbLlwgesB";			// access key id (from portal or Sub Account)
		String secretKey = "wRREJhsLJRf46hyM28laTvoqp5yIpnndEuRYeM9A";

		String message = new StringBuilder()
			.append(method)
			.append(space)
			.append(url)
			.append(newLine)
			.append(timestamp)
			.append(newLine)
			.append(accessKey)
			.toString();

		try {
			SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);

			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
			String encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
     		return encodeBase64String;
		} catch(Exception e) {
			return null;
		}

	}

}
