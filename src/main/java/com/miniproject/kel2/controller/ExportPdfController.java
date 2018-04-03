package com.miniproject.kel2.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.miniproject.kel2.model.Supplier;
import com.miniproject.kel2.service.SupplierService;

@Controller
public class ExportPdfController {
	
	@Autowired
	SupplierService supplierService;
	
	@RequestMapping(value = "/generate/supplier", method = RequestMethod.GET)
	ModelAndView generatePdf(HttpServletRequest request,
	HttpServletResponse response) throws Exception {
		System.out.println("Calling generatePdf()...");
		//user data
		
		//ini untuk download langsung
		response.setHeader("Content-Disposition", "attachment; filename=\"suppliers.pdf\"");
		response.setContentType("application/pdf");
		java.util.List<Supplier> suppliers = supplierService.selectAll();
		
	return new ModelAndView("pdfView","suppliers",suppliers);
 	}
}
