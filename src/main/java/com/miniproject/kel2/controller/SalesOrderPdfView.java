package com.miniproject.kel2.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.view.document.AbstractPdfView;
import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.miniproject.kel2.model.SalesOrderDetail;
import com.miniproject.kel2.model.Supplier;

public class SalesOrderPdfView extends AbstractPdfView{


	@Override
	protected void buildPdfDocument(Map<String, Object> arg0, com.lowagie.text.Document arg1,
			com.lowagie.text.pdf.PdfWriter arg2, HttpServletRequest arg3, HttpServletResponse arg4) throws Exception {
		// TODO Auto-generated method stub
		List<SalesOrderDetail> salesOrderDetails = (List<SalesOrderDetail>) arg0.get("receipts");
		   
		   PdfPTable table = new PdfPTable(3);
			table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);

			table.addCell("Item");
			table.addCell("Qty");
			table.addCell("Subtotal");

			for (SalesOrderDetail sod : salesOrderDetails) {
				table.addCell(sod.getVariantId().getItem().getName() +" - "+sod.getVariantId().getName());
				table.addCell(sod.getQty()+"");
				table.addCell(sod.getSubTotal()+"");
				
			}
			arg1.add(new Paragraph("Receipt Sales Order for "+salesOrderDetails.get(0).getSoId().getCustomer().getName()));
			arg1.add(table);
	}

}
