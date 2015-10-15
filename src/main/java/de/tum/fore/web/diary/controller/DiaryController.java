package de.tum.fore.web.diary.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import de.tum.fore.api.model.diary.DetailedFoodItem;
import de.tum.fore.api.model.diary.DiaryEntry;
import de.tum.fore.api.model.diary.SimpleFoodItem;

@Controller
@RequestMapping(path="user/diary/")
public class DiaryController {

	@Autowired
	private OAuth2RestTemplate template;
	
	@Autowired
	@Qualifier(value="serverUrl")
	private String serverUrl;
	
	@RequestMapping(path="/")
	public String overview(ModelMap modelMap) {
		
		LocalDate date = LocalDate.now();
		LocalDate yesterday = date.minusDays(1);
		
		String url = serverUrl + "api/rest/diary/find/entriesByDate/" + date;
		
		Map<String, List<DiaryEntry>> entries = template.getForObject(url, Map.class);
		
		modelMap.addAttribute("entries", entries);
		modelMap.addAttribute("date", Date.from((date.atStartOfDay().atZone(ZoneId.systemDefault())).toInstant()));
		modelMap.addAttribute("yesterday", Date.from((yesterday.atStartOfDay().atZone(ZoneId.systemDefault())).toInstant()));
		
		return "diary/overview";
		
	}
	
	@RequestMapping(path="/{dateString}")
	public String overview(@PathVariable String dateString, ModelMap modelMap) {
		
		System.out.println(dateString);
		
		LocalDate date = LocalDate.parse(dateString);
		modelMap.addAttribute("date", Date.from((date.atStartOfDay().atZone(ZoneId.systemDefault())).toInstant()));
		
		LocalDate yesterday = date.minusDays(1);
		modelMap.addAttribute("yesterday", Date.from((yesterday.atStartOfDay().atZone(ZoneId.systemDefault())).toInstant()));
		
		if(date.compareTo(LocalDate.now()) < 0) {
			
			LocalDate tomorrow = date.plusDays(1); 
			modelMap.addAttribute("tomorrow", Date.from((tomorrow.atStartOfDay().atZone(ZoneId.systemDefault())).toInstant()));
			
		}
		
		String url = serverUrl + "api/rest/diary/find/entriesByDate/" + date;
		
		Map<String, List<DiaryEntry>> entries = template.getForObject(url, Map.class);
		
		modelMap.addAttribute("entries", entries);
	
		
		return "diary/overview";
		
		
	}
	
	
	@RequestMapping(path="search", method=RequestMethod.GET)
	public String searchGet() {
		
		return "diary/search";
		
	}
	
	@RequestMapping(path="search", method=RequestMethod.POST)
	public String searchPost(@RequestParam String searchQuery, ModelMap modelMap, HttpSession session) {
		
		String url = serverUrl + "api/rest/diary/search/" + searchQuery;
		
		List<SimpleFoodItem> entries = template.getForObject(url, ArrayList.class);
		
		modelMap.addAttribute("diaryEntries", entries);
		modelMap.addAttribute("searchQuery", searchQuery);
		modelMap.addAttribute("foodItem", new SimpleFoodItem());
		
		return "diary/search";
		
	}

	@RequestMapping(path="add", method=RequestMethod.POST)
	public String add(@ModelAttribute SimpleFoodItem simpleFoodItem, ModelMap modelMap) {
		
		DetailedFoodItem detailedFoodItem = new DetailedFoodItem(simpleFoodItem);
		
		modelMap.put("detailedFoodItem", detailedFoodItem);
		
		Map<String, String> meals = new LinkedHashMap<>();
		meals.put("Breakfast", "Frühstück");
		meals.put("Lunch", "Mittagessen");
		meals.put("Dinner", "Abendessen");
		meals.put("Snack", "Snack");
		meals.put("Drink", "Getränk");
		meals.put("Other", "Sonstiges");
		
		modelMap.put("meals", meals);
		
		return "diary/add";
		
	}
	
	private void test() {
		
	}
	
	@RequestMapping(path="save", method=RequestMethod.POST)
	public String save(@ModelAttribute DetailedFoodItem detailedFoodItem, ModelMap modelMap) {
		
		String url = serverUrl + "api/rest/diary/addEntry";
		template.postForObject(url, detailedFoodItem, HttpStatus.class);
		
		return "redirect:/user/diary/";
		
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
