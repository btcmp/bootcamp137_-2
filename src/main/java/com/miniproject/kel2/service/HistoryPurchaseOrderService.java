package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.HistoryPurchaseOrderDao;
import com.miniproject.kel2.model.HistoryPurchaseOrder;
import com.miniproject.kel2.model.PurchaseOrder;

@Service
@Transactional
public class HistoryPurchaseOrderService {

	@Autowired
	HistoryPurchaseOrderDao hpoDao;

	public List<HistoryPurchaseOrder> selectByOrder(PurchaseOrder po) {
		// TODO Auto-generated method stub
		return hpoDao.selectByPo(po);
	}

}
