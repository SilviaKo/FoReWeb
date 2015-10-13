package de.tum.fore.web.domain.usermanagement;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import de.tum.fore.web.commons.UserId;
import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown=true)
public class User {

	private UserId userId;
	private UserSecurity userSecurity;
	private UserProfile userProfile;
	private ExtendedUserProfile extendedUserProfile;

}
