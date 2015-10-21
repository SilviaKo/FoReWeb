package de.tum.fore.web.user.model;

import java.util.Calendar;
import java.util.List;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class UserForm {
	
	// UserSecurity
	private String email;
	
	// UserProfile
	private String firstname;
	private String lastname;
	private int birthdayDay;
	private int birthdayMonth;
	private int birthdayYear;
	private Sex sex;
	private Religion religion;
	private double height;
	private double weight;
	private double hipmeasurement;
	private double waistmeasurement;
	private List<Disease> diseases;
	private double personalActivityLevel;
	
	// ExtendedUserProfile
	private double totalCholesterol;
	private double ldlCholesterol;
	private double hdlCholesterol;
	private double triglycerides;
	private double glucose;
	private double omega3Index;
	
	public UserForm() {}
	
	public UserForm(User user) {
		populateFromUser(user);
	}
	
	public void populateFromUser(User user) {
		
		this.setEmail(user.getUserSecurity().getEmail());
		
		this.setFirstname(user.getUserProfile().getFirstname());
		this.setLastname(user.getUserProfile().getLastname());
		
		if(user.getUserProfile().getBirthday() != null) {
		
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(user.getUserProfile().getBirthday());
			
			this.setBirthdayDay(calendar.get(Calendar.DAY_OF_MONTH));
			this.setBirthdayMonth(calendar.get(Calendar.MONTH) + 1);
			this.setBirthdayYear(calendar.get(Calendar.YEAR));
			
		}
		
		this.setSex(user.getUserProfile().getSex());
		this.setReligion(user.getUserProfile().getReligion());
		this.setHeight(user.getUserProfile().getHeight());
		this.setWeight(user.getUserProfile().getWeight());
		this.setHipmeasurement(user.getUserProfile().getHipmeasurement());
		this.setWaistmeasurement(user.getUserProfile().getWaistmeasurement());
		this.setDiseases(user.getUserProfile().getDiseases());
		this.setPersonalActivityLevel(user.getUserProfile().getPersonalActivityLevel());
		
		if(user.getExtendedUserProfile() != null) {
		
			this.setTotalCholesterol(user.getExtendedUserProfile().getTotalCholesterol());
			this.setLdlCholesterol(user.getExtendedUserProfile().getLdlCholesterol());
			this.setHdlCholesterol(user.getExtendedUserProfile().getHdlCholesterol());
			this.setTriglycerides(user.getExtendedUserProfile().getTriglycerides());
			this.setGlucose(user.getExtendedUserProfile().getGlucose());
			this.setOmega3Index(user.getExtendedUserProfile().getOmega3Index());
		
		}
		
	}
	
	public User populateUser(User user) {
		
		user.getUserProfile().setFirstname(this.firstname);
		user.getUserProfile().setLastname(this.lastname);
		
		Calendar calendar = Calendar.getInstance();
		calendar.set(this.birthdayYear, this.birthdayMonth - 1, this.birthdayDay);
		
		user.getUserProfile().setBirthday(calendar.getTime());
		user.getUserProfile().setReligion(this.religion);
		user.getUserProfile().setSex(this.sex);
		user.getUserProfile().setHeight(this.height);
		user.getUserProfile().setWeight(this.weight);
		user.getUserProfile().setHipmeasurement(this.hipmeasurement);
		user.getUserProfile().setWaistmeasurement(this.waistmeasurement);
		user.getUserProfile().setDiseases(this.diseases);
		user.getUserProfile().setPersonalActivityLevel(this.personalActivityLevel);
		
		if(user.getExtendedUserProfile() == null) {
			
			user.setExtendedUserProfile(new ExtendedUserProfile());
			
		}
		
		user.getExtendedUserProfile().setTotalCholesterol(this.totalCholesterol);
		user.getExtendedUserProfile().setLdlCholesterol(this.ldlCholesterol);
		user.getExtendedUserProfile().setHdlCholesterol(this.hdlCholesterol);
		user.getExtendedUserProfile().setTriglycerides(this.triglycerides);
		user.getExtendedUserProfile().setGlucose(this.glucose);
		user.getExtendedUserProfile().setOmega3Index(this.omega3Index);
		
		return user;
		
	}
	
}
