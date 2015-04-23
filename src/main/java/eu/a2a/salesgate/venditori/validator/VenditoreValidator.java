package eu.a2a.salesgate.venditori.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import eu.a2a.salesgate.validator.base.AbstractValidator;
import eu.a2a.salesgate.venditori.bean.Venditore;

@Component
public class VenditoreValidator extends AbstractValidator implements Validator {
	@Override
	public boolean supports(Class<?> venditoreClass) {
		return Venditore.class.equals(venditoreClass);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		Venditore venditore = (Venditore) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nome", "default", "Il campo Nome è obbligatorio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ptIva", "default", "Il campo Partita IVA è obbligatorio");
	}
}
