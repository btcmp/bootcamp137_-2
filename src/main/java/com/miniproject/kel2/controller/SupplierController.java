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
	
	@Autowired
	RegionService regionService;
	
	@Autowired
	DistrictService districtService;

	@RequestMapping
	public String index(Model model) {
		List<Supplier> suppliers = supplierService.selectAll();
		List<Province> provinces = provinceService.selectAll();
		List<Region> regions = regionService.selectAll();
		List<District> districts = districtService.selectAll();
		
		model.addAttribute("listSupplier", suppliers);
		model.addAttribute("listProvince", provinces);
		model.addAttribute("listRegion", regions);
		model.addAttribute("listDistrict", districts);
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
	public Supplier getOne(@PathVariable long id, Model model) {
		long idProv = supplierService.getOne(id).getProvinceId().getId();
		List<Region> regions = regionService.selectByProvince(idProv);
		System.out.println("jumlah region : "+regions.size());
		long idReg = supplierService.getOne(id).getRegionId().getId();
		List<District> districts = districtService.selectByRegion(idReg);
		System.out.println("jumlah district : "+districts.size());
		model.addAttribute("listRegion", regions);
		model.addAttribute("listDistrict", districts);
		return supplierService.getOne(id);
	}
	
	@RequestMapping(value="/search/{name}", method=RequestMethod.GET)
	@ResponseBody
	public List<Supplier> searchByName(@PathVariable String name){
		List<Supplier> suppliers = supplierService.searchByName(name); 
		System.out.println(suppliers);
		return suppliers;
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable long id) {
		Supplier supplier = new Supplier();
		supplier.setId(id);
		supplierService.delete(supplier);
	}
	
	@RequestMapping(value="/search-name-valid/{name}", method=RequestMethod.GET)
	@ResponseBody
	public List<Supplier> searchNameValidation(@PathVariable String name){
		List<Supplier> sups = supplierService.searchByNameValidation(name);
		System.out.println("supplier valid : "+sups.size());
		return sups;
	}
	
	@RequestMapping(value="/edit-name-valid/{name}/{id}", method=RequestMethod.GET)
	@ResponseBody
	public List<Supplier> editNameValidation(@PathVariable String name,@PathVariable long id){
		List<Supplier> sups = supplierService.searchByNameValidationEdit(name, id);
		System.out.println("supplier valid : "+sups.size());
		return sups;
	}
	
	@RequestMapping(value="/search-email-valid/{email:.+}", method=RequestMethod.GET)
	@ResponseBody
	public String searchEmailValidation(@PathVariable("email") String email){
		String sups = supplierService.searchByEmailValidation(email);
		System.out.println("email valid : "+sups);
		return sups;
	}
	
	@RequestMapping(value="/edit-email-valid/{email:.+}/{id}", method=RequestMethod.GET)
	@ResponseBody
	public String searchEmailValidationEdit(@PathVariable("email") String email,@PathVariable long id){
		String sups = supplierService.searchByEmailValidationEdit(email, id);
		System.out.println("email valid : "+sups);
		return sups;
	}
	
}
