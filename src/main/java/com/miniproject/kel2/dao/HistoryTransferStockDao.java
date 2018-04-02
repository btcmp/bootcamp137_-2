package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.HistoryTransferStock;
import com.miniproject.kel2.model.TransferStockDetail;

public interface HistoryTransferStockDao {

	public void save(HistoryTransferStock htStock);
	
	public List<HistoryTransferStock> selectAll();
	
	public HistoryTransferStock getOne(long id);	
	
	public void update(HistoryTransferStock htStock);
	
	public void delete(HistoryTransferStock htStock);
	
	public void saveAtauUpdate(HistoryTransferStock htStock);

	public List<HistoryTransferStock> getByTsId(long id);


}
