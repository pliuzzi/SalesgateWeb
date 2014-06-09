package eu.a2a.salesgate.generator;

import org.springframework.integration.Message;
import org.springframework.integration.file.FileNameGenerator;
import org.springframework.stereotype.Component;

@Component
public class HeadersFileNameGenerator implements FileNameGenerator {

  @Override
  public String generateFileName(Message<?> message) {

    return (String) message.getHeaders().get("FILE_NAME");
  }

}
