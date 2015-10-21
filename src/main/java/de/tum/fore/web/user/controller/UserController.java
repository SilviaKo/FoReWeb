package de.tum.fore.web.user.controller;

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

import de.tum.fore.web.user.model.Disease;
import de.tum.fore.web.user.model.PasswordForm;
import de.tum.fore.web.user.model.Religion;
import de.tum.fore.web.user.model.User;
import de.tum.fore.web.user.model.UserForm;

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
	
	@Autowired
	private PasswordFormValidator passwordFormValidator;
	
	@InitBinder("userForm")
	protected void initBinderUserForm(WebDataBinder binder) {
		binder.addValidators(userFormValidatior);
	}
	
	@InitBinder("passwordForm")
	protected void initBinderPasswordForm(WebDataBinder binder) {
		binder.addValidators(passwordFormValidator);
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
	
	@RequestMapping(value="/changePassword", method=RequestMethod.GET)
	public String changePasswordGet(ModelMap modelMap) {
		
		modelMap.addAttribute("passwordForm", new PasswordForm());
		
		return "usermanagement/changePassword";

	}
	
	@RequestMapping(value="/changePassword", method=RequestMethod.POST)
	public String changePasswordGet(@ModelAttribute @Validated PasswordForm passwordForm, BindingResult result, ModelMap modelMap) {
		
		if(result.hasErrors()) {
			
			return "usermanagement/changePassword";
			
		}
		
		HttpStatus response = template.getForObject(serverUrl + "api/rest/usermanagement/changePassword/" + passwordForm.getOldPassword() + "/" + passwordForm.getNewPassword(), HttpStatus.class);
		
		if(response == HttpStatus.BAD_REQUEST) {
			
			result.rejectValue("oldPassword", null, "Altes Password falsch!");
			
			return "usermanagement/changePassword";
			
		}
		
		
		return "redirect:/user/profile";
		
	}
	
}
