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
	@ResponseBody
	public List<Region> getRegion(@PathVariable long id) {
		List<Region> regions = regionService.selectByProvince(id);
		System.out.println("banyak region : "+regions.size());
		return regions;
	}
	
	@RequestMapping(value="/get-district/{id}", method=RequestMethod.GET)
	@ResponseBody
	public List<District> getDistrict(@PathVariable long id) {
		List<District> district = districtService.selectByRegion(id);
		System.out.println("banyak district : "+district.size());
		return district;
	}
	
	
}
