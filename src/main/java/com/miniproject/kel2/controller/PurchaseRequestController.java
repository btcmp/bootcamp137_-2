package com.miniproject.kel2.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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

import com.miniproject.kel2.model.Employee;
import com.miniproject.kel2.model.HistoryPurchaseRequest;
import com.miniproject.kel2.model.Item;
import com.miniproject.kel2.model.ItemInventory;
import com.miniproject.kel2.model.Outlet;
import com.miniproject.kel2.model.PurchaseRequest;
import com.miniproject.kel2.model.RequestDetail;
import com.miniproject.kel2.model.User;
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
	PurchaseRequestHistoryService hisProReqService;
	
	@Autowired
	ItemInventoryService iiService; 
	
	@Autowired
	HttpSession httpSession;
	
	
	
	
	@RequestMapping
	public String index (Model model) {
		Outlet outlet = (Outlet) httpSession.getAttribute("outlet");
		model.addAttribute("outlet", outlet);
		
		 long idOut;
		 
		 idOut = outlet.getId();
		
		 System.out.println("id outlet : "+idOut);
		
		List<PurchaseRequest> allPrByOut = prService.getAllByOutletId(idOut);
		model.addAttribute("allPrByOut", allPrByOut);
		
		Employee employee = (Employee) httpSession.getAttribute("employee");
		model.addAttribute("employee", employee);
		
		System.out.println("employee has found : " +employee);
		
		return "request";
	}
	
	/*===================================================== START ==================================================*/
	@RequestMapping("/save")
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody PurchaseRequest pr) {
		prService.save(pr);
		
	}
	
	// search by status
	@RequestMapping(value="/search-status/{status}", method=RequestMethod.GET)
	@ResponseBody
	public List<PurchaseRequest> searchByStatus(@PathVariable String status) {
		List<PurchaseRequest> pr = prService.searchByStatus(status);
		System.out.println("Search by status : "+pr.size());
		return pr;
		
	}
	
	@RequestMapping(value="/search-all/{word}", method=RequestMethod.GET)
	@ResponseBody
	public List<PurchaseRequest> searchByAll(@PathVariable String word){
		List<PurchaseRequest> pr = prService.searchByAll(word);
		System.out.println("Search by status : "+pr.size());
		return pr;
	}
	
	@RequestMapping(value="/search-item", method=RequestMethod.GET)
	@ResponseBody
	public List<ItemInventory> searchItemInventoriesByName(@RequestParam(value="search", defaultValue="")String search){
		
		List<ItemInventory> iinventories = iiService.searchInventoryByItemName(search);
		System.out.println("Query result : " +iinventories.size());
		
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
		model.addAttribute("pr", pr);
		
		List<RequestDetail>rd = rdService.selectByRequest(pr);
		model.addAttribute("rd", rd);
		
		List<HistoryPurchaseRequest> hpr = hisProReqService.selectByRequest(pr);
		model.addAttribute("hpr", hpr);
		
		//System.out.println(pr);
		return "requestdetail";
		
	}
	
	@RequestMapping(value="/Submitted/{id}", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void submitted(@PathVariable long id) {
		prService.submit(id);
	}
	
	@RequestMapping(value="/Approved/{id}", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void approved(@PathVariable long id) {
		prService.approve(id);
	}
	
	@RequestMapping(value="/Rejected/{id}", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void rejected(@PathVariable long id) {
		prService.rejected(id);
	}
	
	@RequestMapping(value="/Printed/{id}", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void printed(@PathVariable long id) {
		prService.printed(id);
	}
	
	@RequestMapping(value="/CreatePo/{id}", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void created(@PathVariable long id) {
		prService.created(id);
	}
	
}

