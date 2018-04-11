package com.miniproject.kel2.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itextpdf.text.pdf.PdfStructTreeController.returnType;
import com.miniproject.kel2.model.EmpOutlet;
import com.miniproject.kel2.model.Employee;
import com.miniproject.kel2.model.Outlet;
import com.miniproject.kel2.model.User;
import com.miniproject.kel2.service.EmpUserService;
import com.miniproject.kel2.service.OutletService;

@Controller
@RequestMapping("/authentication")
public class ChooseOutletController {

	@Autowired
	EmpUserService euService;
	
	@Autowired
	OutletService outletService;
	
	@Autowired
	HttpSession httpSession;
	
	
@RequestMapping(value="/getEmpByUser")
@ResponseBody
public List<Employee> getOneByUsername(@RequestParam(value="username", defaultValue="") String username ){
	return euService.getOneByUsername(username);
	
}

@RequestMapping(value = "/choose-outlet")
public String choseOutlet(Model model, Principal principal) {
	String username = principal.getName();
	List<Employee> OneEmployee = euService.getOneByUsername(username);
	
	Employee empl = new Employee();
	for (Employee emp : OneEmployee) {
		empl = emp;
	}
	
	httpSession.setAttribute("employee", empl);
	//httpSession.setAttribute("username", empl.getUser().getUsername());
	
	List<Outlet> outlets = empl.getOutlet();
	System.out.println(outlets.size());
	model.addAttribute("outlets", outlets);
	return "security/choose-outlet";
	
	/*httpSession.setAttribute("userLogin", user);
	List<> */
	/*
	
	User user = euService.getUserByEmployee(empl);
	httpSession.setAttribute("username", username);
	httpSession.setAttribute("employee", empl);
	httpSession.setAttribute("userLogin", user);
	List<EmpOutlet> empOutlets = empl.getEmployeeOutlets();
	List<Outlet> outlets = new ArrayList<>();
	for(EmployeeOutlet eo : empOutlets) {
		Outlet out = eo.getOutlet();
		outlets.add(out);
	}
	System.out.println(empOutlets.size()+" "+outlets.size());
	model.addAttribute("outlets", outlets);
	return "choose-outlet";*/
	
}

@RequestMapping(value="/starting-page")
public String start(@RequestParam(value="id", defaultValue="") long id) {
	Outlet outlet = outletService.getOne(id);
	httpSession.setAttribute("outlet", outlet);
	return "aser";
}


	
	
}
