package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.PurchaseRequestDao;
import com.miniproject.kel2.model.PurchaseRequest;

@Service
@Transactional
public class PurchaseRequestService {

	@Autowired
	PurchaseRequestDao prDao;

	public List<PurchaseRequest> selectAll() {
		// TODO Auto-generated method stub
		return prDao.selectAll();
	}

	public void save(PurchaseRequest pr) {
		// TODO Auto-generated method stub
		prDao.save(pr);
	}
	
	
	
}
