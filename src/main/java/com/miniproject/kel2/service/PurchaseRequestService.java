package com.miniproject.kel2.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.HistoryPurchaseOrderDao;
import com.miniproject.kel2.dao.HistoryPurchaseRequestDao;
import com.miniproject.kel2.dao.OrderDetailDao;
import com.miniproject.kel2.dao.PurchaseOrderDao;
import com.miniproject.kel2.dao.PurchaseRequestDao;
import com.miniproject.kel2.dao.RequestPurchaseDetailDao;
import com.miniproject.kel2.model.HistoryPurchaseOrder;
import com.miniproject.kel2.model.HistoryPurchaseRequest;
import com.miniproject.kel2.model.OrderDetail;
import com.miniproject.kel2.model.Outlet;
import com.miniproject.kel2.model.PurchaseOrder;
import com.miniproject.kel2.model.PurchaseRequest;
import com.miniproject.kel2.model.RequestDetail;

@Service
@Transactional
public class PurchaseRequestService {
	@Autowired
	HttpSession httpSession;

	@Autowired
	PurchaseRequestDao prDao;
	
	@Autowired
	HistoryPurchaseRequestDao hprDao;
	
	@Autowired
	RequestPurchaseDetailDao rpdDao;
	
	@Autowired
	PurchaseOrderDao poDao;
	
	@Autowired
	HistoryPurchaseOrderDao hpoDao;
	
	@Autowired
	OrderDetailDao odpDao; 

	public List<PurchaseRequest> selectAll() {
		// TODO Auto-generated method stub
		return prDao.selectAll();
	}

