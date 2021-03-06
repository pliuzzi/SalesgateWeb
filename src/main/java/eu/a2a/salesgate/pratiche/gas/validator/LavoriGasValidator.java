package eu.a2a.salesgate.pratiche.gas.validator;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import eu.a2a.salesgate.pratiche.bean.CampiObbligatori;
import eu.a2a.salesgate.pratiche.gas.bean.LavoriGas;
import eu.a2a.salesgate.validator.CustomValidator;
import eu.a2a.salesgate.validator.base.AbstractValidator;

@Component
// ("LavoriGasValidator")
public class LavoriGasValidator extends AbstractValidator implements CustomValidator {

  @Override
  public boolean supports(Class<?> praticaClass) {
    return LavoriGas.class.equals(praticaClass);
  }

  @Override
  public void validate(Object object, Errors errors) {

    validate(object, errors, new ArrayList<CampiObbligatori>());
  }

  @Override
  public void validate(Object object, Errors errors, List<CampiObbligatori> campiObbligatori) {

    LavoriGas pratica = (LavoriGas) object;

    Iterator<CampiObbligatori> iterator = campiObbligatori.iterator();

    while (iterator.hasNext()) {

      CampiObbligatori campo = iterator.next();

      ValidationUtils.rejectIfEmpty(errors, campo.getCampo(), "default", "Il campo " + campo.getAlert() + " � obbligatorio");

    }

  }

}
