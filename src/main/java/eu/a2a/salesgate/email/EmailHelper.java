package eu.a2a.salesgate.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Component;

@Component
public class EmailHelper {

	@Autowired
	private JavaMailSenderImpl mailSender;

}
