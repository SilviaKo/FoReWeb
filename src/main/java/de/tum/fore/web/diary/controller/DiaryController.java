package de.tum.fore.web.diary.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import de.tum.fore.api.model.datasource.ApiFood;
import de.tum.fore.api.model.diary.ApiDiaryEntry;
import de.tum.fore.web.diary.model.SearchForm;

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
		
		Map<String, TreeMap<Integer, ApiDiaryEntry>> entries = template.getForObject(url, Map.class);
		
		modelMap.addAttribute("searchForm", new SearchForm());
		modelMap.addAttribute("entries", entries);
		modelMap.addAttribute("date", Date.from((date.atStartOfDay().atZone(ZoneId.systemDefault())).toInstant()));
		modelMap.addAttribute("yesterday", Date.from((yesterday.atStartOfDay().atZone(ZoneId.systemDefault())).toInstant()));
		
		return "diary/overview";
		
	}
	
	@RequestMapping(path="/{dateString}")
	public String overview(@PathVariable String dateString, ModelMap modelMap) {
		
		modelMap.addAttribute("searchForm", new SearchForm());
		
		LocalDate date = LocalDate.parse(dateString);
		modelMap.addAttribute("date", Date.from((date.atStartOfDay().atZone(ZoneId.systemDefault())).toInstant()));
		
		LocalDate yesterday = date.minusDays(1);
		modelMap.addAttribute("yesterday", Date.from((yesterday.atStartOfDay().atZone(ZoneId.systemDefault())).toInstant()));
		
		if(date.compareTo(LocalDate.now()) < 0) {
			
			LocalDate tomorrow = date.plusDays(1); 
			modelMap.addAttribute("tomorrow", Date.from((tomorrow.atStartOfDay().atZone(ZoneId.systemDefault())).toInstant()));
			
		}
		
		String url = serverUrl + "api/rest/diary/find/entriesByDate/" + date;
		
		Map<String, TreeMap<Integer, ApiDiaryEntry>> entries = template.getForObject(url, Map.class);
		
		modelMap.addAttribute("entries", entries);
	
		return "diary/overview";
		
		
	}
	
	
	@RequestMapping(path="search", method=RequestMethod.GET)
	public String searchGet(ModelMap modelMap) {
		
		modelMap.addAttribute("searchForm", new SearchForm());
		
		return "diary/search";
		
	}
	
	@RequestMapping(path="search", method=RequestMethod.POST)
	public String searchPost(@ModelAttribute @Valid SearchForm searchForm, BindingResult result, ModelMap modelMap, HttpSession session) {
		
		if(result.hasErrors()) {
			
			return "diary/search";
			
		}
		
		String url = serverUrl + "api/rest/dataSource/search/" + searchForm.getSearchExpression();
		
		List<ApiFood> entries = template.getForObject(url, ArrayList.class);
		
		modelMap.addAttribute("diaryEntries", entries);
		modelMap.addAttribute("searchExpression", searchForm.getSearchExpression());
		modelMap.addAttribute("foodItem", new ApiFood());
		
		return "diary/search";
		
	}

	@RequestMapping(path="add", method=RequestMethod.POST)
	public String add(@RequestParam String foodId, @RequestParam String dataSource, ModelMap modelMap) {
		
		String url = serverUrl + "api/rest/dataSource/findFrom/" + dataSource + "/entryByFoodId/" + foodId;
		
		ApiFood foodItem = template.getForObject(url, ApiFood.class);
		
		ApiDiaryEntry entry = new ApiDiaryEntry();
		entry.setFoodId(foodItem.getFoodId());
		entry.setDataSource(foodItem.getDataSource());
		entry.setName(foodItem.getName());
		
		modelMap.put("entry", entry);
		
		Map<String, String> meals = new LinkedHashMap<>();
		meals.put("Breakfast", "Frühstück");
		meals.put("Lunch", "Mittagessen");
		meals.put("Dinner", "Abendessen");
		meals.put("Snack", "Snack");
		meals.put("Drink", "Getränk");
		meals.put("Other", "Sonstiges");
		
		modelMap.put("meals", meals);
		
		modelMap.put("servings", foodItem.getServings());
		
		return "diary/add";
		
	}
	
	@RequestMapping(path="save", method=RequestMethod.POST)
	public String save(@ModelAttribute ApiDiaryEntry entry, ModelMap modelMap) {
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
		entry.setDate(LocalDate.parse(entry.getDate(), formatter).toString());
		
		String url = serverUrl + "api/rest/diary/addEntry";
		template.postForObject(url, entry, HttpStatus.class);
		
		return "redirect:/user/diary/";
		
	}
	
	@RequestMapping(path="delete", method=RequestMethod.POST)
	public String delete(@RequestParam String date, @RequestParam String meal, @RequestParam String id) {
		
		String url = serverUrl + "api/rest/diary/delete/" + date + "/" + meal + "/" + id;
		
		HttpStatus foodItem = template.getForObject(url, HttpStatus.class);
		
		return "redirect:/user/diary/";
		
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
