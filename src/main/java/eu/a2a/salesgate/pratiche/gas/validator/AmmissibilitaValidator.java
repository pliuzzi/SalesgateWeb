package eu.a2a.salesgate.pratiche.gas.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.web.util.HtmlUtils;

import eu.a2a.salesgate.pratiche.bean.Tracking;

@Component
public class AmmissibilitaValidator implements Validator {

  @Override
  public boolean supports(Class<?> obj) {
    return Tracking.class.equals(obj);
  }

  @Override
  public void validate(Object data, Errors errors) {

    ValidationUtils.rejectIfEmpty(errors, "codicePraticaDl", "default", HtmlUtils.htmlEscape("Il codice pratica distributore è obbligatorio"));
    ValidationUtils.rejectIfEmpty(errors, "anagAmmissibilita.id", "default", "Selezionare una causale");

  }

}
