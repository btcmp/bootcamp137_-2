package com.miniproject.kel2.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.AdjustmentDao;
import com.miniproject.kel2.dao.DetailAdjustmentDao;
import com.miniproject.kel2.dao.HistoryAdjustmentDao;
import com.miniproject.kel2.dao.ItemInventoryDao;
import com.miniproject.kel2.model.Adjustment;
import com.miniproject.kel2.model.DetailAdjustment;
import com.miniproject.kel2.model.HistoryAdjustment;
import com.miniproject.kel2.model.ItemInventory;
import com.miniproject.kel2.model.ItemVariant;

@Service
@Transactional
public class AdjustmentService {
	
	@Autowired
	AdjustmentDao adjustmentDao;
	
	@Autowired
	ItemInventoryDao itemInventoryDao;
	
	@Autowired
	DetailAdjustmentDao detAdjustmentDao;
	
	@Autowired
	HistoryAdjustmentDao hisAdjustmentDao;
	
	public List<Adjustment> selectAll(){
		return adjustmentDao.selectAll();
	}
	
	public Adjustment getOne(long id) {
		return adjustmentDao.getOne(id);
	}
	
	public void save(Adjustment adjustment) {
		Adjustment adj = new Adjustment();
		adj.setCreatedOn(new Date());
		adj.setNotes(adjustment.getNotes());
		adj.setStatus(adjustment.getStatus());
		adjustmentDao.save(adj);
		
		for(HistoryAdjustment ha : adjustment.getHisAdjustments()) {
			HistoryAdjustment hisAdj = new HistoryAdjustment();
			hisAdj.setAdjustmentId(adj);
			hisAdj.setCreatedOn(new Date());
			hisAdj.setStatus(ha.getStatus());
			hisAdjustmentDao.save(hisAdj);
		}
		
		for(DetailAdjustment da : adjustment.getDetAdjustments()) {
			DetailAdjustment detAdj = new DetailAdjustment();
			detAdj.setAdjustmentId(adj);
			detAdj.setActualStock(da.getActualStock());
			detAdj.setInStock(da.getInStock());
			detAdj.setCreatedOn(new Date());
			detAdj.setVariantId(da.getVariantId());
			detAdjustmentDao.save(detAdj);
			
			ItemInventory inv = itemInventoryDao.searchEndingQtyByLastModifiedVariant(da.getVariantId().getId());
			
			ItemInventory ii = new ItemInventory();
			ii.setItemVariant(da.getVariantId());
			ii.setEndingQty(da.getInStock());
			ii.setAdjustmentQty(da.getActualStock());
			ii.setModifiedOn(new Date());
			if(inv != null) {
				ii.setAlertAtQty(inv.getAlertAtQty());
				ii.setBeginning(inv.getEndingQty());
			}else {
				ii.setAlertAtQty(5);
				ii.setBeginning(50);
			}
			itemInventoryDao.save(ii);
		}
//		itemInventoryDao.updateInStock(adjustment.getDetAdjustments().get(0).getInStock(), adjustment.getDetAdjustments().get(0).getVariantId().getId());
	}
	
	public void update(Adjustment adjustment) {
		adjustmentDao.update(adjustment);
	}
	
	public void delete(long id) {
		Adjustment adjustment = new Adjustment();
		adjustment.setId(id);
		adjustmentDao.delete(adjustment);
	}

	public void updateStatusAdjustment(long id) {
		// TODO Auto-generated method stub
		HistoryAdjustment ha = hisAdjustmentDao.searchByIdAdjustment(id);
		String status = ha.getStatus();
		adjustmentDao.updateStatusAdjustment(status, id);
	}

	public List<Adjustment> searchByDateRange(long tglFrom, long tglTo) {
		// TODO Auto-generated method stub
		return adjustmentDao.searchByDateRange(tglFrom, tglTo);
	}
	
}
