package com.miniproject.kel2.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.ItemInventoryDao;
import com.miniproject.kel2.dao.SalesOrderDao;
import com.miniproject.kel2.dao.SalesOrderDetailDao;
import com.miniproject.kel2.model.ItemInventory;
import com.miniproject.kel2.model.Outlet;
import com.miniproject.kel2.model.SalesOrder;
import com.miniproject.kel2.model.SalesOrderDetail;

@Service
@Transactional
public class SalesOrderService {
	
	@Autowired
	SalesOrderDao salesOrderDao;
	
	@Autowired
	SalesOrderDetailDao salesOrderDetailDao;
	
	@Autowired
	ItemInventoryDao itemInventoryDao;
	
	@Autowired
	HttpSession httpSession;

	public List<SalesOrder> selectAll() {
		// TODO Auto-generated method stub
		return salesOrderDao.selectAll();
	}

	public void save(SalesOrder salesOrder) {
		// TODO Auto-generated method stub
		SalesOrder so = new SalesOrder();
		so.setCreatedOn(salesOrder.getCreatedOn());
		so.setModifiedOn(salesOrder.getModifiedOn());
		so.setCustomer(salesOrder.getCustomer());
		so.setGrandTotal(salesOrder.getGrandTotal());
		salesOrderDao.save(so);
		
		for(SalesOrderDetail sod : salesOrder.getSods()) {
			SalesOrderDetail detSO = new SalesOrderDetail();
			detSO.setCreatedOn(sod.getCreatedOn());
			detSO.setModifiedOn(sod.getModifiedOn());
			detSO.setQty(sod.getQty());
			detSO.setUnitPrice(sod.getUnitPrice());
			detSO.setSubTotal(sod.getSubTotal());
			detSO.setVariantId(sod.getVariantId());
			detSO.setSoId(so);
			salesOrderDetailDao.save(detSO);
			
			Outlet outlet = (Outlet) httpSession.getAttribute("outlet");
			ItemInventory inv = itemInventoryDao.searchEndingQtyByLastModifiedVariant(sod.getVariantId().getId(), outlet.getId());
			
			ItemInventory ii = new ItemInventory();
			ii.setItemVariant(sod.getVariantId());
			ii.setEndingQty(inv.getEndingQty() - sod.getQty());
			ii.setSalesOrderQty(sod.getQty());
			ii.setModifiedOn(new Date());
			ii.setAlertAtQty(inv.getAlertAtQty());
			ii.setBeginning(inv.getEndingQty());
			itemInventoryDao.save(ii);
		}
	}

}
