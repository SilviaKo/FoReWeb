package de.tum.fore.web.diary.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import de.tum.fore.api.model.datasource.ApiFood;
import de.tum.fore.api.model.diary.ApiDiary;
import de.tum.fore.api.model.diary.ApiDiaryEntry;
import de.tum.fore.web.diary.model.EntryForm;
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
		
		return "forward:/user/diary/" + LocalDate.now();
		
	}
	
	@Autowired
	private EntryValidator entryValidator;
	
	@InitBinder("entryForm")
	protected void initBinderEntryForm(WebDataBinder binder) {
		binder.addValidators(entryValidator);
	}
	
	@RequestMapping(path="/{dateString}")
	public String overview(@PathVariable String dateString, ModelMap modelMap) {
		
		modelMap.addAttribute("searchForm", new SearchForm());
		
		LocalDate date = LocalDate.parse(dateString);
		modelMap.addAttribute("date", date);
		
		String url = serverUrl + "api/rest/diary/find/" + date;
		ApiDiary diary = template.getForObject(url, ApiDiary.class);
		modelMap.addAttribute("diary", diary);
		
		if(diary.getDateOfFirstEntry() != null && diary.getDateOfFirstEntry().isBefore(date)) {
		
			modelMap.addAttribute("yesterday", date.minusDays(1));
			
		}
		
		if(date.isBefore(LocalDate.now())) {
			
			modelMap.addAttribute("tomorrow", date.plusDays(1));
			
		}
	
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
		
		List<ApiFood> results = template.getForObject(url, ArrayList.class);
		
		modelMap.addAttribute("results", results);
		modelMap.addAttribute("searchExpression", searchForm.getSearchExpression());
		modelMap.addAttribute("food", new ApiFood());
		
		return "diary/search";
		
	}

	@RequestMapping(path="add", method=RequestMethod.POST)
	public String add(@RequestParam String foodId, @RequestParam String dataSource, ModelMap modelMap) {
		
		String url = serverUrl + "api/rest/dataSource/find/" + dataSource + "/" + foodId;
		
		ApiFood foodItem = template.getForObject(url, ApiFood.class);
		
		EntryForm form = new EntryForm();
		form.setFoodId(foodId);
		form.setDataSource(dataSource);
		form.setName(foodItem.getName());
		
		modelMap.put("entryForm", form);
		
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
	public String save(@ModelAttribute @Validated EntryForm form, BindingResult result, ModelMap modelMap) {
		
		if(result.hasErrors()) {
			
			String url = serverUrl + "api/rest/dataSource/find/" + form.getDataSource() + "/" + form.getFoodId();
			
			ApiFood foodItem = template.getForObject(url, ApiFood.class);
			
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
		
		ApiDiaryEntry entry = new ApiDiaryEntry();
		entry.setFoodId(form.getFoodId());
		entry.setDataSource(form.getDataSource());
		entry.setName(form.getName());
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
		entry.setDate(LocalDate.parse(form.getDate(), formatter).toString());
		
		entry.setMeal(form.getMeal());
		entry.setQuantity(form.getQuantityServing() != -1 ?  form.getQuantityServing() : form.getQuantityManual());
		
		String url = serverUrl + "api/rest/diary/add";
		template.postForObject(url, entry, HttpStatus.class);
		
		return "redirect:/user/diary/";
		
	}
	
	@RequestMapping(path="delete", method=RequestMethod.POST)
	public String delete(@RequestParam String date, @RequestParam String meal, @RequestParam String id) {
		
		String url = serverUrl + "api/rest/diary/delete/" + date + "/" + meal + "/" + id;
		
		template.delete(url);
		
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
