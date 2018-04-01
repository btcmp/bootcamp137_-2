package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.SalesOrderDao;
import com.miniproject.kel2.dao.SalesOrderDetailDao;
import com.miniproject.kel2.model.SalesOrder;
import com.miniproject.kel2.model.SalesOrderDetail;

@Service
@Transactional
public class SalesOrderService {
	
	@Autowired
	SalesOrderDao salesOrderDao;
	
	@Autowired
	SalesOrderDetailDao salesOrderDetailDao;

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
		}
	}

}
