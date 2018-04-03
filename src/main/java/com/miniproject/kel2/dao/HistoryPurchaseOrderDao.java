package com.miniproject.kel2.dao;

import java.util.List;


import com.miniproject.kel2.model.HistoryPurchaseOrder;
import com.miniproject.kel2.model.PurchaseOrder;

public interface HistoryPurchaseOrderDao {
	public List<HistoryPurchaseOrder> selectAll();

	public HistoryPurchaseOrder getOne(long id);
	
	public void save(HistoryPurchaseOrder historyPo);
	
	public void update(HistoryPurchaseOrder historyPo);
	
	public void delete(HistoryPurchaseOrder historyPo);

	public List<HistoryPurchaseOrder> selectByPo(PurchaseOrder po);
}
