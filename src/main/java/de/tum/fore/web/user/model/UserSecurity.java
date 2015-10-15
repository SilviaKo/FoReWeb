package de.tum.fore.web.user.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown=true)
public class UserSecurity {

	private String email;
	private String password;
	private List<String> roles;
	
	public static UserSecurity fromUserDetails(UserDetails userDetails) {
		
		UserSecurity userSecurity = new UserSecurity();
		userSecurity.setEmail(userDetails.getUsername());
		userSecurity.setPassword(userDetails.getPassword());
		
		if(userDetails.getAuthorities() != null && userDetails.getAuthorities().size() != 0) {
			
			List<String> roles = new ArrayList<String>();
			
			for(GrantedAuthority authority : userDetails.getAuthorities()) {
				
				roles.add(authority.getAuthority());
				
			}

			userSecurity.setRoles(roles);
			
		}
		
		return userSecurity;
		
	}
	
}
