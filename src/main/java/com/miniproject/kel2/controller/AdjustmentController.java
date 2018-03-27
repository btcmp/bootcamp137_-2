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

import com.miniproject.kel2.dao.DetailAdjustmentDao;
import com.miniproject.kel2.model.Adjustment;
import com.miniproject.kel2.model.DetailAdjustment;
import com.miniproject.kel2.model.HistoryAdjustment;
import com.miniproject.kel2.model.ItemInventory;
import com.miniproject.kel2.service.AdjustmentService;
import com.miniproject.kel2.service.DetailAdjustmentService;
import com.miniproject.kel2.service.HistoryAdjustmentService;
import com.miniproject.kel2.service.ItemInventoryService;

import jdk.internal.instrumentation.InstrumentationMethod;

@Controller
@RequestMapping("/adjustment")
public class AdjustmentController {
	
	@Autowired
	AdjustmentService adjustmentService;
	
	@Autowired
	ItemInventoryService itemInvetoryService;
	
	@Autowired
	DetailAdjustmentService detAdjustmentService;
	
	@Autowired
	HistoryAdjustmentService hisAdjustmentService;

	@RequestMapping
	public String index(Model model) {
		List<Adjustment> adjustments = adjustmentService.selectAll();
//		List<ItemInventory> inventories = itemInvetoryService.selectAll();
		model.addAttribute("listAdjustment", adjustments);
//		model.addAttribute("listInventory", inventories);
		return "adjustment2";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody Adjustment adjustment) {
		adjustmentService.save(adjustment);
		System.out.println(adjustment);
	}
	
	@RequestMapping(value="/search-item/{word}", method = RequestMethod.GET)
	@ResponseBody
	public List<ItemInventory> searchByItem(@PathVariable String word){ 
		List<ItemInventory> inventories = itemInvetoryService.searchByItemAndVariant(word);
		System.out.println("jumlah search inventory : "+inventories.size());
		return inventories;
	}
	
	@RequestMapping(value="/get-one/{id}", method=RequestMethod.GET)
	@ResponseBody
	public Adjustment getOne(@PathVariable long id) {
		return adjustmentService.getOne(id);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@PathVariable long id) {
		Adjustment adjustment = new Adjustment();
		adjustment.setId(id);
		adjustmentService.update(adjustment);
	}
	
	//detail adjustment
	@RequestMapping(value="/get-detail/{id}", method=RequestMethod.GET)
	public String getDetail(@PathVariable long id, Model model) {
		Adjustment adjustment = adjustmentService.getOne(id);
//		List<DetailAdjustment> detAdjustments = detAdjustmentService.searchById(id);
//		List<HistoryAdjustment> hisAdjustments = hisAdjustmentService.searchById(id);
//		System.out.println("jumlah detail adjustment : "+detAdjustments.size());
//		System.out.println("jumlah history adjustment : "+hisAdjustments.size());
		model.addAttribute("adjustment", adjustment);
//		model.addAttribute("listDetailAdjustment", detAdjustments);
//		model.addAttribute("listHistory", hisAdjustments);
		return "detail-adjustment";
	}
	
	@RequestMapping(value="/detail")
	public String detail() {
		return "detail-adjustment";
	}
}
