package de.tum.fore.web.config;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.YamlPropertiesFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.ClassPathResource;

@Configuration
@ComponentScan({"de.tum.fore.web.config"})
public class RootConfig {
	
	@Bean
	public static PropertySourcesPlaceholderConfigurer properties() {
	  
		PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer = new PropertySourcesPlaceholderConfigurer();
		YamlPropertiesFactoryBean yaml = new YamlPropertiesFactoryBean();
		yaml.setResources(new ClassPathResource("application.yml"));
	  	propertySourcesPlaceholderConfigurer.setProperties(yaml.getObject());
	  	return propertySourcesPlaceholderConfigurer;
	}
	
	@Bean
	@Qualifier(value="serverUrl")
	public String serverUrl(@Value("${server.protocol}") String protocol,
			@Value("${server.host}") String host,
			@Value("${server.port}") String port,
			@Value("${server.appname}") String appname) {
		
		StringBuffer sb = new StringBuffer();
		
		sb.append(protocol);
		sb.append("://");
		sb.append(host);
		
		if(port != null || port.equals("")) {
			sb.append(":");
			sb.append(port);
		}
		
		sb.append("/");
		sb.append(appname);
		sb.append("/");
		
		return sb.toString();
		
	}
	
}
