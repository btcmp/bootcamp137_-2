package com.miniproject.kel2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.miniproject.kel2.model.Item;
import com.miniproject.kel2.model.ItemInventory;
import com.miniproject.kel2.model.PurchaseRequest;
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
		
		List<ItemInventory> items = iiService.selectAll();
		model.addAttribute("items", items);
		
		return "request";
	}
	
	/*===================================================== START ==================================================*/
	@RequestMapping("/save")
	public void save(@RequestBody PurchaseRequest pr) {
		prService.save(pr);
	}
}
