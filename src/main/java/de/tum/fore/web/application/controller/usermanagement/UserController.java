package de.tum.fore.web.application.controller.usermanagement;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import de.tum.fore.web.application.model.usermanagement.UserForm;
import de.tum.fore.web.domain.usermanagement.Disease;
import de.tum.fore.web.domain.usermanagement.Religion;
import de.tum.fore.web.domain.usermanagement.User;

@Controller
@RequestMapping(value="/user")
public class UserController {

	@Autowired
	private OAuth2RestTemplate template;
	
	@Autowired
	@Qualifier(value="serverUrl")
	private String serverUrl;
	
	@Autowired
	private UserFormValidator userFormValidatior;
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.addValidators(userFormValidatior);
	}
	
	@RequestMapping(value="/profile", method=RequestMethod.GET)
	public String viewProfile(ModelMap models, HttpSession session) {
		

		
		
			session.setAttribute("user", template.getForObject(serverUrl + "api/rest/usermanagement/findMe", User.class));

		
		return "usermanagement/profile";
		
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.GET) 
	public String editProfileGet(ModelMap modelMap, HttpSession session) {
		
		User user = template.getForObject(serverUrl + "api/rest/usermanagement/findMe", User.class);
		
		Map<Disease, String> diseasesMap = new LinkedHashMap<Disease, String>(); 
		Map<Religion, String> religionMap = new LinkedHashMap<Religion, String>();

		for(Disease diseas : Disease.values()) {
			diseasesMap.put(diseas, diseas.getDescriptionDE());
		}
		
		for(Religion religion : Religion.values()) {
			religionMap.put(religion, religion.getDescriptionDE());
		}
		
		modelMap.addAttribute("diseasesMap", diseasesMap);
		modelMap.addAttribute("religionMap", religionMap);
		
		modelMap.addAttribute("userForm", new UserForm(user));
		
		return "usermanagement/edit";
		
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST) 
	public String editProfilePost(@ModelAttribute("userForm") @Validated UserForm form, BindingResult result, ModelMap modelMap, HttpSession session) {
		
		if(result.hasErrors()) {
			
			Map<Disease, String> diseasesMap = new LinkedHashMap<Disease, String>(); 
			Map<Religion, String> religionMap = new LinkedHashMap<Religion, String>();

			for(Disease diseas : Disease.values()) {
				diseasesMap.put(diseas, diseas.getDescriptionDE());
			}
			
			for(Religion religion : Religion.values()) {
				religionMap.put(religion, religion.getDescriptionDE());
			}
			
			modelMap.addAttribute("diseasesMap", diseasesMap);
			modelMap.addAttribute("religionMap", religionMap);
			
			return "usermanagement/edit";
		}
		
		User user = template.getForObject(serverUrl + "api/rest/usermanagement/findMe", User.class);
		
		user = form.populateUser(user);
		
		user.getUserId();
		
		template.postForObject(serverUrl + "api/rest/usermanagement/updateMe", user, HttpStatus.class);
		
		return "redirect:/user/profile";
	}
	
}
