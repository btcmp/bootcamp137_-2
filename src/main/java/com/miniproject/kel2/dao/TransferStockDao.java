package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.Outlet;
import com.miniproject.kel2.model.TransferStock;

public interface TransferStockDao {

	public void save(TransferStock transferStock);
	
	public List<TransferStock> selectAll();
	
//	public TransferStock getOne(long id);
	
	public TransferStock getOne(TransferStock transferStock);
	
	public void update(TransferStock transferStock);
	
	public void delete(TransferStock transferStock);
	
	public void saveUpdate(TransferStock transferStock);
	
	// untuk list outlet
	public List<Outlet> outSelectAll();
	
	// untuk search
	public List<TransferStock> getByOutletId(long search);
	
	// untuk update status
	public void updateStatus(String status, long id);
	
	
}
