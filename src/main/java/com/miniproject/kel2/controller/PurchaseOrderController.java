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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.miniproject.kel2.model.HistoryAdjustment;
import com.miniproject.kel2.model.HistoryPurchaseOrder;
import com.miniproject.kel2.model.HistoryPurchaseRequest;
import com.miniproject.kel2.model.ItemInventory;
import com.miniproject.kel2.model.OrderDetail;
import com.miniproject.kel2.model.Outlet;
import com.miniproject.kel2.model.PurchaseOrder;
import com.miniproject.kel2.model.PurchaseRequest;
import com.miniproject.kel2.model.RequestDetail;
import com.miniproject.kel2.model.Supplier;
import com.miniproject.kel2.service.HistoryPurchaseOrderService;
import com.miniproject.kel2.service.ItemInventoryService;
import com.miniproject.kel2.service.PurchaseOrderDetailService;
import com.miniproject.kel2.service.PurchaseOrderService;
import com.miniproject.kel2.service.SupplierService;

import oracle.net.ano.SupervisorService;

@Controller
@RequestMapping("/order")
public class PurchaseOrderController {

	@Autowired
	PurchaseOrderService poService;
	
	@Autowired
	PurchaseOrderDetailService podService;
	
	@Autowired
	HistoryPurchaseOrderService hpOrderService;
	
	
	@Autowired
	ItemInventoryService iiService;
	
	@Autowired
	SupplierService sService;
	
	@Autowired
	HttpSession httpSession;
	
	@RequestMapping
	public String index (Model model, PurchaseOrder po) {
		
		List<PurchaseOrder> pos = poService.selectAll();
		model.addAttribute("pos", pos);
		
		Outlet outlet = (Outlet) httpSession.getAttribute("outlet");
		model.addAttribute("outlet", outlet);
		
		/*List<OrderDetail> pods = podService.selectAll();
		model.addAttribute("pods", pods);
		
		List<ItemInventory> items = iiService.selectAll();
		model.addAttribute("items", items);*/
		
		List<Supplier> supp = sService.selectAll();
		model.addAttribute("supp", supp);
		
		return "order";
	}
	
	/*=============================================================================================================*/
	
	@RequestMapping(value="/detail/{id}", method=RequestMethod.GET)
	//@ResponseStatus(HttpStatus.FOUND)
	public String toDetail(@PathVariable long id, Model model ) {
		PurchaseOrder po = poService.getOne(id);
		model.addAttribute("po", po);
		
		List<OrderDetail>pod = podService.selectByOrder(po);
		model.addAttribute("pod", pod);
		
		List<HistoryPurchaseOrder> hpo = hpOrderService.selectByOrder(po);
		model.addAttribute("hpo", hpo);
		
		System.out.println(po.getSupplier().getId());
		
		//System.out.println(pr);
		return "orderdetail";
		
	}
	
	/*=============================================================================================================*/
	@RequestMapping(value="/get-one/{id}", method=RequestMethod.GET)
	@ResponseBody
	public PurchaseOrder getOne(@PathVariable long id) {
		
		PurchaseOrder po = poService.getOne(id);
		
		return po;
	}
	
	/*=================================================== UPDATE ===================================================*/
	@RequestMapping(value="/update",  method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void save(@RequestBody PurchaseOrder po) {
		poService.save(po);
		
	}
	
	/*------------------------------------------ CHANGE STATUS  --------------------------------------------------------------*/
	@RequestMapping(value="/Submitted/{id}", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void submitted(@PathVariable long id) {
		poService.submit(id);
	}
	
	@RequestMapping(value="/Approved/{id}", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void approved(@PathVariable long id) {
		poService.approve(id);
	}
	
	@RequestMapping(value="/Rejected/{id}", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void rejected(@PathVariable long id) {
		poService.rejected(id);
	}
	
	@RequestMapping(value="/Printed/{id}", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void printed(@PathVariable long id) {
		poService.printed(id);
	}
	
	@RequestMapping(value="/Process/{id}", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void created(@PathVariable long id) {
		poService.process(id);
	}
	
	/*------------------------------------------ SEARCH BY STATUS  --------------------------------------------------------------*/
	@RequestMapping(value="/search-status/{status}", method = RequestMethod.GET)
	@ResponseBody
	public List<PurchaseOrder> searchByStatus(@PathVariable PurchaseOrder po){ 
		List<PurchaseOrder> purorder = (List<PurchaseOrder>) poService.searchByStatus(po);
		System.out.println("jumlah hasil search : "+purorder.size());
		return purorder;
	}
}
