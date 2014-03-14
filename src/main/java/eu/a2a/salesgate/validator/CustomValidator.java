package eu.a2a.salesgate.validator;

import java.util.List;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import eu.a2a.salesgate.pratiche.bean.CampiObbligatori;

public interface CustomValidator extends Validator {

  public void validate(Object object, Errors errors, List<CampiObbligatori> campiObbligatori);

}
