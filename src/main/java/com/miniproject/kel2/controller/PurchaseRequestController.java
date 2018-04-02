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

import com.miniproject.kel2.model.Item;
import com.miniproject.kel2.model.ItemInventory;
import com.miniproject.kel2.model.PurchaseRequest;
import com.miniproject.kel2.model.RequestDetail;
import com.miniproject.kel2.service.PurchaseRequestHistoryService;
import com.miniproject.kel2.service.PurchaseRequestService;
import com.miniproject.kel2.service.ItemInventoryService;
import com.miniproject.kel2.service.ItemService;
import com.miniproject.kel2.service.PurchaseRequestDetailService;

@Controller
@RequestMapping("/request")
public class PurchaseRequestController {

	@Autowired
	PurchaseRequestService prService;
	
	@Autowired
	PurchaseRequestDetailService rdService;
	
	@Autowired
	PurchaseRequestHistoryService HisProReqService;
	
	@Autowired
	ItemInventoryService iiService;
	
	
	
	@RequestMapping
	public String index (Model model, PurchaseRequest pr) {
		
		List<PurchaseRequest> prs = prService.selectAll();
		model.addAttribute("prs", prs);
		
		
		List<RequestDetail> prd = rdService.selectAll();
		model.addAttribute("prd", prd);
		
		List<ItemInventory> items = iiService.selectAll();
		model.addAttribute("items", items);
		
		return "request";
	}
	
	/*===================================================== START ==================================================*/
	@RequestMapping("/save")
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody PurchaseRequest pr) {
		prService.save(pr);
		
	}
	
	@RequestMapping(value="/search-item", method=RequestMethod.GET)
	@ResponseBody
	public List<ItemInventory> searchItemInventoriesByName(@RequestParam(value="search", defaultValue="")String search){
		List<ItemInventory> iinventories = iiService.searchInventoryByItemName(search);
		System.out.println("Query result : " +iinventories.size());
		
		return iinventories;
		
	}
	
	@RequestMapping(value="/search-item-variant/{keyword}", method=RequestMethod.GET)
	@ResponseBody
	public List<Object[]> searchByItem(@PathVariable String keyword){
		List<Object[]> iinventories = iiService.searchByItemAndVariant(keyword);
		System.out.println("hasil search inventory : "+iinventories.size());
		return iinventories;
		
	}
	
	@RequestMapping(value="/get-one/{id}", method=RequestMethod.GET)
	@ResponseBody
	public PurchaseRequest getOne(@PathVariable long id) {
		
		PurchaseRequest purReq = prService.getOne(id);
		
		return purReq;
	}
	
	@RequestMapping(value="/detail/{id}", method=RequestMethod.GET)
	//@ResponseStatus(HttpStatus.FOUND)
	public String toDetail(@PathVariable long id, Model model ) {
		PurchaseRequest pr = prService.getOne(id);
		model.addAttribute(pr);
		//System.out.println(pr);
		return "requestdetail";
		
	}
	
}

