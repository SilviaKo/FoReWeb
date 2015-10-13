package de.tum.fore.web.config;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.oauth2.client.OAuth2ClientContext;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.security.oauth2.client.resource.BaseOAuth2ProtectedResourceDetails;
import org.springframework.security.oauth2.client.resource.OAuth2ProtectedResourceDetails;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableOAuth2Client;

@Configuration
@EnableOAuth2Client
public class OAuthClientConfig {

	@Autowired
	private OAuth2ClientContext oAuth2ClientContext;
	
	@Bean
	public OAuth2RestTemplate oauthRestTemplate() {
		
		OAuth2RestTemplate template = new OAuth2RestTemplate(baseOAuth2ProtectedResourceDetails(), oAuth2ClientContext);
		
		return template;
		
	}
	
	@Bean
	public OAuth2ProtectedResourceDetails baseOAuth2ProtectedResourceDetails() {
		
		BaseOAuth2ProtectedResourceDetails details = new BaseOAuth2ProtectedResourceDetails();
		details.setGrantType("refresh_token");
		details.setId("foreOAuth2/client");
		details.setClientId("my-trusted-client-with-secret");
		details.setClientSecret("somesecret");
		details.setAccessTokenUri("http://localhost:8080/FoReServer/oauth/token");
		details.setScope(Arrays.asList("read", "write", "trust"));
		
		return details;
		
		
	}
	
}
