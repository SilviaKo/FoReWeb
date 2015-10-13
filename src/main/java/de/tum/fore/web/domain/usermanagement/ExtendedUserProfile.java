package de.tum.fore.web.domain.usermanagement;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown=true)
public class ExtendedUserProfile {
		
	private double totalCholesterol;
	private double ldlCholesterol;
	private double hdlCholesterol;
	private double triglycerides;
	private double glucose;
	private double omega3Index;
	
}
