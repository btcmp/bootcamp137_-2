package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.OrderDetailDao;
import com.miniproject.kel2.model.OrderDetail;
import com.miniproject.kel2.model.PurchaseOrder;

@Service
@Transactional
public class PurchaseOrderDetailService {
	
	@Autowired
	OrderDetailDao odpDao;

	public List<OrderDetail> selectAll() {
		// TODO Auto-generated method stub
		return odpDao.selectAll();
	}

	public List<OrderDetail> selectByOrder(PurchaseOrder po) {
		// TODO Auto-generated method stub
		return odpDao.selectByOrder(po);
	}
}
