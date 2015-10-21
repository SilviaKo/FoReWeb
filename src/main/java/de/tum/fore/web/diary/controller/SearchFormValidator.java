package de.tum.fore.web.diary.controller;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import de.tum.fore.web.diary.model.SearchForm;

@Component
public class SearchFormValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return SearchForm.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "searchExpression", null, "Bitte geben Sie einen Suchbegriff ein!");
		
	}

}
