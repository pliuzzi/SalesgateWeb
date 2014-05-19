package eu.a2a.salesgate.distributori.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import eu.a2a.salesgate.distributori.bean.Distributore;
import eu.a2a.salesgate.validator.base.AbstractValidator;

@Component
public class DistributoreValidator extends AbstractValidator implements Validator {

  @Override
  public boolean supports(Class<?> distributoreClass) {
    return Distributore.class.equals(distributoreClass);
  }

  @Override
  public void validate(Object target, Errors errors) {

    Distributore distributore = (Distributore) target;

    ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "default", "Il campo Ragione Sociale � obbligatorio");
    ValidationUtils.rejectIfEmptyOrWhitespace(errors, "piva", "default", "Il campo Partita IVA � obbligatorio");
    ValidationUtils.rejectIfEmptyOrWhitespace(errors, "utility", "default", "Il campo Utility � obbligatorio");

  }

}
