package com.miniproject.kel2.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.miniproject.kel2.model.SalesOrderDetail;
import com.miniproject.kel2.model.Supplier;
import com.miniproject.kel2.service.SalesOrderDetailService;
import com.miniproject.kel2.service.SupplierService;

@Controller
public class ExportPdfController {
	
	@Autowired
	SupplierService supplierService;
	
	@Autowired
	SalesOrderDetailService salesOrderDetailService;
	
	@RequestMapping(value = "/generate/supplier", method = RequestMethod.GET)
	ModelAndView generatePdf(HttpServletRequest request,
	HttpServletResponse response) throws Exception {
		System.out.println("Calling generatePdf()...");
		//user data
		
		//ini untuk download langsung
		/*response.setHeader("Content-Disposition", "attachment; filename=\"suppliers.pdf\"");
		response.setContentType("application/pdf");*/
		List<Supplier> suppliers = supplierService.selectAll();
		
		return new ModelAndView("pdfView","suppliers",suppliers);
 	}
	
	@RequestMapping(value = "/generate/receipt/{id}", method = RequestMethod.GET)
	ModelAndView generateReceipt(HttpServletRequest request,
	HttpServletResponse response, @PathVariable long id) throws Exception {
		System.out.println("Calling generatePdf()...");
		//user data
		
		//ini untuk download langsung
		response.setHeader("Content-Disposition", "attachment; filename=\"receipt.pdf\"");
		response.setContentType("application/pdf");
		List<SalesOrderDetail> receipts = salesOrderDetailService.getReceiptBySalesOrder(id);
		System.out.println("mau ngeprint");
		return new ModelAndView("pdfViewSalesOrder","receipts", receipts);
 	}
}
