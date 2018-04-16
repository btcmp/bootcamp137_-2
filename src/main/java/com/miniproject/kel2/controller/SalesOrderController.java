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

import com.miniproject.kel2.dao.CustomerDao;
import com.miniproject.kel2.model.Customer;
import com.miniproject.kel2.model.District;
import com.miniproject.kel2.model.ItemInventory;
import com.miniproject.kel2.model.Outlet;
import com.miniproject.kel2.model.Province;
import com.miniproject.kel2.model.Region;
import com.miniproject.kel2.model.SalesOrder;
import com.miniproject.kel2.model.Supplier;
import com.miniproject.kel2.service.CustomerService;
import com.miniproject.kel2.service.DistrictService;
import com.miniproject.kel2.service.ItemInventoryService;
import com.miniproject.kel2.service.ProvinceService;
import com.miniproject.kel2.service.RegionService;
import com.miniproject.kel2.service.SalesOrderService;

@Controller
@RequestMapping("/sales-order")
public class SalesOrderController {
	
	@Autowired
	SalesOrderService salesOrderService;
	
	@Autowired
	ProvinceService provinceService;
	
	@Autowired
	RegionService regionService;
	
	@Autowired
	DistrictService districtService;
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	ItemInventoryService itemInventoryService;
	
	@Autowired
	HttpSession httpSession;

	@RequestMapping
	public String index(Model model) {
		List<Province> provinces = provinceService.selectAll();
		List<Region> regions = regionService.selectAll();
		List<District> districts = districtService.selectAll();
		
		model.addAttribute("listProvince", provinces);
		model.addAttribute("listRegion", regions);
		model.addAttribute("listDistrict", districts);
		return "sales-order2";
	}
	
	@RequestMapping(value="/search-name-valid/{name}", method=RequestMethod.GET)
	@ResponseBody
	public List<Customer> searchNameValidation(@PathVariable String name){
		List<Customer> custs = customerService.searchByNameValidation(name);
		System.out.println("customer valid : "+custs.size());
		return custs;
	}
	
	@RequestMapping(value="/search-email-valid/{email:.+}", method=RequestMethod.GET)
	@ResponseBody
	public String searchEmailValidation(@PathVariable("email") String email){
		String custs = customerService.searchByEmailValidation(email);
		System.out.println("email valid : "+custs);
		return custs;
	}
	
	@RequestMapping(value="/save-customer", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void saveCustomer(@RequestBody Customer customer) {
		customerService.save(customer);
	}
	
	@RequestMapping(value="/search-customer/{word}", method=RequestMethod.GET)
	@ResponseBody
	public List<Customer> searchCustomer(@PathVariable String word){
		List<Customer> customers = customerService.searchByName(word);
		System.out.println("jumlah search customer : "+customers.size());
		return customers;
	}
	
	//bagian search item variant
	@RequestMapping(value="/search-item-variant/{word}", method=RequestMethod.GET)
	@ResponseBody
	public List<Object[]> searchItemInventoryByName(@PathVariable String word){
		Outlet outlet = (Outlet) httpSession.getAttribute("outlet");
		List<Object[]> inventories = itemInventoryService.searchItemInventoryByName(word, outlet.getId());
		System.out.println("jumlah search inventories : "+inventories.size());
		return inventories;
	}
	
	//mindahin dari item ke struk
	@RequestMapping(value="/get-nota/{id}", method=RequestMethod.GET)
	@ResponseBody
	public ItemInventory getNota(@PathVariable long id) {
		ItemInventory inv = itemInventoryService.getOne(id);
		System.out.println("bisa ambil inventory setelah checklist");
		return inv;
	}
	
	//save data sales order
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody SalesOrder salesOrder) {
		salesOrderService.save(salesOrder);
	}
}
