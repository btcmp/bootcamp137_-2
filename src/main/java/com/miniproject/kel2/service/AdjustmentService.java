package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.AdjustmentDao;
import com.miniproject.kel2.dao.ItemInventoryDao;
import com.miniproject.kel2.model.Adjustment;

@Service
@Transactional
public class AdjustmentService {
	
	@Autowired
	AdjustmentDao adjustmentDao;
	
	@Autowired
	ItemInventoryDao itemInventoryDao;
	
	public List<Adjustment> selectAll(){
		return adjustmentDao.selectAll();
	}
	
	public Adjustment getOne(long id) {
		return adjustmentDao.getOne(id);
	}
	
	public void save(Adjustment adjustment) {
		adjustmentDao.save(adjustment);
		
		itemInventoryDao.updateInStock(adjustment.getDetAdjustments().get(0).getInStock(), adjustment.getDetAdjustments().get(0).getVariantId().getId());
	}
	
	public void update(Adjustment adjustment) {
		adjustmentDao.update(adjustment);
	}
	
	public void delete(long id) {
		Adjustment adjustment = new Adjustment();
		adjustment.setId(id);
		adjustmentDao.delete(adjustment);
	}
	
}
