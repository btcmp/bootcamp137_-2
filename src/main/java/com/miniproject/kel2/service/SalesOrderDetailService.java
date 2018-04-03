package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.SalesOrderDetailDao;
import com.miniproject.kel2.model.SalesOrderDetail;

@Service
@Transactional
public class SalesOrderDetailService {
	
	@Autowired
	SalesOrderDetailDao salesOrderDetailDao;

	public List<SalesOrderDetail> getReceiptBySalesOrder(long idSalesOrder) {
		// TODO Auto-generated method stub
		return salesOrderDetailDao.getReceiptBySalesOrder(idSalesOrder);
	}

}
