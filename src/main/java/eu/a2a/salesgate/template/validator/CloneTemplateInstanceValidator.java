package eu.a2a.salesgate.template.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import eu.a2a.salesgate.template.bean.TemplateInstance;
import eu.a2a.salesgate.template.service.TemplateService;
import eu.a2a.salesgate.validator.base.AbstractValidator;

@Component("cloneTemplateInstanceValidatorSalesgate")
public class CloneTemplateInstanceValidator extends AbstractValidator implements Validator {

  @Autowired
  TemplateService templateServiceSalesgate;

  @Override
  public boolean supports(Class<?> tiClass) {
    return TemplateInstance.class.equals(tiClass);
  }

  @Override
  public void validate(Object target, Errors errors) {

    TemplateInstance ti = (TemplateInstance) target;

    int n = templateServiceSalesgate.verifiyEventCode(ti);
    if (n > 0) {
      errors.rejectValue("codiceServizio.code", "required", "Template esistente per questo codice servizio");
      errors.rejectValue("codFlusso.id", "required", "Template esistente per questo codice flusso");
    }
  }

}
