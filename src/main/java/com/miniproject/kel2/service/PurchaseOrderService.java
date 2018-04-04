package com.miniproject.kel2.service;

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
		
		PurchaseOrder purOrd = new PurchaseOrder();
		purOrd.setId(po.getId());
		purOrd.setModifiedOn(new Date());
		purOrd.setNotes(po.getNotes());
		purOrd.setOutlet(po.getOutlet());
		purOrd.setSupplier(po.getSupplier());
		purOrd.setPoNo(po.getPoNo());
		purOrd.setSupplier(po.getSupplier());
		purOrd.setStatus("created_po");
		purOrd.setGrandTotal(po.getGrandTotal());
		poDao.update(purOrd);

		List<OrderDetail> ods = odpDao.selectDetailByPo(purOrd);
		if(ods == null) {
					
				}else {
					for(OrderDetail pod : ods) {
						odpDao.delete(pod);
					}
				}
		
		if(po.getDetail()!=null) {
			for(OrderDetail od : po.getDetail()) {
				OrderDetail purOrDet = new OrderDetail();
				purOrDet.setId(od.getId());
				purOrDet.setCreatedOn(purOrd.getCreatedOn());
				purOrDet.setModifiedOn(purOrd.getModifiedOn());
				purOrDet.setPo(purOrd);
				purOrDet.setVariant(od.getVariant());
				purOrDet.setRequestQty(od.getRequestQty());
				purOrDet.setSubTotal(od.getSubTotal());
				purOrDet.setUnitCost(od.getUnitCost());
				odpDao.save(purOrDet);
			}
		}
	}
	
	

}
