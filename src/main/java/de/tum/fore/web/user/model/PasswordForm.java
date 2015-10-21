package de.tum.fore.web.user.model;

import lombok.Data;

@Data
public class PasswordForm {

	private String oldPassword;
	private String newPassword;
	private String confirmNewPassword;
		
}
