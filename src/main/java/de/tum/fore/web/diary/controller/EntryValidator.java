package de.tum.fore.web.diary.controller;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import de.tum.fore.web.diary.model.EntryForm;

@Component
public class EntryValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return EntryForm.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		EntryForm form = (EntryForm) target;
		
		if(form.getMeal().equals("-1")) {
			
			errors.rejectValue("meal", null, "Bitte wählen Sie eine Mahlzeit.");
			
		}
		
		if(form.getQuantityServing() == -1 && form.getQuantityManual() == 0) {
			
			errors.rejectValue("quantityServing", null, "Bitte wählen Sie eine Menge hier ...");
			errors.rejectValue("quantityManual", null, "... oder hier.");
			
		}
		
		if(form.getQuantityServing() > 0 && form.getQuantityManual() > 0) {
			
			errors.rejectValue("quantityServing", null, "Bitte wählen Sie nur eine Menge hier ...");
			errors.rejectValue("quantityManual", null, "... oder hier. Nicht beides.");
			
		}
		
		if(form.getQuantityManual() < 0) {
			
			errors.rejectValue("quantityManual", null, "Menge muss positiv sein (> 0g).");
			
		}
		
	}
	
}