package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.SalesOrderDetail;

public interface SalesOrderDetailDao {

	void save(SalesOrderDetail detSO);

	List<SalesOrderDetail> getReceiptBySalesOrder(long idSalesOrder);

}
