package net.yozo.core.util;

import com.sun.mail.util.MailSSLSocketFactory;
import net.yozo.core.front.SystemManager;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.security.Security;
import java.util.Date;
import java.util.Properties;

public class MailTool {
	public static void main(String[] args) throws MessagingException, GeneralSecurityException {
		Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		// Get a Properties object
		Properties props = new Properties();
		props.setProperty("mail.smtp.host", "smtp.mxhichina.com");
		props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.port", "465");
		props.setProperty("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.auth", "true");
		final String username = SystemManager.getInstance().getProperty("from_email_account");
		final String password = SystemManager.getInstance().getProperty("from_email_password");
		Session session = Session.getDefaultInstance(props, new Authenticator(){
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}});

		// -- Create a new message --
		Message msg = new MimeMessage(session);

		// -- Set the FROM and TO fields --
		msg.setFrom(new InternetAddress(username));
		msg.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse("1914295136@qq.com",false));
		msg.setSubject("你好,这是来自本地11111服务器");
		msg.setText("来自测试邮件");
		msg.setSentDate(new Date());
		Transport.send(msg);

		System.out.println("Message sent.");
		//return true;
	}
}