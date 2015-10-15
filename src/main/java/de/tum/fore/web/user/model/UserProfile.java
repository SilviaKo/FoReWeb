package de.tum.fore.web.user.model;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown=true)
public class UserProfile {
	
	private String firstname;
	private String lastname;
	private Date birthday;
	private Sex sex;
	private Religion religion;
	private double height;
	private double weight;
	private double hipmeasurement;
	private double weistmeasurement;
	private List<Disease> diseases;
	private double personalActivityLevel;
	
}
