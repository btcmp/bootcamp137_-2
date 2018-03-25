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

import com.miniproject.kel2.model.Adjustment;
import com.miniproject.kel2.service.AdjustmentService;

@Controller
@RequestMapping("/adjustment")
public class AdjustmentController {
	
	@Autowired
	AdjustmentService adjustmentService;

	@RequestMapping
	public String index(Model model) {
		List<Adjustment> adjustments = adjustmentService.selectAll();
		model.addAttribute("listAdjustment", adjustments);
		return "adjustment2";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody Adjustment adjustment) {
		adjustmentService.save(adjustment);
	}
	
	@RequestMapping(value="/get-one/{id}", method=RequestMethod.GET)
	@ResponseBody
	public Adjustment getOne(@PathVariable long id) {
		return adjustmentService.getOne(id);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@PathVariable long id) {
		Adjustment adjustment = new Adjustment();
		adjustment.setId(id);
		adjustmentService.update(adjustment);
	}
	
	@RequestMapping(value="/detail")
	public String detail() {
		return "detail-adjustment";
	}
}
