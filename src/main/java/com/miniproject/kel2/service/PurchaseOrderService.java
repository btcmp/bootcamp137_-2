package com.miniproject.kel2.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.HistoryPurchaseOrderDao;
import com.miniproject.kel2.dao.OrderDetailDao;
import com.miniproject.kel2.dao.PurchaseOrderDao;
import com.miniproject.kel2.model.HistoryPurchaseOrder;
import com.miniproject.kel2.model.OrderDetail;
import com.miniproject.kel2.model.PurchaseOrder;

@Service
@Transactional
public class PurchaseOrderService {

	@Autowired
	PurchaseOrderDao poDao;
	
	@Autowired
	HistoryPurchaseOrderDao hpoDao;
	
	@Autowired
	OrderDetailDao odpDao;

	public List<PurchaseOrder> selectAll() {
		// TODO Auto-generated method stub
		return poDao.selectAll();
	}

	public PurchaseOrder getOne(long id) {
		// TODO Auto-generated method stub
		PurchaseOrder po = poDao.getOne(id);
		
		List<OrderDetail> pod = odpDao.selectDetailByPo(po);
		List<HistoryPurchaseOrder> hpo = hpoDao.selectByPo(po);
		if(pod.isEmpty()) {
			
		}else {
			po.setDetail(pod);
		}
		if(hpo.isEmpty()) {
			
		}else {
			po.setHistory(hpo);
		}
		return po;
	}

	public void save(PurchaseOrder po) {
		// TODO Auto-generated method stub
		
		PurchaseOrder ordPur = new PurchaseOrder();
		ordPur.setId(po.getId());
		ordPur.setModifiedBy(po.getModifiedBy());
		ordPur.setModifiedOn(po.getModifiedOn());
		ordPur.setOutlet(po.getOutlet());
		ordPur.setStatus(po.getStatus());
		ordPur.setNotes(po.getNotes());
		
		
		PurchaseOrder puro = poDao.getOne(ordPur.getId());
		ordPur.setCreatedOn(puro.getCreatedOn());
		ordPur.setPoNo(puro.getPoNo());
		ordPur.setSupplier(po.getSupplier());
		ordPur.setGrandTotal(po.getGrandTotal());
		ordPur.setPr(puro.getPr());
		poDao.update(ordPur);
		
		PurchaseOrder OneordPur = poDao.getOne(ordPur.getId());
		ordPur.setCreatedBy(OneordPur.getCreatedBy());
		ordPur.setCreatedOn(new Date());
		ordPur.setNotes(OneordPur.getNotes());
		ordPur.setPoNo(OneordPur.getPoNo());
		ordPur.setGrandTotal(po.getGrandTotal());
		ordPur.setSupplier(po.getSupplier());
		ordPur.setModifiedOn(po.getModifiedOn());
		ordPur.setStatus("created po");
		ordPur.setPr(OneordPur.getPr());
		poDao.update(ordPur);

		List<OrderDetail> ods = odpDao.selectDetailByPo(ordPur);
		if(ods == null) {
					
				}else {
					for(OrderDetail pod : ods) {
						odpDao.delete(pod);
					}
				}
		
		if(po.getDetail()!=null) {
			for(OrderDetail od : po.getDetail()) {
				OrderDetail detPurOrd = new OrderDetail();
				detPurOrd.setId(od.getId());
				detPurOrd.setCreatedOn(ordPur.getCreatedOn());
				detPurOrd.setModifiedOn(ordPur.getModifiedOn());
				detPurOrd.setPo(ordPur);
				detPurOrd.setVariant(od.getVariant());
				detPurOrd.setRequestQty(od.getRequestQty());
				detPurOrd.setSubTotal(od.getSubTotal());
				detPurOrd.setUnitCost(od.getUnitCost());
				odpDao.save(detPurOrd);
			}
		}
	}


	public void approve(long id) {
		poDao.approve(id);
		PurchaseOrder po = poDao.getOne(id);
		HistoryPurchaseOrder hpo = new HistoryPurchaseOrder();
		hpo.setCreatedOn(new Date());
		hpo.setPo(po);
		hpo.setStatus(po.getStatus());
		
		hpoDao.save(hpo);
	}

	public void printed(long id) {
		// TODO Auto-generated method stub
		poDao.Print(id);
		PurchaseOrder po = poDao.getOne(id);
		HistoryPurchaseOrder hpo = new HistoryPurchaseOrder();
		hpo.setCreatedOn(new Date());
		hpo.setPo(po);
		hpo.setStatus(po.getStatus());
		
		hpoDao.save(hpo);
	}


	public void rejected(long id) {
		// TODO Auto-generated method stub
		poDao.rejected(id);
		PurchaseOrder po = poDao.getOne(id);
		HistoryPurchaseOrder hpo = new HistoryPurchaseOrder();
		hpo.setCreatedOn(new Date());
		hpo.setPo(po);
		hpo.setStatus(po.getStatus());
		
		hpoDao.save(hpo);
	}

	public void process(long id) {
		// TODO Auto-generated method stub
		poDao.process(id);
		PurchaseOrder po = poDao.getOne(id);
		HistoryPurchaseOrder hpo = new HistoryPurchaseOrder();
		hpo.setCreatedOn(new Date());
		hpo.setPo(po);
		hpo.setStatus(po.getStatus());
		
		hpoDao.save(hpo);
	}

	public List<PurchaseOrder> searchByStatus(PurchaseOrder po) {
		// TODO Auto-generated method stub
		return poDao.searchByStatus(po);
	}

	public void submit(long id) {
		// TODO Auto-generated method stub
		poDao.submit(id);
		PurchaseOrder po = poDao.getOne(id);
		HistoryPurchaseOrder hpo = new HistoryPurchaseOrder();
		hpo.setCreatedOn(new Date());
		hpo.setPo(po);
		hpo.setStatus(po.getStatus());
		
		hpoDao.save(hpo);
	}
	

}
