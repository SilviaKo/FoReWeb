package de.tum.fore.web.user.controller;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import de.tum.fore.web.user.model.PasswordForm;

@Component
public class PasswordFormValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		
		return PasswordForm.class.equals(clazz);
		
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		PasswordForm form = (PasswordForm) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "oldPassword", null, "Bitte geben Sie das alte Passwort ein.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "newPassword", null, "Bitte geben Sie das neue Passwort ein.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmNewPassword", null, "Bitte geben Sie das neue Passwort erneut ein.");
		
		if(form.getNewPassword() != null &&
			form.getConfirmNewPassword() != null &&
			!form.getNewPassword().equals(form.getConfirmNewPassword())) {
			
			errors.rejectValue("newPassword", null, "Dieses Passwort stimmt nicht mit ...");
			errors.rejectValue("confirmNewPassword", null, "... diesem Passwort überein.");
			
		}
		
	}

}
