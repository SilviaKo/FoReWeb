package de.tum.fore.web.diary.model;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class SearchForm {

	@NotEmpty(message="Bitte geben Sie einen Suchbegriff ein!")
	private String searchExpression;
	
}
