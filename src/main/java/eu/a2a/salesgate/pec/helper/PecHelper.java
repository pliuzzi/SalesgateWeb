package eu.a2a.salesgate.pec.helper;

import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.NoSuchProviderException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;

import org.apache.log4j.Logger;

import eu.a2a.salesgate.utility.StringUtils;

public class PecHelper {

  private static final Logger logger = Logger.getLogger(PecHelper.class);

  @SuppressWarnings("unused")
  public static void send(String host, int port, String username, String password, String from, String to, String subject, String content, byte[] attachment, String fileName, String fileType) {

    Properties props = new Properties();
    Authenticator auth = null;
    Session mailSession = null;
    if (1 < 1) {
      /*
       * props.put("mail.transport.protocol", "smtp");
       * props.put("mail.smtp.host", "smtp.gmail.com");
       * props.put("mail.smtp.port", 587); props.put("mail.smtp.auth", "true");
       * props.put("mail.smtp.starttls.enable", "true");
       */

      props.put("mail.transport.protocol", "smtp");
      props.put("mail.smtp.host", "smtpapp.group.local");
      props.put("mail.smtp.port", 25);
      // props.put("mail.smtp.auth", "true");
      // props.put("mail.smtp.starttls.enable", "true");

      mailSession = Session.getInstance(props);

    } else {

      props.put("mail.transport.protocol", "smtp");
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.port", port);
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.socketFactory.port", "465");
      props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

      auth = new PECAuthenticator(username, password);
      mailSession = Session.getInstance(props, auth);

    }

    try {
      Transport transport = mailSession.getTransport();
      Message msg = new MimeMessage(mailSession);
      Address afrom = new InternetAddress(from);
      String[] sato = to.split(";");
      Address[] ato = new Address[sato.length];

      for (int i = 0; i < ato.length; i++) {
        ato[i] = new InternetAddress(sato[i]);
      }

      msg.setFrom(afrom);
      msg.setRecipients(Message.RecipientType.TO, ato);
      msg.setSubject(subject);
      msg.setHeader("Content-Type", "text/html");

      BodyPart mailTextContent = new MimeBodyPart();
      mailTextContent.setContent(content, "text/html");

      Multipart mailContent = new MimeMultipart();
      BodyPart mailAttachmentContent = null;

      mailAttachmentContent = new MimeBodyPart();
      DataSource ds = new ByteArrayDataSource(attachment, fileType);
      mailAttachmentContent.setDataHandler(new DataHandler(ds));
      mailAttachmentContent.setFileName(fileName);
      mailContent.addBodyPart(mailAttachmentContent);

      mailContent.addBodyPart(mailTextContent, 0);

      msg.setContent(mailContent);
      msg.setSentDate(new Date());

      transport.connect();
      transport.sendMessage(msg, msg.getRecipients(Message.RecipientType.TO));
      transport.close();
    } catch (NoSuchProviderException e) {
      logger.error(StringUtils.getStackTrace(e));
    } catch (AddressException e) {
      logger.error(StringUtils.getStackTrace(e));
    } catch (MessagingException e) {
      logger.error(StringUtils.getStackTrace(e));
    }
  }
}

class PECAuthenticator extends Authenticator {

  private final String username;
  private final String password;

  public PECAuthenticator(String username, String password) {
    this.username = username;
    this.password = password;
  }

  @Override
  public PasswordAuthentication getPasswordAuthentication() {
    return new PasswordAuthentication(username, password);
  }

}
