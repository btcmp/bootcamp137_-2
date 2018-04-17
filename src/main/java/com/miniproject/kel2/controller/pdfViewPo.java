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
				
				PdfPTable table = new PdfPTable(5);
					table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
					table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
					table.addCell("Create Date");
					table.addCell("Supplier");
					table.addCell("poNo");
					table.addCell("Total");
					table.addCell("status");
				
				for (PurchaseOrder pos: poCetak) {
					table.addCell(pos.getCreatedOn()+"");
					table.addCell(pos.getSupplier().getName());
					table.addCell(pos.getPoNo());
					table.addCell(pos.getGrandTotalFormatted()+"");
					table.addCell(pos.getStatus());
				}
				
				float[] columnWidths = new float[]{20f, 20f, 15f, 20f, 15f};
	            table.setWidths(columnWidths);
	            
				arg1.add(table);
	}

}
