package eu.a2a.salesgate.pratiche.ele.validator;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import eu.a2a.salesgate.pratiche.bean.CampiObbligatori;
import eu.a2a.salesgate.pratiche.ele.bean.LavoriEle;
import eu.a2a.salesgate.validator.CustomValidator;

@Component
// ("LavoriGasValidator")
public class LavoriEleValidator implements CustomValidator {

  @Override
  public boolean supports(Class<?> praticaClass) {
    return LavoriEle.class.equals(praticaClass);
  }

  @Override
  public void validate(Object object, Errors errors) {

    validate(object, errors, new ArrayList<CampiObbligatori>());
  }

  @Override
  public void validate(Object object, Errors errors, List<CampiObbligatori> campiObbligatori) {

    LavoriEle pratica = (LavoriEle) object;

    Iterator<CampiObbligatori> iterator = campiObbligatori.iterator();

    while (iterator.hasNext()) {

      CampiObbligatori campo = iterator.next();

      ValidationUtils.rejectIfEmpty(errors, campo.getCampo(), "default", "Il campo " + campo.getAlert() + " ? obbligatorio");

    }

  }

}
