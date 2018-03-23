package com.miniproject.kel2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.miniproject.kel2.model.Employee;
import com.miniproject.kel2.model.Role;
import com.miniproject.kel2.model.User;
import com.miniproject.kel2.service.EmpUserService;
import com.miniproject.kel2.virtualmodel.EmpUser;

@Controller
@RequestMapping("/employee")
public class EmpUserController {
 
	
	@Autowired
	EmpUserService empUserService;
	
	@RequestMapping
	public String index(Model model) {
		List<Employee> emp = empUserService.empGetAll();
		model.addAttribute("emp", emp);
		 
		List<User> user = empUserService.userGetAll();
		model.addAttribute("user", user);
		
		List<Role> roles = empUserService.roleGetaAll();
		model.addAttribute("roles", roles);
		
		return "employee";
	}
	
	
	//=============================================== DATA OPERATION ====================================================//
	 
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseBody
	public void save(@RequestBody EmpUser empus) {
		empus.getEmp().setUser(empus.getUser());
		empus.getUser().setEmployee(empus.getEmp());
		empUserService.Save(empus.getEmp());
		//empUserService.userSave(empus.getUser());
	}
}
