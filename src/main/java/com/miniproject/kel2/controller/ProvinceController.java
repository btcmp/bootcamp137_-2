package com.miniproject.kel2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.miniproject.kel2.model.District;
import com.miniproject.kel2.model.Region;
import com.miniproject.kel2.service.DistrictService;
import com.miniproject.kel2.service.RegionService;

@Controller
@RequestMapping("/province")
public class ProvinceController {
	
	@Autowired
	RegionService regionService;
	
	@Autowired
	DistrictService districtService;

	@RequestMapping(value="/get-region/{id}", method=RequestMethod.GET)
	public void getRegion(@PathVariable long id, Model model ) {
		List<Region> regions = regionService.selectByProvince((Long)id);
		model.addAttribute("listRegion", regions);
	}
	
	@RequestMapping(value="/get-district/{id}", method=RequestMethod.GET)
	public void getDistrict(@PathVariable long id, Model model ) {
		List<District> district = districtService.selectByRegion((Long)id);
		model.addAttribute("listDistrict", district);
	}
}
