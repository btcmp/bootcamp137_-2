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

import com.miniproject.kel2.model.District;
import com.miniproject.kel2.model.Outlet;
import com.miniproject.kel2.model.Province;
import com.miniproject.kel2.model.Region;
import com.miniproject.kel2.service.DistrictService;
import com.miniproject.kel2.service.OutletService;
import com.miniproject.kel2.service.ProvinceService;
import com.miniproject.kel2.service.RegionService;

@Controller
@RequestMapping("/outlet")
public class OutletController {

	@Autowired
	OutletService outletService;
	
	@Autowired
	ProvinceService provinceService;
	
	@Autowired
	RegionService regionService;
	
	@Autowired
	DistrictService districtService;
	
	@RequestMapping
	public String index(Model model) {
		List<Outlet> outs = outletService.selectAll();
		List<Province> provs = provinceService.selectAll();
		List<Region> regs = regionService.selectAll();
		List<District> diss = districtService.selectAll();
		model.addAttribute("outs", outs);
		model.addAttribute("provs", provs);
		model.addAttribute("regs", regs);
		model.addAttribute("diss", diss);
		return "outlet";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody Outlet out) {
		outletService.saveAtauUpdate(out);
	}

	@RequestMapping(value = "/get-one/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Outlet getOne(@PathVariable long id) {
		return outletService.getOne(id);
	}

	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Outlet out) {
		outletService.update(out);
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable long id) {
		Outlet out = new Outlet();
		out.setId(id);
		outletService.delete(out);
	}
	
	/*@RequestMapping(value = "/search/", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public List<Outlet> searchByName(@PathVariable String search){
		List<Outlet> outlets = outletService.searchByName(search);
		System.out.println(outlets);
		return outlets;
	}*/
	
}
