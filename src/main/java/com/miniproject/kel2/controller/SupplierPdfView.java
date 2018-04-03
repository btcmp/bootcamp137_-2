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
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.miniproject.kel2.model.Supplier;

public class SupplierPdfView extends AbstractPdfView{


	@Override
	protected void buildPdfDocument(Map<String, Object> arg0, com.lowagie.text.Document arg1,
			com.lowagie.text.pdf.PdfWriter arg2, HttpServletRequest arg3, HttpServletResponse arg4) throws Exception {
		// TODO Auto-generated method stub
		List<Supplier> suppliers = (List<Supplier>) arg0.get("suppliers");
		   
		   PdfPTable table = new PdfPTable(4);
			table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);

			table.addCell("Name");
			table.addCell("Address");
			table.addCell("Phone");
			table.addCell("Email");

			for (Supplier sup : suppliers) {
				table.addCell(sup.getName());
				table.addCell(sup.getAddress());
				table.addCell(sup.getPhone());
				table.addCell(sup.getEmail());
				
			}
			arg1.add(table);
	}

}
