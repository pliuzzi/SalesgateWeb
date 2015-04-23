package eu.a2a.salesgate.motivazioni.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import eu.a2a.salesgate.motivazioni.bean.Motivazione;
import eu.a2a.salesgate.validator.base.AbstractValidator;

public class MotivazioneValidator extends AbstractValidator implements Validator {
	@Override
	public boolean supports(Class<?> motivazioneClass) {
		return Motivazione.class.equals(motivazioneClass);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		Motivazione motivazione = (Motivazione) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "default", "Il campo Identificativo è obbligatorio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "codiceCausale", "default", "Il campo Codice Causale è obbligatorio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "motivazioneDistributore", "default", "Il campo Motivazione è obbligatorio");
	}
}
