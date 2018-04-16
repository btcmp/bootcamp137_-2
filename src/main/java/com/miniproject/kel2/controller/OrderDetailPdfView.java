package com.miniproject.kel2.controller;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;


import com.lowagie.text.Element;
import com.lowagie.text.pdf.PdfPTable;
import com.miniproject.kel2.model.OrderDetail;

public class OrderDetailPdfView extends AbstractPdfView {

	@Override
	protected void buildPdfDocument(Map<String, Object> arg0, com.lowagie.text.Document arg1,
			com.lowagie.text.pdf.PdfWriter arg2, HttpServletRequest arg3, HttpServletResponse arg4) throws Exception {
		// TODO Auto-generated method stub
		List<OrderDetail> odCetak = (List<OrderDetail>) arg0.get("od");
		
		PdfPTable table = new PdfPTable(3);
			table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
			
			table.addCell("Item");
			table.addCell("req Qty");
			table.addCell("Sub Total");
			table.addCell("Grand Total");
			
			
		
		for (OrderDetail pod: odCetak) {
			table.addCell(pod.getVariant().getItem().getName()+"-"+pod.getVariant().getName());
			table.addCell(pod.getRequestQty()+"");
			table.addCell(pod.getSubTotal()+"");
			table.addCell(pod.getPo().getGrandTotal()+"");
		}
		arg1.add(table);
	}

}
