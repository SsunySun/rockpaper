package kr.co.rockplace.rshm.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.annotation.PostConstruct;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import kr.co.rockplace.rshm.db.entity.ContentEntity;
import kr.co.rockplace.rshm.db.entity.ControlEntity;
import kr.co.rockplace.rshm.db.mapper.rshm.CommonMapper;
import kr.co.rockplace.rshm.db.repository.ContentRepository;
import kr.co.rockplace.rshm.db.repository.ControlRepository;
import kr.co.rockplace.rshm.utils.CommonUtils;
import lombok.extern.slf4j.Slf4j;

/**
 * Mail Service
 * @author wonsunlee
 *
 */
@Service
@Slf4j
public class MailService {

	/**
	 * Mail USE (Default: false)
	 */
	@Value("${spring.mail.properties.mail.used:false}")
	private boolean MAIL_USE;

	/**
	 * Mail Debug (Default: false)
	 */
	@Value("${spring.mail.properties.mail.debug:false}")
	private boolean MAIL_DEBUG;

	/**
	 * Mail Type(TLS|SSL)
	 */
	@Value("${spring.mail.properties.mail.type:}")
	private String MAIL_TYPE;

	/**
	 * Mail SMTP Host
	 */
	@Value("${spring.mail.host:}")
	private String SMTP_HOST;

	/**
	 * Mail SMTP Port
	 */
	@Value("${spring.mail.port:}")
	private int SMTP_PORT;

	/**
	 * Mail SMTP Authentication (Default: true)
	 */
	@Value("${spring.mail.properties.smtp.auth:true}")
	private boolean SMTP_AUTH;

	/**
	 * Mail SMTP User Name
	 */
	@Value("${spring.mail.username:}")
	private String SMTP_USERNAME;

	/**
	 * Mail SMTP Password
	 */
	@Value("${spring.mail.password:}")
	private String SMTP_PASSWORD;

	/**
	 * Mail SMTP TTL Enable (Default: false)
	 */
	@Value("${spring.mail.properties.mail.smtp.starttls.enable:false}")
	private boolean SMTP_TLS_ENABLE;

	/**
	 * Mail SMTP SSL Port(Default: 465)
	 */
	@Value("${spring.mail.properties.mail.smtp.ssl.port:465}")
	private int SMTP_SSL_PORT;

	/**
	 * Mail SMTP Test Mode(Default: false)
	 */
	@Value("${spring.mail.properties.mail.test:false}")
	private boolean SMTP_TEST;

	/**
	 * Mail SMTP Test TO(Default: )
	 */
	@Value("${spring.mail.properties.mail.test_to:}")
	private String SMTP_TEST_TO;

	@Autowired
	private ControlRepository controlRepository;

	@Autowired
	private ContentRepository contentRepository;

	@Autowired
	private CommonMapper commonMapper;

	@Autowired
	private Environment environment;

	@Autowired
	private LogService logService;

	private Session session = null;

	@PostConstruct
	void init() {

		if (StringUtils.equalsIgnoreCase(MAIL_TYPE, "TLS")) {

			Properties props = new Properties();
			props.put("mail.smtp.host", SMTP_HOST); // SMTP Host
			props.put("mail.smtp.port", SMTP_PORT); // TLS Port
			props.put("mail.smtp.auth", SMTP_AUTH); // Enable Authentication
			props.put("mail.smtp.starttls.enable", SMTP_TLS_ENABLE); // Enable STARTTLS

			// Create Authenticator object to pass in Session.getInstance argument
			Authenticator auth = new Authenticator() {

				//override the getPasswordAuthentication method
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);
				}
			};

