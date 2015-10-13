package de.tum.fore.web.application.controller.diary;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import de.tum.fore.web.domain.diary.DiaryEntry;

@Controller
@RequestMapping(path="user/diary/")
public class DiaryController {

	@Autowired
	private OAuth2RestTemplate template;
	
	@Autowired
	@Qualifier(value="serverUrl")
	private String serverUrl;
	
	@RequestMapping(path="/")
	public String overview() {
		
		return "diary/overview";
		
	}
	
	
	@RequestMapping(path="search", method=RequestMethod.GET)
	public String searchGet() {
		
		return "diary/search";
		
	}
	
	@RequestMapping(path="search", method=RequestMethod.POST)
	public String searchPost(@RequestParam String searchQuery) {
		
		String url = serverUrl + "api/rest/diary/search/" + searchQuery;
		
		List<DiaryEntry> entries = template.getForObject(url, ArrayList.class);
		
		System.out.println("################################ Diary Controller: " + entries);
		
		return "diary/search";
		
	}

	@RequestMapping(path="add", method=RequestMethod.POST)
	public String add() {
		
		return null;
		
	}
	
	@RequestMapping(path="delete", method=RequestMethod.POST)
	public String delete() {
		
		return null;
		
	}
	
	@RequestMapping(path="edit", method=RequestMethod.GET)
	public String editGet() {
		
		return null;
		
	}
	
	@RequestMapping(path="edit", method=RequestMethod.POST)
	public String editPost() {
		
		return null;
		
	}
	
}
