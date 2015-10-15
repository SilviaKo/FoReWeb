package de.tum.fore.web.misc.controller;

import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.OAuth2ClientContext;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.security.oauth2.client.token.grant.password.ResourceOwnerPasswordResourceDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import de.tum.fore.web.user.model.User;

@Controller
public class SecurityController {

	@Autowired
	private OAuth2ClientContext oAuth2ClientContext;
	
	@RequestMapping(path="/login", method=RequestMethod.GET)
	public String login() {
		
		return "main/login";
		
	}
	
	@RequestMapping(path="/login", method=RequestMethod.POST)
	public String login(@RequestParam String email, @RequestParam String password, HttpSession session) {
		
		ResourceOwnerPasswordResourceDetails details = new ResourceOwnerPasswordResourceDetails();
		details.setId("oauthTest/client");
		details.setClientId("my-trusted-client-with-secret");
		details.setClientSecret("somesecret");
		details.setAccessTokenUri("http://localhost:8080/FoReServer/oauth/token");
		details.setScope(Arrays.asList("read", "write", "trust"));
		details.setUsername(email);
		details.setPassword(password);
		
		OAuth2RestTemplate template = new OAuth2RestTemplate(details, oAuth2ClientContext);
		template.getOAuth2ClientContext().setAccessToken(template.getAccessToken());
		
		User user = template.getForObject("http://localhost:8080/FoReServer/api/rest/usermanagement/findMe", User.class);
		session.setAttribute("user", user);
		
		return "redirect:/";
		
	}
	
}
