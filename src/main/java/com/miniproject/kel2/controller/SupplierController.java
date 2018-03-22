package com.miniproject.kel2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.miniproject.kel2.model.District;
import com.miniproject.kel2.model.Province;
import com.miniproject.kel2.model.Region;
import com.miniproject.kel2.model.Supplier;
import com.miniproject.kel2.service.DistrictService;
import com.miniproject.kel2.service.ProvinceService;
import com.miniproject.kel2.service.RegionService;
import com.miniproject.kel2.service.SupplierService;


@Controller
@RequestMapping("/supplier")
public class SupplierController {
	
	@Autowired
	SupplierService supplierService;
	
	@Autowired
	ProvinceService provinceService;
	
/*	@Autowired
	RegionService regionService;
	
	@Autowired
	DistrictService districtService;*/

	@RequestMapping
	public String index(Model model) {
		List<Supplier> suppliers = supplierService.selectAll();
		List<Province> provinces = provinceService.selectAll();
		/*List<Region> regions = regionService.selectAll();
		List<District> districts = districtService.selectAll(); */
		
		model.addAttribute("listSupplier", suppliers);
		model.addAttribute("listProvince", provinces);
		/*model.addAttribute("listRegion", regions);
		model.addAttribute("listDistrict", districts);*/
		return "supplier";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody Supplier supplier) {
		supplierService.save(supplier);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Supplier supplier) {
		supplierService.update(supplier);
	}
	
	@RequestMapping(value="/get-one/{id}", method=RequestMethod.GET)
	@ResponseBody
	public Supplier getOne(@PathVariable long id) {
		return supplierService.getOne(id);
	}
	
	@RequestMapping(value="/search/{name}", method=RequestMethod.GET)
	@ResponseBody
	public String searchByName(@PathVariable String name, Model model){
		List<Supplier> suppliers = supplierService.searchByName(name); 
		model.addAttribute("listSupplier", suppliers);
		return "supplier";
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable long id) {
		Supplier supplier = new Supplier();
		supplier.setId(id);
		supplierService.delete(supplier);
	}
}
