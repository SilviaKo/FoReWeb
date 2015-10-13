package de.tum.fore.web.domain.diary;

import java.util.Map;

import lombok.Data;

@Data
public class DiaryEntry {

	private String foodId;
	private String dataSource;
	
	private String description;
	private String foodGroup;
	private Map<String, Double> foodAttributes;
	private double quantity;
	
}