			this.session = Session.getInstance(props, auth);
			this.session.setDebug(MAIL_DEBUG);
		} else if (StringUtils.equalsIgnoreCase(MAIL_TYPE, "SSL")) {

			Properties props = new Properties();
			props.put("mail.smtp.host", SMTP_HOST); // SMTP Host
			props.put("mail.smtp.port", SMTP_PORT); // SSL Port
			props.put("mail.smtp.auth", SMTP_AUTH); // Enable Authentication
			props.put("mail.smtp.socketFactory.port", SMTP_SSL_PORT); // SSL Port
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); // SSL Factory Class

			// Create Authenticator object to pass in Session.getInstance argument
			Authenticator auth = new Authenticator() {

				//override the getPasswordAuthentication method
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);
				}
			};

			this.session = Session.getInstance(props, auth);
			this.session.setDebug(MAIL_DEBUG);
		} else {

			Properties props = System.getProperties();
			props.put("mail.smtp.host", SMTP_HOST); // SMTP Host

			this.session = Session.getInstance(props, null);
			this.session.setDebug(MAIL_DEBUG);
		}
	}
	

	/**
	 * 첨부파일이 없는 메일 전송 
	 * @param session {@link javax.mail.Session}
	 * @param recipients 수신자 
	 * @param subject 제목 
	 * @param contents 본문 
	 * @throws MessagingException 
	 */
	private void sendMailWithoutAttachment(Session session, String recipients, String subject, String contents) throws MessagingException {

		MimeMessage message = new MimeMessage(session);

		// set message headers
		message.addHeader("Content-type", "text/HTML; charset=UTF-8");
		message.addHeader("format", "flowed");
		message.addHeader("Content-Transfer-Encoding", "8bit");

		// 보내는 사람 
		message.setFrom(new InternetAddress(SMTP_USERNAME));

		// 답장 받는 메일 
		message.setReplyTo(InternetAddress.parse(SMTP_USERNAME, false));

		// 제목 
		message.setSubject(subject, "UTF-8");

		// 본문 
		message.setText(contents, "UTF-8", "html");

		// 보낸 시간 
		message.setSentDate(new Date());

		// 받는 사람 
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipients, false));

		// 메일 발송 
		Transport.send(message);
	}

	/**
	 * 첨부파일 포함 메일 전송 
	 * @param session {@link javax.mail.Session}
	 * @param recipients 수신자 
	 * @param subject 제목 
	 * @param contents 본문 
	 * @param attachment 첨부파일 
	 * @throws MessagingException 
	 */
	private void sendMailWithAttachment(Session session, String recipients, String subject, String contents, File attachment) throws MessagingException {

		MimeMessage message = new MimeMessage(session);

		// set message headers
		message.addHeader("Content-type", "text/HTML; charset=UTF-8");
		message.addHeader("format", "flowed");
		message.addHeader("Content-Transfer-Encoding", "8bit");

		// 보내는 사람 
		message.setFrom(new InternetAddress(SMTP_USERNAME));

		// 답장 받는 메일 
		message.setReplyTo(InternetAddress.parse(SMTP_USERNAME, false));

		// 제목 
		message.setSubject(subject, "UTF-8");

		// 보낸 시간 
		message.setSentDate(new Date());

		// 받는 사람 
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipients, false));

		// Create the message body part
		BodyPart messageBodyPart = new MimeBodyPart();

		// 본문 
		messageBodyPart.setContent(contents, "text/html");

		// Create a multipart message for attachment
		Multipart multipart = new MimeMultipart();

		// Set text message part
		multipart.addBodyPart(messageBodyPart);

		// Second part is attachment
		messageBodyPart = new MimeBodyPart();

		DataSource source = new FileDataSource(attachment);
		messageBodyPart.setDataHandler(new DataHandler(source));
		messageBodyPart.setFileName(attachment.getName());
		multipart.addBodyPart(messageBodyPart);

		// Send the complete message parts
		message.setContent(multipart);

		// 메일 발송 
		Transport.send(message);
	}

	/**
	 * 인증 없는 메일 전송 
	 * @param recipients 수신자
	 * @param subject 제목
	 * @param contents 본문
	 * @param attachment 첨부파일
	 * @throws MessagingException 
	 */
	private void sendMailWithoutAuth(String recipients, String subject, String contents, File attachment) throws MessagingException {

//		Properties props = System.getProperties();
//		props.put("mail.smtp.host", SMTP_HOST); // SMTP Host
//
//		Session session = Session.getInstance(props, null);
//		session.setDebug(MAIL_DEBUG);

		if(CommonUtils.isNull(attachment)) {
			this.sendMailWithoutAttachment(this.session, recipients, subject, contents);
		} else {
			this.sendMailWithAttachment(this.session, recipients, subject, contents, attachment);
		}
	}

	/**
	 * TLS 인증 메일 전송 
	 * @param recipients 수신자
	 * @param subject 제목
	 * @param contents 본문
	 * @param attachment 첨부파일
	 * @throws MessagingException 
	 */
	private void sendMailWithTLSAuth(String recipients, String subject, String contents, File attachment) throws MessagingException {

//		Properties props = new Properties();
//		props.put("mail.smtp.host", SMTP_HOST); // SMTP Host
//		props.put("mail.smtp.port", SMTP_PORT); // TLS Port
//		props.put("mail.smtp.auth", SMTP_AUTH); // Enable Authentication
//		props.put("mail.smtp.starttls.enable", SMTP_TLS_ENABLE); // Enable STARTTLS
//
//		// Create Authenticator object to pass in Session.getInstance argument
//		Authenticator auth = new Authenticator() {
//
//			//override the getPasswordAuthentication method
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);
//			}
//		};
//
//		Session session = Session.getInstance(props, auth);
//		session.setDebug(MAIL_DEBUG);

		if(CommonUtils.isNull(attachment)) {
			this.sendMailWithoutAttachment(this.session, recipients, subject, contents);
		} else {
			this.sendMailWithAttachment(this.session, recipients, subject, contents, attachment);
		}
	}

	/**
	 * SSL 인증 메일 전송 
	 * @param recipients 수신자
	 * @param subject 제목
	 * @param contents 본문
	 * @param attachment 첨부파일
	 * @throws MessagingException 
	 */
	private void sendMailWithSSLAuth(String recipients, String subject, String contents, File attachment) throws MessagingException {

//		Properties props = new Properties();
//		props.put("mail.smtp.host", SMTP_HOST); // SMTP Host
//		props.put("mail.smtp.port", SMTP_PORT); // SSL Port
//		props.put("mail.smtp.auth", SMTP_AUTH); // Enable Authentication
//		props.put("mail.smtp.socketFactory.port", SMTP_SSL_PORT); // SSL Port
//		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); // SSL Factory Class
//
//		// Create Authenticator object to pass in Session.getInstance argument
//		Authenticator auth = new Authenticator() {
//
//			//override the getPasswordAuthentication method
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);
//			}
//		};
//
//		Session session = Session.getInstance(props, auth);
//		session.setDebug(MAIL_DEBUG);

		if(CommonUtils.isNull(attachment)) {
			this.sendMailWithoutAttachment(this.session, recipients, subject, contents);
		} else {
			this.sendMailWithAttachment(this.session, recipients, subject, contents, attachment);
		}
	}

	/**
	 * 메일 전송 
	 * @param recipients 수신자
	 * @param subject 제목
	 * @param contents 본문
	 * @param attachment 첨부파일
	 * @throws MessagingException 
	 */
	public void sendMail(String recipients, String subject, String contents, File attachment) throws MessagingException {

		if(!MAIL_USE) {
			return;
		}

		if(SMTP_TEST) {
			recipients = SMTP_TEST_TO;
		}

		if(StringUtils.isEmpty(recipients)) {

			log.error("mail recipients is null");
			return;
		}

		if (StringUtils.equalsIgnoreCase(MAIL_TYPE, "TLS")) {
			sendMailWithTLSAuth(recipients, subject, contents, attachment);
		} else if (StringUtils.equalsIgnoreCase(MAIL_TYPE, "SSL")) {
			sendMailWithSSLAuth(recipients, subject, contents, attachment);
		} else {
			sendMailWithoutAuth(recipients, subject, contents, attachment);
		}
	}

	/**
	 * 메일 전송 
	 * @param contentId Content ID
	 * @param contentMap Content Map
	 * @throws MessagingException 
	 */
	@Async
	public void sendMailByContent(String contentId, Map<String, Object> contentMap) {

		long startTime = System.currentTimeMillis();
		long finishTime;
		long elapsedTime;
		boolean isLogResult = true;
		String logMessage = "";
		String logContent = "";
		String logType = "LOG_TYPE_MAIL";

		try {

			Optional<ContentEntity> contentEntity = this.contentRepository.findById(contentId);
			if(contentEntity.isPresent()) {

				String scheme = environment.getProperty("server.scheme");
				String host = environment.getProperty("server.host");
				String port = environment.getProperty("server.port");
				String url = scheme + "://" + host;
				if(!StringUtils.equals(port, "8443")) {
					url += ":" + port;
				}

				String subject = contentEntity.get().getSubject();
				String content = contentEntity.get().getContent();

				String toSql = CommonUtils.transVarsByData(contentEntity.get().getToSql(), contentMap);
				List<String> toResultList = commonMapper.getListToStringBySQL(toSql);
				List<String> toList = new ArrayList<String>();
				for (String to : toResultList) {
					if(StringUtils.isNotEmpty(to)) {
						toList.add(to);
					}
				}

				String contentSql = CommonUtils.transVarsByData(contentEntity.get().getContentSql(), contentMap);
				Map<String, Object> contentResult = commonMapper.getObjectToMapBySQL(contentSql);
				contentResult.put("url", url);
				contentResult.put("scheme", scheme);
				contentResult.put("host", host);
				contentResult.put("port", port);

				subject = CommonUtils.transVarsByData(subject, contentResult);
				content = CommonUtils.transVarsByData(content, contentResult);
				logContent = content;

				String recipients = String.join(",", toList);

				if(!toList.isEmpty()) {
					this.sendMail(recipients, subject, content, null);
				} else {

					log.error("mail recipients is null");
					return;
				}
			}

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = true;
			logMessage = "elapsedTime : " + elapsedTime + "ms";
		} catch (Exception e) {

			finishTime = System.currentTimeMillis();
			elapsedTime = finishTime - startTime;
			isLogResult = false;
			logMessage = "elapsedTime : " + elapsedTime + "ms";
			logContent = e.getMessage();
		}

		this.logService.create(logType, logMessage, logContent, isLogResult);
	}

	/**
	 * 메일 전송 
	 * @param key
	 * @param controlId
	 */
	@Async
	public void sendMailByControl(String key, String controlId) {

		Optional<ControlEntity> controlEntity = this.controlRepository.findById(controlId);
		if(StringUtils.isNotEmpty(controlEntity.get().getContentId())) {

			Map<String, Object> contentMap = new HashMap<>();
			contentMap.put("id", key);
			this.sendMailByContent(controlEntity.get().getContentId(), contentMap);
		}
	}
}