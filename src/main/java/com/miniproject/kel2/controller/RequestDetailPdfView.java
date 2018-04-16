package com.miniproject.kel2.controller;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;


import com.lowagie.text.Element;
import com.lowagie.text.pdf.PdfPTable;
import com.miniproject.kel2.model.RequestDetail;

public class RequestDetailPdfView extends AbstractPdfView {

	@Override
	protected void buildPdfDocument(Map<String, Object> arg0, com.lowagie.text.Document arg1,
			com.lowagie.text.pdf.PdfWriter arg2, HttpServletRequest arg3, HttpServletResponse arg4) throws Exception {
		// TODO Auto-generated method stub
		List<RequestDetail> rdCetak = (List<RequestDetail>) arg0.get("rd");
		
		PdfPTable table = new PdfPTable(3);
			table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
			
			table.addCell("Item");
			table.addCell("in stok");
			table.addCell("req Qty");
		
		for (RequestDetail prs: rdCetak) {
			table.addCell(prs.getItemvar().getItem().getName()+"-"+prs.getItemvar().getName());
			table.addCell("Null");
			table.addCell(prs.getRequestQty()+"");
		}
		arg1.add(table);
	}

}
