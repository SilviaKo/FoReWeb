package de.tum.fore.web.user.controller;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import de.tum.fore.web.user.model.UserForm;

@Component
public class UserFormValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return UserForm.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstname", null, "Vorname muss vorhanden sein!");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastname", null, "Nachname muss vorhanden sein!");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "birthdayDay", null, "Tag muss vorhanden sein!");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "birthdayMonth", null, "Monat muss vorhanden sein!");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "birthdayYear", null, "Jahr muss vorhanden sein!");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sex", null, "Jahr muss vorhanden sein!");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "height", null, "Jahr muss vorhanden sein!");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "weight", null, "Jahr muss vorhanden sein!");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "diseases", null, "Jahr muss vorhanden sein!");
		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "personalActivityLevel", null, "Jahr muss vorhanden sein!");
		
		
	}

}
