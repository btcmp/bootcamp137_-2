package com.miniproject.kel2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/login")
public class Maincontroller {
	
	
	@RequestMapping
	public String doLogin(Model model, @RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout){
		if(error != null){
			model.addAttribute("error", "user or password invalid..!!");
		} 
		if(logout != null){
			model.addAttribute("logout", "anda sudah keluar..!!");
		}
		
		return "security/login";
	} 

}
