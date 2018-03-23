package com.miniproject.kel2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sales-order")
public class SalesOrderController {

	@RequestMapping
	public String index() {
		return "sales-order";
	}
}
