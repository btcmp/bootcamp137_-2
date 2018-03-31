package com.miniproject.kel2.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.HistoryPurchaseRequestDao;
import com.miniproject.kel2.dao.PurchaseRequestDao;
import com.miniproject.kel2.dao.RequestPurchaseDetailDao;
import com.miniproject.kel2.model.HistoryPurchaseRequest;
import com.miniproject.kel2.model.PurchaseRequest;
import com.miniproject.kel2.model.RequestDetail;

@Service
@Transactional
public class PurchaseRequestService {

	@Autowired
	PurchaseRequestDao prDao;
	
	@Autowired
	HistoryPurchaseRequestDao hprDao;
	
	@Autowired
	RequestPurchaseDetailDao rpdDao;

	public List<PurchaseRequest> selectAll() {
		// TODO Auto-generated method stub
		return prDao.selectAll();
	}

	public void save(PurchaseRequest pr) {
		// TODO Auto-generated method stub
		PurchaseRequest prq = new PurchaseRequest();
		prq.setCreatedOn(new Date());
		prq.setStatus(pr.getStatus());
		prq.setNotes(pr.getNotes());
		prq.setPrNo(pr.getPrNo());
		prDao.save(prq);
		
			for(HistoryPurchaseRequest hpr : pr.getHistoryPr()) {
				HistoryPurchaseRequest hisPr = new HistoryPurchaseRequest();
				hisPr.setPr(prq);
				hisPr.setCreatedOn(new Date());
				hisPr.setStatus(hpr.getStatus());
				hprDao.save(hisPr);
			}
			
			for(RequestDetail rd : pr.getRequestDetail()) {
				RequestDetail rds = new RequestDetail();
				rds.setPr(prq);
				rds.setCreatedOn(new Date());
				rds.setItemvar(rd.getItemvar());
				rds.setRequestQty(rd.getRequestQty());
				
				rpdDao.save(rds);
			}
	}

	public PurchaseRequest getOne(long id) {
		// TODO Auto-generated method stub
		PurchaseRequest pr = prDao.getOne(id);
		
		return pr;
	}
	
	
	
}
