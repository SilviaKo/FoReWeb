package de.tum.fore.web.user.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown=true)
public class User {

	private UserId userId;
	private UserSecurity userSecurity;
	private UserProfile userProfile;
	private ExtendedUserProfile extendedUserProfile;

}
