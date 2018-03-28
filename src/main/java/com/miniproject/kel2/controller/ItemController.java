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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.miniproject.kel2.model.Category;
import com.miniproject.kel2.model.Item;
import com.miniproject.kel2.model.ItemInventory;
import com.miniproject.kel2.model.ItemVariant;
import com.miniproject.kel2.service.ItemInventoryService;
import com.miniproject.kel2.service.ItemService;
import com.miniproject.kel2.service.ItemVariantService;

@Controller
@RequestMapping("/item")
public class ItemController {

	@Autowired
	ItemService itemService;
	
	@Autowired
	ItemVariantService itemVariantService;
	
	@Autowired
	ItemInventoryService itemInventoryService;
	
	@RequestMapping
	public String index (Model model) {
		List<Item> items = itemService.selectAll();
		List<Category> cats = itemService.catSelectAll();
		List<ItemVariant> variants = itemVariantService.selectAll();
		List<ItemInventory> inventories = itemInventoryService.selectAll();
		model.addAttribute("items", items);
		model.addAttribute("cats", cats);
		model.addAttribute("variants", variants);
		model.addAttribute("inventories", inventories);
		return "item";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	//@ResponseStatus(HttpStatus.CREATED)
	@ResponseBody
	public Item save(@RequestBody Item item) {
		itemService.save(item);
		return item;
	}

	@RequestMapping(value = "/get-one/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Item getOne(@PathVariable long id) {
		return itemService.getOne(id);
	}

	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Item item) {
		itemService.update(item);
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable long id) {
		Item item = new Item();
		item.setId(id);
		itemService.delete(item);
	}
	
}
