package com.miniproject.kel2.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.AdjustmentDao;
import com.miniproject.kel2.dao.DetailAdjustmentDao;
import com.miniproject.kel2.dao.HistoryAdjustmentDao;
import com.miniproject.kel2.dao.ItemInventoryDao;
import com.miniproject.kel2.model.Adjustment;
import com.miniproject.kel2.model.DetailAdjustment;
import com.miniproject.kel2.model.Employee;
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
	
	@Autowired
	HttpSession httpSession;
	
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
		adj.setCreatedBy(adjustment.getCreatedBy());
		adj.setOutletId(adjustment.getOutletId());
		adjustmentDao.save(adj);
		
		for(HistoryAdjustment ha : adjustment.getHisAdjustments()) {
			HistoryAdjustment hisAdj = new HistoryAdjustment();
			hisAdj.setAdjustmentId(adj);
			hisAdj.setCreatedOn(new Date());
			hisAdj.setStatus(ha.getStatus());
			hisAdj.setCreatedBy(ha.getCreatedBy());
			hisAdjustmentDao.save(hisAdj);
		}
		
		for(DetailAdjustment da : adjustment.getDetAdjustments()) {
			DetailAdjustment detAdj = new DetailAdjustment();
			detAdj.setAdjustmentId(adj);
			detAdj.setActualStock(da.getActualStock());
			detAdj.setInStock(da.getInStock());
			detAdj.setCreatedOn(new Date());
			detAdj.setVariantId(da.getVariantId());
			detAdj.setCreatedBy(da.getCreatedBy());
			detAdjustmentDao.save(detAdj);
			
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
		
		if(status.equals("Approved")) {
			List<DetailAdjustment> detAdjustments = detAdjustmentDao.searchById(id);
			for(DetailAdjustment detAdj : detAdjustments) {
				Employee employee = (Employee) httpSession.getAttribute("employee");
				ItemInventory inv = itemInventoryDao.searchEndingQtyByLastModifiedVariant(detAdj.getVariantId().getId(), detAdj.getAdjustmentId().getOutletId().getId());
				
				ItemInventory ii = new ItemInventory();
				ii.setItemVariant(detAdj.getVariantId());
				ii.setEndingQty(detAdj.getActualStock());
				ii.setAdjustmentQty(detAdj.getActualStock() - detAdj.getInStock());
				ii.setModifiedOn(new Date());
				ii.setModifiedBy(employee.getUser().getId());
				itemInventoryDao.update(ii);
			}
		}
	}

	public List<Adjustment> searchByDateRange(Date tglFrom, Date tglTo) {
		// TODO Auto-generated method stub
		return adjustmentDao.searchByDateRange(tglFrom, tglTo);
	}

	public List<Adjustment> selectAllByOutlet(long idOutlet) {
		// TODO Auto-generated method stub
		return adjustmentDao.selectAllByOutlet(idOutlet);
	}
	
}
