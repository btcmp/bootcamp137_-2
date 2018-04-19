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

import com.miniproject.kel2.model.Employee;
import com.miniproject.kel2.model.Outlet;
import com.miniproject.kel2.model.Role;
import com.miniproject.kel2.model.User;
import com.miniproject.kel2.service.EmpUserService;
import com.miniproject.kel2.service.UserService;

@Controller
@RequestMapping("/employee")
public class EmpUserController {
 
	
	@Autowired
	EmpUserService empUserService;
	
	@Autowired
	UserService uService;
	
	@RequestMapping
	public String index(Model model, Employee empl) {
		List<Employee> emp = empUserService.empGetAll();
		model.addAttribute("emp", emp);
		 
		List<User> user = empUserService.userGetAll();
		model.addAttribute("user", user);
		
		List<Role> roles = empUserService.roleGetaAll();
		model.addAttribute("roles", roles);
		
		List<Outlet> outlet = empUserService.outletGetAll();
		model.addAttribute("outlet", outlet);
		
		List<Employee> showActive = empUserService.showActiveEmp(empl);
		model.addAttribute("showActive", showActive);
		
		return "employee";
	} 
	
	
	//=============================================== DATA OPERATION ====================================================//
	 
	
	@RequestMapping(value="/save-emp", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	//@ResponseBody
	public void saveEmp(@RequestBody Employee emp) {
		empUserService.Save(emp);
		//return emp;
	}
	
	//get.one
	@RequestMapping(value="/get-one/{id}", method=RequestMethod.GET)
	@ResponseBody
	public Employee getOne(@PathVariable long id) {
		
		Employee OneEmp = empUserService.empGetOne(id);
		
		//untuk menangani rekursif infinite
		if(OneEmp.getUser() != null) {
			OneEmp.getUser().setEmployee(null);
		}
		 
		return OneEmp;
	}
	
	//SetInactive
	@RequestMapping(value="/setInactive", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void inactive(@RequestBody Employee emp) {
		empUserService.inactive(emp);
	}
	
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Employee emp) {
		empUserService.empUpdate(emp);
	}
	
	/*=================================================== VALIDATION ===================================================*/
	@RequestMapping(value="/search-same-username/{inputNewUser}", method=RequestMethod.GET)
	@ResponseBody
	public List<User> searchUsernameForValidation(@PathVariable String inputNewUser){
		List<User> users = uService.searchUsernameForValidation(inputNewUser);
		System.out.println("found same user : "+users.size());
		return users;
	}
	
}