	public void save(PurchaseRequest pr) {
		// TODO Auto-generated method stub
		
		
		PurchaseRequest prq = new PurchaseRequest();
		prq.setId(pr.getId());
		//prq.setCreatedOn(prq.getCreatedOn());
		prq.setStatus(pr.getStatus());
		prq.setNotes(pr.getNotes());
		
		Calendar calender = Calendar.getInstance(); // get calender
		int tahun = calender.get(Calendar.YEAR);
		int bulan = calender.get(Calendar.MONTH);
		int hari = calender.get(Calendar.DATE);
		
		String month = null;
		if(bulan < 10) {
			month = "0"+ bulan;
		} 
		else {
			month = Integer.toString(bulan)+1;
		}
		
		//set number
		int no = prDao.CountPRByMonth(bulan, tahun)+1;
 		String nomor;
 		
 		if(no < 10) {
 			nomor = "00"+no;
 		} else if(no < 100) {
 			nomor = "0"+no;
 		} else {
 			nomor = Integer.toString(no);
 		}
		
		
		String prNo = "PR_" +tahun+month+nomor;
		
		
		int unique = 0;
		while(unique == 0) {
		prNo = "PR_" +tahun+month+nomor;
		int jmlPr = prDao.CountPrByPrNo(prNo);
			if(jmlPr == 0) {
				unique = 1;
			}else {
			int noTambah = Integer.parseInt(nomor);
			 noTambah++;
			if( noTambah < 10) {
				nomor = "00"+ noTambah;
				} else if( noTambah < 100) {
				nomor = "0"+ noTambah;
				} else {
				nomor = Integer.toString(no);
					}
				}
		}
		
		prq.setReadyTime(pr.getReadyTime());
		prq.setOutlet(pr.getOutlet());
		prq.setCreatedBy(pr.getCreatedBy());
		
		
		if(prq.getId() != 0) {
			prq.setModifiedOn(new Date());
			PurchaseRequest request = prDao.getOne(prq.getId());
			prq.setCreatedOn(request.getCreatedOn());
			prq.setPrNo(request.getPrNo());
		}else {
			prq.setCreatedOn(new Date());
			prq.setPrNo(prNo);
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
				prds.setCreatedBy(rd.getCreatedBy());
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
				
				hisPr.setCreatedOn(prq.getCreatedOn());
				hisPr.setCreatedBy(prq.getCreatedBy());
				hisPr.setStatus(prq.getStatus());
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
		hpr.setCreatedBy(pr.getCreatedBy());
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
		hpr.setCreatedBy(pr.getCreatedBy());
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
		hpr.setCreatedBy(pr.getCreatedBy());
		hpr.setStatus(pr.getStatus());
		
		hprDao.save(hpr);
	}
	
	public void created(long id) {
		// TODO Auto-generated method stub
		prDao.created(id);
		PurchaseRequest pr = prDao.getOne(id);
		//cari prd by pr
		
		List<RequestDetail> prd = rpdDao.selectDetailByPr(pr);
		
		if(prd.isEmpty()) {
			
		} else {
			pr.setRequestDetail(prd);
		}
		
		HistoryPurchaseRequest hpr = new HistoryPurchaseRequest();
		hpr.setCreatedOn(new Date());
		hpr.setPr(pr);
		hpr.setCreatedBy(pr.getCreatedBy());
		hpr.setStatus(pr.getStatus());
		hprDao.save(hpr);
		
		//save to po
		Outlet outs = (Outlet) httpSession.getAttribute("outlet");
		
		
		float grandTotal = 0;
		PurchaseOrder po = new PurchaseOrder();
		po.setCreatedOn(hpr.getCreatedOn());
		po.setCreatedBy(hpr.getCreatedBy());
		
		Calendar calender = Calendar.getInstance(); // get calender
		int tahun = calender.get(Calendar.YEAR);
		int bulan = calender.get(Calendar.MONTH);
		
		String month = null;
		if(bulan < 10) {
			month = "0"+ bulan;
		} 
		else {
			month = Integer.toString(bulan)+1;
		}
		
		//set number
		int no = poDao.CountPRByMonth(bulan, tahun)+1;
 		String nomor;
 		
 		if(no < 10) {
 			nomor = "00"+no;
 		} else if(no < 100) {
 			nomor = "0"+no;
 		} else {
 			nomor = Integer.toString(no);
 		}
		
		
		String poNo = "PO_" +tahun+month+nomor;
		
		System.out.println(poNo);
		
		po.setPoNo(poNo);
		po.setGrandTotal(grandTotal);
		po.setPr(pr);
		po.setOutlet(outs);
		po.setNotes(pr.getNotes());
		poDao.save(po);
		
		if(pr.getRequestDetail() != null) {
			for(RequestDetail rd : pr.getRequestDetail()) {
				OrderDetail pod = new OrderDetail();
				pod.setCreatedOn(rd.getCreatedOn());
				pod.setCreatedBy(rd.getCreatedBy());
				pod.setModifiedBy(rd.getModifiedBy());
				pod.setModifiedOn(rd.getModifiedOn());
				pod.setRequestQty(rd.getRequestQty());
				pod.setVariant(rd.getItemvar());
				pod.setUnitCost(rd.getItemvar().getPrice());
				pod.setSubTotal(rd.getItemvar().getPrice()*rd.getRequestQty());
				grandTotal += ((rd.getItemvar().getPrice()*rd.getRequestQty()));
				pod.setPo(po);
				odpDao.save(pod);
			}
			
			PurchaseOrder newPo = new PurchaseOrder();
			newPo.setId(po.getId());
			newPo.setGrandTotal(grandTotal);
			newPo.setPoNo(poNo);
			newPo.setOutlet(po.getOutlet());
			newPo.setCreatedBy(po.getCreatedBy());
			newPo.setStatus("Unchecked");
			newPo.setPr(po.getPr());
			
			poDao.update(newPo);
				
		}
		
		
		
		HistoryPurchaseOrder hpo = new HistoryPurchaseOrder();
		hpo.setCreatedOn(po.getCreatedOn());
		hpo.setCreatedBy(po.getCreatedBy());
		hpo.setStatus("Created Po");
		hpo.setPo(po);
		hpoDao.save(hpo);
		
	}

	public void submit(long id) {
		// TODO Auto-generated method stub
		prDao.submit(id);
		PurchaseRequest pr = prDao.getOne(id);
		HistoryPurchaseRequest hpr = new HistoryPurchaseRequest();
		hpr.setCreatedOn(new Date());
		hpr.setPr(pr);
		hpr.setCreatedBy(pr.getCreatedBy());
		hpr.setStatus(pr.getStatus());
		
		hprDao.save(hpr);
	}

	public List<PurchaseRequest> searchByStatus(String status) {
		// TODO Auto-generated method stub
		List<PurchaseRequest> pr = prDao.searchByStatus(status);
		return pr;
	}

	public List<PurchaseRequest> searchByAll(String word) {
		// TODO Auto-generated method stub
		List<PurchaseRequest> pr = prDao.searchByAll(word);
		return pr;
	}

	public List<PurchaseRequest> getAllByOutletId(long outId) {
		// TODO Auto-generated method stub
		List<PurchaseRequest> allPrByOut = prDao.getAllByOutletId(outId);
		return allPrByOut;
	}
}
