package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.Adjustment;

public interface AdjustmentDao {

	public List<Adjustment> selectAll();
	
	public Adjustment getOne(long id);
	
	public void save(Adjustment adjustment);
	
	public void update(Adjustment adjustment);
	
	public void delete(Adjustment adjusment);

	public void updateStatusAdjustment(String status, long id);

	public List<Adjustment> searchByDateRange(long tglFrom, long tglTo);
}
