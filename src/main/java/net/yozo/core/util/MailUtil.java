package net.yozo.core.util;

import net.yozo.core.front.SystemManager;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.security.Security;
import java.util.Date;
import java.util.Enumeration;
import java.util.Properties;
import java.util.Vector;


/**
 * 发送邮件工具类
 * @author huangf
 *
 */
public class MailUtil {
	private static final Logger logger = LoggerFactory.getLogger(MailUtil.class);
/*	public static void main(String[] args) {//huangf@spider.com.cn
		MailUtil mail = new MailUtil("liyuan@yozosoft.com",
				"liyuan108402@163.com","108402ly//", "smtp.163.com", "标题");
		//mail.attachfile("C:/Users/li-ju/Desktop/yomo_web/登录.html");
//		mail.attachfile("e:\\aa.txt");
		mail.startSend("aaaa","bbbb");
	}*/

	

	// 定义发件人、收件人、主题等
	String to = null;
	String from = null;
	String password = null;
	String host = null;
	String filename = null;
//	String subject = null;
	// 用于保存发送附件的文件名的集合
	Vector file = new Vector();

	// 做一个可以传发件人等参数的构造
	public MailUtil(String to, String from,String password, String smtpServer, String subject) {
		// 初始化发件人、收件人、主题等
		this.to = to;
		this.from = from;
		this.password = password;
		this.host = smtpServer;
//		this.subject = subject;
	}
	
	public MailUtil(String to){
		this.to = to;
		this.from = SystemManager.getInstance().getProperty("from_email_account");
		this.password = SystemManager.getInstance().getProperty("from_email_password");
		this.host = SystemManager.getInstance().getProperty("from_eamil_smtpServer");
//		this.subject = subject;
	}

	// 该方法用于收集附件名
	public void attachfile(String fname) {
		file.addElement(fname);
	}

	// 开始发送信件的方法
	public boolean startSend(String emailTitle,String emailContent) {
		if(StringUtils.isBlank(emailContent)){
			logger.error("邮件内容不能为空！");
			return false;
		}
		Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		try {
			if(StringUtils.isBlank(emailContent)){
				throw new NullPointerException("发送的内容不能为空！");
			}
			// 创建Properties对象

			Properties props = new Properties();
			props.setProperty("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
			props.setProperty("mail.smtp.socketFactory.fallback", "false");
			props.setProperty("mail.smtp.port", "465");
			props.setProperty("mail.smtp.socketFactory.port", "465");
			/*props.setProperty("mail.smtp.port", "25");
			props.setProperty("mail.smtp.socketFactory.port", "25");*/
			props.put("mail.smtp.auth", "true");
			final String username = from;
			Session session = Session.getDefaultInstance(props, new Authenticator(){
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}});

			// -- Create a new message --
			Message msg = new MimeMessage(session);

			// -- Set the FROM and TO fields --
			msg.setFrom(new InternetAddress(SystemManager.getInstance().getProperty("from_email_account")));
			msg.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(to,false));

			MimeBodyPart bodyPart = new MimeBodyPart();
			bodyPart.setContent(emailContent, "text/html; charset=utf-8");
			MimeMultipart multipart = new MimeMultipart();
			multipart.addBodyPart(bodyPart);
			msg.setContent(multipart);

			msg.setSubject(emailTitle);
			//msg.setText(emailContent);
			msg.setSentDate(new Date());
			Transport.send(msg);
		}catch(Exception e){
			logger.error(e.getMessage());
			e.printStackTrace();
			return false;
		}
		return true;
	}

	class PopupAuthenticator extends Authenticator {
		String username = null;
		String password = null;

		public PopupAuthenticator(String user, String pass) {
			username = user;
			password = pass;
		}

		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(username, password);
		}
	}
	
	/**
	 * 忘记密码的HTML
	 * @return
	 */
//	public static String getForgetHtml(Account account,int pageType){
//		StringBuilder buff = new StringBuilder();
//		buff.append("http://127.0.0.1:8082/mybbs/forget.html?account="+account.getAccount()+"&sign="+account.getSign()+"&pageType="+pageType);
//		
//		return buff.toString();
//	}
}

