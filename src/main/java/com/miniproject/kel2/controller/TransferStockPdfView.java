package com.miniproject.kel2.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Element;
import com.lowagie.text.pdf.PdfPTable;
import com.miniproject.kel2.model.TransferStock;

public class TransferStockPdfView extends AbstractPdfView{

	@Override
	protected void buildPdfDocument(Map<String, Object> arg0, com.lowagie.text.Document arg1,
			com.lowagie.text.pdf.PdfWriter arg2, HttpServletRequest arg3, HttpServletResponse arg4) throws Exception {
		// TODO Auto-generated method stub
		List<TransferStock> tStocks = (List<TransferStock>) arg0.get("tStocks");
		   
		   PdfPTable table = new PdfPTable(4);
			table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);

			table.addCell("Transfer Date");
			table.addCell("From Outlet");
			table.addCell("To Outlet");
			table.addCell("Status");

			for (TransferStock ts: tStocks) {
				table.addCell(String.valueOf(ts.getCreatedOn()));
				table.addCell(ts.getFromOutlet().getName());
				table.addCell(ts.getToOutlet().getName());
				table.addCell(ts.getStatus());
				
			}
			arg1.add(table);
	}

}
