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

import com.miniproject.kel2.dao.CustomerDao;
import com.miniproject.kel2.model.Customer;
import com.miniproject.kel2.model.District;
import com.miniproject.kel2.model.Province;
import com.miniproject.kel2.model.Region;
import com.miniproject.kel2.model.SalesOrder;
import com.miniproject.kel2.service.CustomerService;
import com.miniproject.kel2.service.DistrictService;
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
	
	//
}
