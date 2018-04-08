package com.miniproject.kel2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.miniproject.kel2.model.Category;
import com.miniproject.kel2.service.CategoryService;

@Controller
@RequestMapping("/category")
public class CategoryController {

	@Autowired
	CategoryService categoryService;
	
	@RequestMapping
	public String index(Model model) {
		//List<Category> cats = categoryService.selectAll();
		List<Category> cats = categoryService.getListByStatus();
		model.addAttribute("cats", cats); 
		return "category";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String indexBySearch(@RequestParam(value="search", defaultValue="") String search, Model model) {
		List<Category> cats = categoryService.getCategoryBySearchName(search);
		model.addAttribute("cats", cats);
		System.out.println("search : " + cats.size());
		return "category";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody Category cat) {
		categoryService.saveAtauUpdate(cat);
	}

	@RequestMapping(value = "/get-one/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Category getOne(@PathVariable long id) {
		return categoryService.getOne(id);
	}

	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Category cat) {
		categoryService.update(cat);
	}

	@RequestMapping(value = "/updateStatus", method = RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void updateStatus(@RequestBody Category cat) {
		categoryService.updateStatus(cat);
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable long id) {
		categoryService.delete(id);
	}
	
	//validasi category name
	/*@RequestMapping(value="/search-name-valid/{search}", method=RequestMethod.GET)
	@ResponseBody
	public List<Category> searchNameValidation(@PathVariable String search){
		List<Category> cats = categoryService.searchByNameValidation(search);
		System.out.println("category valid : " +cats.size());
		return cats;
	}*/
	
	@RequestMapping(value="/get-all", method=RequestMethod.GET)
	@ResponseBody
	public List<Category> getAll(){
		return categoryService.selectAll(); 
	}
}
