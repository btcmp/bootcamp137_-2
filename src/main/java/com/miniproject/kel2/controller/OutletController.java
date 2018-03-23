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

import com.miniproject.kel2.model.Outlet;
import com.miniproject.kel2.service.OutletService;

@Controller
@RequestMapping("/outlet")
public class OutletController {

	@Autowired
	OutletService outletService;
	
	@RequestMapping
	public String index(Model model) {
		List<Outlet> outs = outletService.selectAll();
		model.addAttribute("outs", outs);
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
}
