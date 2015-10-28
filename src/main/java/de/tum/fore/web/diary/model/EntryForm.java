package de.tum.fore.web.diary.model;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class EntryForm {

	@NotEmpty
	private String foodId;
	@NotEmpty
	private String dataSource;
	@NotEmpty
	private String name;
	@NotEmpty
	private String date;
	@NotEmpty
	private String meal;
	private double quantityServing;
	private double quantityManual;
	
}
