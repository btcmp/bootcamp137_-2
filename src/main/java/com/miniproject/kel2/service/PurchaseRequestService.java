package com.miniproject.kel2.service;

import java.util.Date;
import java.util.List;
import java.util.Calendar;

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
		prq.setId(pr.getId());
		prq.setStatus(pr.getStatus());
		prq.setNotes(pr.getNotes());
		prq.setPrNo(pr.getPrNo());
		prq.setReadyTime(pr.getReadyTime());
		prq.setOutlet(pr.getOutlet());
		
		
		if(prq.getId() != 0) {
			prq.setModifiedOn(new Date());
			PurchaseRequest request = prDao.getOne(prq.getId());
			prq.setCreatedOn(request.getCreatedOn());
		}else {
			prq.setCreatedOn(new Date());
		}
		
		prDao.save(prq);
		
		List<RequestDetail> rds = rpdDao.selectDetailByPr(prq);
		if(rds == null) {
			
		}else {
			for(RequestDetail prd : rds) {
				rpdDao.delete(prd);
			}
		}
			
		if(pr.getRequestDetail() != null) {
			for(RequestDetail rd : pr.getRequestDetail()) {
				RequestDetail prds = new RequestDetail();
				prds.setId(rd.getId());
				prds.setCreatedOn(rd.getCreatedOn());
				prds.setModifiedOn(rd.getModifiedOn());
				prds.setPr(prq);
				prds.setItemvar(rd.getItemvar());
				prds.setRequestQty(rd.getRequestQty());
				
				rpdDao.save(prds);
			}
		}
			
		if(pr.getId() != 0 && pr.getStatus()=="Created") {
			
		}else {
			
				HistoryPurchaseRequest hisPr = new HistoryPurchaseRequest();
				
				hisPr.setCreatedOn(pr.getCreatedOn());
				hisPr.setStatus(pr.getStatus());
				hisPr.setPr(prq);
				hprDao.save(hisPr);
			}
		
	}

	public PurchaseRequest getOne(long id) {
		// TODO Auto-generated method stub
		PurchaseRequest pr = prDao.getOne(id);
		
		List<RequestDetail> rds = rpdDao.selectDetailByPr(pr);
		List<HistoryPurchaseRequest> hpr = hprDao.selectByPR(pr);
		if(rds.isEmpty()) {
			
		}else {
			pr.setRequestDetail(rds);
		}
		if(hpr.isEmpty()) {
			
		}else {
			pr.setHistoryPr(hpr);
		}
		return pr;
	}
	
	
	public void approve(long id) {
		prDao.approve(id);
		PurchaseRequest pr = prDao.getOne(id);
		HistoryPurchaseRequest hpr = new HistoryPurchaseRequest();
		hpr.setCreatedOn(new Date());
		hpr.setPr(pr);
		hpr.setStatus(pr.getStatus());
		
		hprDao.save(hpr);
	}

	public void printed(long id) {
		// TODO Auto-generated method stub
		prDao.printed(id);
		PurchaseRequest pr = prDao.getOne(id);
		HistoryPurchaseRequest hpr = new HistoryPurchaseRequest();
		hpr.setCreatedOn(new Date());
		hpr.setPr(pr);
		hpr.setStatus(pr.getStatus());
		
		hprDao.save(hpr);
	}

	public void created(long id) {
		// TODO Auto-generated method stub
		prDao.created(id);
		PurchaseRequest pr = prDao.getOne(id);
		HistoryPurchaseRequest hpr = new HistoryPurchaseRequest();
		hpr.setCreatedOn(new Date());
		hpr.setPr(pr);
		hpr.setStatus(pr.getStatus());
		
		hprDao.save(hpr);
	}

	public void rejected(long id) {
		// TODO Auto-generated method stub
		prDao.rejected(id);
		PurchaseRequest pr = prDao.getOne(id);
		HistoryPurchaseRequest hpr = new HistoryPurchaseRequest();
		hpr.setCreatedOn(new Date());
		hpr.setPr(pr);
		hpr.setStatus(pr.getStatus());
		
		hprDao.save(hpr);
	}
}
