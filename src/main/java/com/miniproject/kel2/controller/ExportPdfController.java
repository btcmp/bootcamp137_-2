package com.miniproject.kel2.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.miniproject.kel2.model.Adjustment;
import com.miniproject.kel2.model.ItemInventory;
import com.miniproject.kel2.model.OrderDetail;
import com.miniproject.kel2.model.Outlet;
import com.miniproject.kel2.model.PurchaseOrder;
import com.miniproject.kel2.model.PurchaseRequest;
import com.miniproject.kel2.model.RequestDetail;
import com.miniproject.kel2.model.SalesOrderDetail;
import com.miniproject.kel2.model.Supplier;
import com.miniproject.kel2.model.TransferStock;
import com.miniproject.kel2.service.AdjustmentService;
import com.miniproject.kel2.service.ItemInventoryService;
import com.miniproject.kel2.service.OutletService;
import com.miniproject.kel2.service.PurchaseOrderDetailService;
import com.miniproject.kel2.service.PurchaseOrderService;
import com.miniproject.kel2.service.PurchaseRequestDetailService;
import com.miniproject.kel2.service.PurchaseRequestService;
import com.miniproject.kel2.service.SalesOrderDetailService;
import com.miniproject.kel2.service.SupplierService;
import com.miniproject.kel2.service.TransferStockService;

@Controller
public class ExportPdfController {
	
	@Autowired
	SupplierService supplierService;
	
	@Autowired
	SalesOrderDetailService salesOrderDetailService;
	
	@Autowired
	OutletService outletService;
	
	@Autowired
	TransferStockService transferStockService;
	
	
	
	@Autowired
	ItemInventoryService itemInventoryService;
	
	@Autowired
	AdjustmentService adjustmentService;
	
	@Autowired
	PurchaseRequestService prService;
	
	@Autowired
	PurchaseRequestDetailService prdService;
	
	@Autowired
	PurchaseOrderDetailService podService;
	
	@Autowired
	PurchaseOrderService poService;
	
	
	@Autowired
	HttpSession httpSession;
	
	
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
	
	@RequestMapping(value = "/generate/adjustment", method = RequestMethod.GET)
	ModelAndView generateAdjustment(HttpServletRequest request,
	HttpServletResponse response) throws Exception {
		System.out.println("Calling generatePdf() for adjustment...");
		//user data
		
		//ini untuk download langsung
		/*response.setHeader("Content-Disposition", "attachment; filename=\"suppliers.pdf\"");
		response.setContentType("application/pdf");*/
		Outlet outlet = (Outlet) httpSession.getAttribute("outlet");
		List<Adjustment> adjustments = adjustmentService.selectAllByOutlet(outlet.getId());
		
		return new ModelAndView("pdfViewAdjustment","adjustments",adjustments);
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
	
	// PDF OUTLET
	@RequestMapping(value = "/generate/outlet", method = RequestMethod.GET)
	ModelAndView generatePdfOutlet(HttpServletRequest request,
	HttpServletResponse response) throws Exception {
		System.out.println("Calling generatePdfOutlet()...");
		
		List<Outlet> outs = outletService.selectAll();
		
		return new ModelAndView("pdfViewOutlet","outs",outs);
 	}
	
	// PDF TRANSFER STOCK
	@RequestMapping(value = "/generate/transfer-stock", method = RequestMethod.GET)
	ModelAndView generatePdfTransferStock(HttpServletRequest request,
	HttpServletResponse response) throws Exception {
		System.out.println("Calling generatePdfTransferStock()...");
		
		List<TransferStock> tStocks = transferStockService.selectAll();
		
		return new ModelAndView("pdfViewTransferStock","tStocks",tStocks);
 	}
	
	
	// PDF ITEM
	@RequestMapping(value = "/generate/item", method = RequestMethod.GET)
	ModelAndView generatePdfItem(HttpServletRequest request,
	HttpServletResponse response) throws Exception {
		System.out.println("Calling generatePdfItem()...");
		
		List<ItemInventory> inventories = itemInventoryService.selectAll();
		
		return new ModelAndView("pdfViewItem","inventories", inventories);
 	}
	
	
	//PDF REQUEST
			@RequestMapping(value="/generate/request", method=RequestMethod.GET)
			ModelAndView generetaPdfPurchaseRequest(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
				System.out.println("Process generate begin, call this function  ..");
				Outlet outlet = (Outlet) httpSession.getAttribute("outlet");
				model.addAttribute("outlet", outlet);
				
				 long idOut;
				 
				 idOut = outlet.getId();
				
				 System.out.println("id outlet : "+idOut);
				List<PurchaseRequest> pr = prService.getAllByOutletId(idOut);
				
				return new ModelAndView("pdfViewPr","pr", pr);
			}
			
			//PDF REQUEST DETAIL
			@RequestMapping(value="/generate/request-detail", method=RequestMethod.GET)
			ModelAndView generetaPdfPurchaseRequestDetail(PurchaseRequest pr, HttpServletRequest request, HttpServletResponse response) throws Exception {
				System.out.println("Process generate begin, call this function  ..");
				List<RequestDetail> rd = prdService.selectByRequest(pr);
				
				return new ModelAndView("pdfViewPrDetail","rd", rd);
			}
		
			//PDF Order
					@RequestMapping(value="/generate/order", method=RequestMethod.GET)
					ModelAndView generetaPdfPurchaseOrder(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
						System.out.println("Process generate begin, call this function  ..");
						Outlet outlet = (Outlet) httpSession.getAttribute("outlet");
						model.addAttribute("outlet", outlet);
						
						 long idOut;
						 
						 idOut = outlet.getId();
						
						 System.out.println("id outlet : "+idOut);
						List<PurchaseOrder> po = poService.getAllByOutletId(idOut);
						
						return new ModelAndView("pdfViewPo","po", po);
					}
					//PDF ORDER DETAIL
					@RequestMapping(value="/generate/order-detail", method=RequestMethod.GET)
					ModelAndView generetaPdfPurchaseOrderDetail(PurchaseOrder po, HttpServletRequest request, HttpServletResponse response) throws Exception {
						System.out.println("Process generate begin, call this function po detail ..");
						System.out.println("dapat po : "+po);
						List<OrderDetail> od = podService.selectByOrder(po);
						System.out.println(od);
						return new ModelAndView("pdfViewPoDetail","od", od);
					}
	
}
