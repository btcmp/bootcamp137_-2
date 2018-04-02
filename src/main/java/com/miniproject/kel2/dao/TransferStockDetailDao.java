package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.TransferStockDetail;

public interface TransferStockDetailDao {

	public void save(TransferStockDetail tsDetail);
	
	public List<TransferStockDetail> selectAll();
	
//	public TransferStockDetail getOne(long id);	
	
	public TransferStockDetail getOne(TransferStockDetail tsDetail);
	
	public void update(TransferStockDetail tsDetail);
	
	public void delete(TransferStockDetail tsDetail);
	
	public void saveAtauUpdate(TransferStockDetail tsDetail);
	
	// untuk search
	public List<TransferStockDetail> getTransferStockById(long search);
	
	public List<TransferStockDetail> searchById(long id);
}
