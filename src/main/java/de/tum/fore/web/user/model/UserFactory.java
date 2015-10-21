package de.tum.fore.web.user.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class UserFactory {

	public static User createNewUser(
			String firstname,
			String lastname,
			Date birthday,
			Sex sex,
			Religion religion,
			double height,
			double weight,
			double hipmeasurement,
			double waistmeasurement,
			List<Disease> diseases,
			double personalActivityLevel) {
		
		UserProfile userProfile = new UserProfile();
		userProfile.setFirstname(firstname);
		userProfile.setLastname(lastname);
		userProfile.setBirthday(birthday);
		userProfile.setSex(sex);
		userProfile.setReligion(religion);
		userProfile.setHeight(height);
		userProfile.setWeight(weight);
		userProfile.setHipmeasurement(hipmeasurement);
		userProfile.setWaistmeasurement(waistmeasurement);
		userProfile.setDiseases(diseases);
		userProfile.setPersonalActivityLevel(personalActivityLevel);
		
		User user = new User();
		user.setUserProfile(userProfile);
		user.setExtendedUserProfile(null);
		
		return user;
		
	}
	
	public static UserId generateNewUserId(String firstname, String lastname, Date birthday) {
		
		SimpleDateFormat format = new SimpleDateFormat("ddMMyy");
		StringBuffer id = new StringBuffer();
		
		id.append(firstname.toUpperCase().charAt(0));
		id.append(lastname.toUpperCase().charAt(0));
		id.append("-");
		id.append(format.format(birthday));
		id.append("-");
		id.append((int)(Math.random() * 99));
		id.append("-");
		
		int checkSum = 0;
		
		for(int i = 0; i < id.length(); i++) {
			
			if(id.charAt(i) != '-') {
				checkSum += id.charAt(i);
			}
			
		}
		
		checkSum = checkSum % 100;
		
		id.append(checkSum);
		
		UserId userId = new UserId();
		userId.setId(id.toString());
		
		return userId;
		
	}
	
	public static UserId generateNewUserId(User user) {
	
		return generateNewUserId(user.getUserProfile().getFirstname(), 
				user.getUserProfile().getLastname(),
				user.getUserProfile().getBirthday());
		
	}
	
	public static User createNewUser(
			String firstname,
			String lastname,
			Date birthday,
			Sex sex,
			Religion religion,
			double height,
			double weight,
			double hipmeasurement,
			double waistmeasurement,
			List<Disease> diseases,
			double personalActivityLevel,
			double totalCholesterol,
			double ldlCholesterol,
			double hdlCholesterol,
			double triglycerides,
			double glucose,
			double omega3Index) {
		
		UserProfile userProfile = new UserProfile();
		userProfile.setFirstname(firstname);
		userProfile.setLastname(lastname);
		userProfile.setBirthday(birthday);
		userProfile.setSex(sex);
		userProfile.setReligion(religion);
		userProfile.setHeight(height);
		userProfile.setWeight(weight);
		userProfile.setHipmeasurement(hipmeasurement);
		userProfile.setWaistmeasurement(waistmeasurement);
		userProfile.setDiseases(diseases);
		userProfile.setPersonalActivityLevel(personalActivityLevel);
		
		ExtendedUserProfile extendedUserProfile = new ExtendedUserProfile();
		extendedUserProfile.setTotalCholesterol(totalCholesterol);
		extendedUserProfile.setLdlCholesterol(ldlCholesterol);
		extendedUserProfile.setHdlCholesterol(hdlCholesterol);
		extendedUserProfile.setTriglycerides(triglycerides);
		extendedUserProfile.setGlucose(glucose);
		extendedUserProfile.setOmega3Index(omega3Index);
		
		User user = new User();
		user.setUserProfile(userProfile);
		user.setExtendedUserProfile(extendedUserProfile);
		
		return user;
		
	}
	
}
