package de.tum.fore.web.domain.usermanagement;

public enum Religion {

	Christianity("Christentum"),
	Islam("Islam"),
	Hinduism("Hinduismus"),
	Buddhism("Buddhismus"),
	Judaism("Judentum"),
	Other("Sonstiges"),
	None("Keine");
	
	private String descriptionDE;
	
	private Religion(String descriptionDE) {
		this.descriptionDE = descriptionDE;
	}
	
	public String getDescriptionDE() {
		return descriptionDE;
	}
	
}