package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.HistoryAdjustment;

public interface HistoryAdjustmentDao {
	
	public List<HistoryAdjustment> selectAll();
	
	public HistoryAdjustment getOne(long id);
	
	public void save(HistoryAdjustment hisAdjustment);
	
	public void update(HistoryAdjustment hisAdjustment);
	
	public void delete(HistoryAdjustment hisAdjustment);

	public List<HistoryAdjustment> searchById(long id);

	public HistoryAdjustment searchByIdAdjustment(long id);
}
