package com.miniproject.kel2.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Element;
import com.lowagie.text.pdf.PdfPTable;
import com.miniproject.kel2.model.ItemInventory;

public class ItemPdfView extends AbstractPdfView {
	@Override
	protected void buildPdfDocument(Map<String, Object> arg0, com.lowagie.text.Document arg1,
			com.lowagie.text.pdf.PdfWriter arg2, HttpServletRequest arg3, HttpServletResponse arg4) throws Exception {
		// TODO Auto-generated method stub
		List<ItemInventory> inventories = (List<ItemInventory>) arg0.get("inventories");
		   
		   	PdfPTable table = new PdfPTable(5);
			table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);

			table.addCell("Name");
			table.addCell("Category");
			table.addCell("Unit Price");
			table.addCell("In Stock");
			table.addCell("Stock Alert");

			for (ItemInventory inventory : inventories) {
				table.addCell(inventory.getItemVariant().getName());
				table.addCell(inventory.getItemVariant().getItem().getCategory().getName());
				table.addCell(String.valueOf(inventory.getItemVariant().getPrice()));
				table.addCell(String.valueOf(inventory.getEndingQty()));
				if(inventory.getEndingQty() < inventory.getAlertAtQty()) {
					table.addCell("LOW");
				} else {
					table.addCell("HIGHT");
				}
				
			}
			arg1.add(table);
	}

}
