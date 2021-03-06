package com.miniproject.kel2.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Element;
import com.lowagie.text.pdf.PdfPTable;
import com.miniproject.kel2.model.PurchaseRequest;

public class pdfViewPr extends AbstractPdfView{

	@Override
	protected void buildPdfDocument(Map<String, Object> arg0, com.lowagie.text.Document arg1,
			com.lowagie.text.pdf.PdfWriter arg2, HttpServletRequest arg3, HttpServletResponse arg4) throws Exception {
		// TODO Auto-generated method stub
		List<PurchaseRequest> prCetak = (List<PurchaseRequest>) arg0.get("pr");
				
				PdfPTable table = new PdfPTable(3);
					table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
					table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
					
					table.addCell("prNo");
					table.addCell("notes");
					table.addCell("status");
				
				for (PurchaseRequest prs: prCetak) {
					table.addCell(prs.getPrNo());
					table.addCell(prs.getNotes());
					table.addCell(prs.getStatus());
				}
				arg1.add(table);
	}

}
