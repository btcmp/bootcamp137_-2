package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.Outlet;

public interface OutletDao {

	public void save (Outlet outlet);
	
	public List<Outlet> selectAll();
	
	public Outlet getOne(Outlet outlet);
	
	public void delete(Outlet outlet);
	
	public void update(Outlet outlet);
	
	public void saveAtauUpdate(Outlet outlet);
	
	
}
