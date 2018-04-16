package com.miniproject.kel2.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Element;
import com.lowagie.text.pdf.PdfPTable;
import com.miniproject.kel2.model.PurchaseOrder;

public class pdfViewPo extends AbstractPdfView{

	@Override
	protected void buildPdfDocument(Map<String, Object> arg0, com.lowagie.text.Document arg1,
			com.lowagie.text.pdf.PdfWriter arg2, HttpServletRequest arg3, HttpServletResponse arg4) throws Exception {
		// TODO Auto-generated method stub
		List<PurchaseOrder> poCetak = (List<PurchaseOrder>) arg0.get("po");
				
				PdfPTable table = new PdfPTable(3);
					table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
					table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
					
					table.addCell("poNo");
					table.addCell("notes");
					table.addCell("status");
				
				for (PurchaseOrder pos: poCetak) {
					table.addCell(pos.getPoNo());
					table.addCell(pos.getNotes());
					table.addCell(pos.getStatus());
				}
				arg1.add(table);
	}

}
