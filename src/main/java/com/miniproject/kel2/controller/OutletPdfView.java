package com.miniproject.kel2.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Element;
import com.lowagie.text.pdf.PdfPTable;
import com.miniproject.kel2.model.Outlet;

public class OutletPdfView extends AbstractPdfView{
	
	@Override
	protected void buildPdfDocument(Map<String, Object> arg0, com.lowagie.text.Document arg1,
			com.lowagie.text.pdf.PdfWriter arg2, HttpServletRequest arg3, HttpServletResponse arg4) throws Exception {
		// TODO Auto-generated method stub
		List<Outlet> outs = (List<Outlet>) arg0.get("outs");
		   
		   PdfPTable table = new PdfPTable(4);
			table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);

			table.addCell("Name");
			table.addCell("Address");
			table.addCell("Phone");
			table.addCell("Email");

			for (Outlet out : outs) {
				table.addCell(out.getName());
				table.addCell(out.getAddress());
				table.addCell(out.getPhone());
				table.addCell(out.getEmail());
				
			}
			arg1.add(table);
	}

}
