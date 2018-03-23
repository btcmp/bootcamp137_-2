package com.miniproject.kel2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/adjustment")
public class AdjustmentController {

	@RequestMapping
	public String index() {
		return "adjustment2";
	}
	
	@RequestMapping(value="/detail")
	public String detail() {
		return "detail-adjustment";
	}
}
