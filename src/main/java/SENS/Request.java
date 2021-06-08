package SENS;

import java.util.List;

public class Request {
	public Request(String type, String contentType, String countryCode, String from, String content,
			List<Messages> messages) {
		this.type = type;
		this.contentType = contentType;
		this.countryCode = countryCode;
		this.from = from;
		this.content = content;
		this.messages = messages;
	}
	public String type;
	public String contentType;
	public String countryCode;
	public String from;
	public String content;
	public List<Messages> messages;
}
