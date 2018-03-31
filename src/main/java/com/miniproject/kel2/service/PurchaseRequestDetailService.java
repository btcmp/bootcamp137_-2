package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.RequestPurchaseDetailDao;
import com.miniproject.kel2.model.PurchaseRequest;
import com.miniproject.kel2.model.RequestDetail;

@Service
@Transactional
public class PurchaseRequestDetailService {

	@Autowired
	RequestPurchaseDetailDao requestDetailDao;

	public List<RequestDetail> selectAll() {
		// TODO Auto-generated method stub
		return requestDetailDao.selectAll();
	}

	public List<RequestDetail> selectByRequest(PurchaseRequest pr) {
		// TODO Auto-generated method stub
		return requestDetailDao.selectByRequest(pr);
	}
	
	
}
