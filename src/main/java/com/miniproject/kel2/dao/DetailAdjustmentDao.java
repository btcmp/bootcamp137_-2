package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.DetailAdjustment;

public interface DetailAdjustmentDao {

	public List<DetailAdjustment> selectAll();
	
	public DetailAdjustment getOne(long id);
	
	public void save(DetailAdjustment detAdjustment);
	
	public void update(DetailAdjustment detAdjustment);
	
	public void delete(DetailAdjustment detAdjustment);

	public List<DetailAdjustment> searchById(long id);
}
