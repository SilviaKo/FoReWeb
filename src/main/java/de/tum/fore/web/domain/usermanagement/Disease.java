package de.tum.fore.web.domain.usermanagement;

public enum Disease {

	CardiovascularDisease("Kardiovaskuläre Erkrankung"),
	CoronaryHeartDisease("Koronare Herzkrankheit"),
	Type2DiabetesMellitus("Diabetes mellitus (Type-2-Diabetes)"),
	Cancer("Krebs");
	
	private String descriptionDE; 
	
	private Disease(String descriptionDE) {
		
		this.descriptionDE = descriptionDE;
		
	}
	
	public String getDescriptionDE() {
		return this.descriptionDE;
	}
	
}
