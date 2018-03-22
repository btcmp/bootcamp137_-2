package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.Region;

public interface RegionDao {

	public List<Region> selectByProvince(long id);
	
	public List<Region> selectAll();
	
}
