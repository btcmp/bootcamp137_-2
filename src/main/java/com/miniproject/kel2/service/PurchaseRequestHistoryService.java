package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.HistoryPurchaseRequestDao;
import com.miniproject.kel2.model.HistoryPurchaseRequest;
import com.miniproject.kel2.model.PurchaseRequest;

@Service
@Transactional
public class PurchaseRequestHistoryService {

	@Autowired
	HistoryPurchaseRequestDao historyRequestDao;

	

	public List<HistoryPurchaseRequest> selectByRequest(PurchaseRequest pr) {
		// TODO Auto-generated method stub
		return historyRequestDao.selectByPR(pr);
	}
	
	
}
