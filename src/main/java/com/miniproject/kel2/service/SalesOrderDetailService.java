package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.SalesOrderDao;
import com.miniproject.kel2.dao.SalesOrderDetailDao;
import com.miniproject.kel2.model.SalesOrderDetail;

@Service
@Transactional
public class SalesOrderDetailService {
	
	@Autowired
	SalesOrderDetailDao salesOrderDetailDao;
	
	@Autowired
	SalesOrderDao salesOrderDao;

	public List<SalesOrderDetail> getReceiptBySalesOrder(long idSalesOrder) {
		// TODO Auto-generated method stub
		long idSales = salesOrderDao.getIdSalesOrder(idSalesOrder);
		System.out.println("id Sales Order : "+idSales);
		if(idSales != 0) {
			return salesOrderDetailDao.getReceiptBySalesOrder(idSales);
		}else {
			return null;
		}
		
	}

}
