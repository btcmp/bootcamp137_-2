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
import com.miniproject.kel2.model.Adjustment;
import com.miniproject.kel2.model.SalesOrderDetail;
import com.miniproject.kel2.model.Supplier;

public class AdjustmentPdfView extends AbstractPdfView{


	@Override
	protected void buildPdfDocument(Map<String, Object> arg0, com.lowagie.text.Document arg1,
			com.lowagie.text.pdf.PdfWriter arg2, HttpServletRequest arg3, HttpServletResponse arg4) throws Exception {
		// TODO Auto-generated method stub
		List<Adjustment> adjustment = (List<Adjustment>) arg0.get("adjustments");
		   
		   PdfPTable table = new PdfPTable(3);
			table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);

			table.addCell("Created Date");
			table.addCell("Notes");
			table.addCell("Status");

			for (Adjustment adj : adjustment) {
				table.addCell(adj.getCreatedOn()+"");
				table.addCell(adj.getNotes());
				table.addCell(adj.getStatus());
				
			}
			arg1.add(new Paragraph("Report Adjustment in Outlet : "+adjustment.get(0).getOutletId().getName()));
			arg1.add(new Paragraph(" "));
			arg1.add(table);
	}

}
