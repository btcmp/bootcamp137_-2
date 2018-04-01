package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.SalesOrder;

public interface SalesOrderDao {

	public List<SalesOrder> selectAll();

	public void save(SalesOrder so);

}
