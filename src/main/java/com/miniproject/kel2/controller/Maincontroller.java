package com.miniproject.kel2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class Maincontroller {

	@RequestMapping
	public String index() {
		return "index";
	}
}
