package eu.a2a.salesgate.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Component;

import eu.a2a.salesgate.base.Loggable;

@Component
public class EmailHelper extends Loggable {

  @Autowired
  private JavaMailSenderImpl mailSender;

}
