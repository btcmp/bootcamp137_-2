package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.District;

public interface DistrictDao {

	public List<District> selectByRegion(long id);
	
	public List<District> selectAll();
}
