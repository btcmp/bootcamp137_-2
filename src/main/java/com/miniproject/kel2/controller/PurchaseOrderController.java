package com.miniproject.kel2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.miniproject.kel2.model.HistoryPurchaseOrder;
import com.miniproject.kel2.model.HistoryPurchaseRequest;
import com.miniproject.kel2.model.ItemInventory;
import com.miniproject.kel2.model.OrderDetail;
import com.miniproject.kel2.model.PurchaseOrder;
import com.miniproject.kel2.model.PurchaseRequest;
import com.miniproject.kel2.model.RequestDetail;
import com.miniproject.kel2.service.HistoryPurchaseOrderService;
import com.miniproject.kel2.service.ItemInventoryService;
import com.miniproject.kel2.service.PurchaseOrderDetailService;
import com.miniproject.kel2.service.PurchaseOrderService;

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
	
	
	@RequestMapping
	public String index (Model model, PurchaseOrder po) {
		
		List<PurchaseOrder> pos = poService.selectAll();
		model.addAttribute("pos", pos);
		
		
		List<OrderDetail> pods = podService.selectAll();
		model.addAttribute("pods", pods);
		
		List<ItemInventory> items = iiService.selectAll();
		model.addAttribute("items", items);
		
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
	
}
