package eu.a2a.salesgate.normalizzatore.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import eu.a2a.salesgate.template.bean.TemplateInstance;
import eu.a2a.salesgate.validator.base.AbstractValidator;

@Component("templateInstanceValidatorSdm")
public class TemplateInstanceValidator extends AbstractValidator implements Validator {

  @Autowired
  Validator cloneTemplateInstanceValidatorSdm;

  @Override
  public boolean supports(Class<?> tiClass) {
    return TemplateInstance.class.equals(tiClass);
  }

  @Override
  public void validate(Object target, Errors errors) {

    TemplateInstance ti = (TemplateInstance) target;

    if (StringUtils.isEmpty(ti.getId())) {
      ValidationUtils.invokeValidator(cloneTemplateInstanceValidatorSdm, target, errors);
    }

    if (StringUtils.isEmpty(ti.getCodiceServizio().getCode())) {
      errors.rejectValue("codiceServizio.code", "required", "Selezionare il codice servizio");
    }
    if (StringUtils.isEmpty(ti.getCodFlusso().getId())) {
      errors.rejectValue("codFlusso.id", "required", "Selezionare il codice flusso");
    }

    if ((ti.getAnagTemplate().getFirstRow() == null) || (StringUtils.isEmpty(ti.getAnagTemplate().getFirstRow().toString()))) {
      errors.rejectValue("anagTemplate.firstRow", "required", "Indicare l'inizio riga del file");
    }
    if ((ti.getAnagTemplate().getnMaxRighe() == null) || (StringUtils.isEmpty(ti.getAnagTemplate().getnMaxRighe().toString()))) {
      errors.rejectValue("anagTemplate.nMaxRighe", "required", "Indicare il numero massimo di record del file");
    }
    if ((ti.getAnagTemplate().getSeparatore() == null) || (StringUtils.isEmpty(ti.getAnagTemplate().getSeparatore())) && (ti.getAnagTemplate().getFileType().getId().equals("2"))) {
      errors.rejectValue("anagTemplate.separatore", "required", "Il separatore è obbligatorio se il tipo file è \"Testo Delimitato CSV\"");
    }
  }

}
