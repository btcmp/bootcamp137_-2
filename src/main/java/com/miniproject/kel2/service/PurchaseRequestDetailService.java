package com.miniproject.kel2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.RequestPurchaseDetailDao;

@Service
@Transactional
public class PurchaseRequestDetailService {

	@Autowired
	RequestPurchaseDetailDao requestDetailDao;
	
	
}
