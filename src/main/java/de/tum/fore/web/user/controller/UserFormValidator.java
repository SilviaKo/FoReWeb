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

		UserForm userForm = (UserForm) target; 
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstname", null, "Vorname muss vorhanden sein!");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastname", null, "Nachname muss vorhanden sein!");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "birthdayDay", null, "Tag muss vorhanden sein!");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "birthdayMonth", null, "Monat muss vorhanden sein!");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "birthdayYear", null, "Jahr muss vorhanden sein!");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sex", null, "Geschlecht muss vorhanden sein!");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "height", null, "Größe muss vorhanden sein!");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "weight", null, "Größe muss vorhanden sein!");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "hipmeasurement", null, "Hüftumfang muss vorhanden sein!");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "waistmeasurement", null, "Taillenumfang muss vorhanden sein!");
		
		if(userForm.getBirthdayDay() == -1) {
			errors.rejectValue("birthdayDay", null, "Tag muss vorhanden sein!");
		}
		
		if(userForm.getBirthdayMonth() == -1) {
			errors.rejectValue("birthdayMonth", null, "Monat muss vorhanden sein!");
		}
		
		if(userForm.getBirthdayYear() == -1) {
			errors.rejectValue("birthdayYear", null, "Jahr muss vorhanden sein!");
		}
		
		if(userForm.getHeight() < 100) {
			errors.rejectValue("height", null, "Größe muss größer oder gleich 100 cm sein.");
		}
		
		if(userForm.getWeight() <= 0) {
			errors.rejectValue("weight", null, "Gewicht muss vorhanden sein!");
		}
		
		if(userForm.getHipmeasurement() <= 0) {
			errors.rejectValue("hipmeasurement", null, "Hüftumfang muss vorhanden sein!");
		}
		
		if(userForm.getWaistmeasurement() <= 0) {
			errors.rejectValue("waistmeasurement", null, "Taillenumfang muss vorhanden sein!");
		}
		
		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "personalActivityLevel", null, "Jahr muss vorhanden sein!");
		
		
	}

}
