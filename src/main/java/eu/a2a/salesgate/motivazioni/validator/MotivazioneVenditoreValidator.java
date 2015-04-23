package eu.a2a.salesgate.motivazioni.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import eu.a2a.salesgate.motivazioni.bean.Motivazione;
import eu.a2a.salesgate.motivazioni.bean.MotivazioneVenditore;
import eu.a2a.salesgate.validator.base.AbstractValidator;

public class MotivazioneVenditoreValidator extends AbstractValidator implements Validator {
	@Override
	public boolean supports(Class<?> motivazioneClass) {
		return Motivazione.class.equals(motivazioneClass);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		MotivazioneVenditore motivazioneVenditore = (MotivazioneVenditore) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "default", "Il campo Identificativo è obbligatorio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "codiceInterno", "default", "Il campo Codice Interno è obbligatorio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "motivazione", "default", "Il campo Motivazione è obbligatorio");
	}
}
