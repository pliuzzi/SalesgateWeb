package eu.a2a.salesgate.validators;

import java.util.List;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import eu.a2a.salesgate.pratiche.beans.CampiObbligatori;

public interface CustomValidator extends Validator {

	public void validate(Object object, Errors errors, List<CampiObbligatori> campiObbligatori);

}
