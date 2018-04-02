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
		/*PurchaseRequest prq = new PurchaseRequest();
		
		pr.setId(pr.getId());
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
				prds.setCreatedOn(new Date());
				prds.setItemvar(rd.getItemvar());
				prds.setRequestQty(rd.getRequestQty());
				prds.setModifiedOn(rd.getModifiedOn());
				prds.setPr(prq);
				
				rpdDao.save(prds);
			}
		}
			
		if(pr.getId() != 0 && pr.getStatus()=="Created") {
			
		}else {
			for(HistoryPurchaseRequest hpr : pr.getHistoryPr()) {
				HistoryPurchaseRequest hisPr = new HistoryPurchaseRequest();
				
				hisPr.setCreatedOn(new Date());
				hisPr.setStatus(hpr.getStatus());
				hisPr.setPr(prq);
				hprDao.save(hisPr);
			}
		}
		
*/	
		//nanti malem di chek lagi
		PurchaseRequest pureq = new PurchaseRequest();
		pureq.setId(pr.getId());
		pureq.setOutlet(pr.getOutlet());
		pureq.setPrNo(pr.getPrNo());
		pureq.setReadyTime(pr.getReadyTime());
		pureq.setStatus(pr.getStatus());
		pureq.setNotes(pr.getNotes());
		
		
		if(pureq.getId()!=0) {
			pureq.setModifiedOn(new Date());
			PurchaseRequest pure = prDao.getOne(pureq.getId());
			pureq.setCreatedOn(pure.getCreatedOn());
		}else {
			pureq.setCreatedOn(new Date());
		}
		
		Calendar cal = Calendar.getInstance();
		
		int tahun = cal.get(Calendar.YEAR);
		
		
		prDao.save(pureq);
		
		
		List<RequestDetail> prds = rpdDao.selectDetailByPr(pureq);
		if(prds == null) {
			
		}else {
			for(RequestDetail prd : prds) {
				rpdDao.delete(prd);
			}
		}
		
		if(pr.getRequestDetail()!=null) {
			for(RequestDetail prd : pr.getRequestDetail()) {
				RequestDetail puReqDet = new RequestDetail();
				puReqDet.setId(prd.getId());
				puReqDet.setCreatedOn(pureq.getCreatedOn());
				puReqDet.setModifiedOn(pureq.getModifiedOn());
				puReqDet.setPr(pureq);
				puReqDet.setItemvar(prd.getItemvar());
				puReqDet.setRequestQty(prd.getRequestQty());
				puReqDet.setCreatedOn(pureq.getCreatedOn());
				rpdDao.save(puReqDet);
			}
		}
		
		if(pr.getId() != 0 && pr.getStatus()=="created") {
			
		}else {
			HistoryPurchaseRequest prh = new HistoryPurchaseRequest();
			prh.setPr(pureq);
			prh.setStatus(pureq.getStatus());
			prh.setCreatedOn(pureq.getCreatedOn());
			hprDao.save(prh);
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
	
	
	
}
