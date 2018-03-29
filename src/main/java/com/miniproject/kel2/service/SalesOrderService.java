package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.SalesOrderDao;
import com.miniproject.kel2.model.SalesOrder;

@Service
@Transactional
public class SalesOrderService {
	
	@Autowired
	SalesOrderDao salesOrderDao;

	public List<SalesOrder> selectAll() {
		// TODO Auto-generated method stub
		return salesOrderDao.selectAll();
	}

}
