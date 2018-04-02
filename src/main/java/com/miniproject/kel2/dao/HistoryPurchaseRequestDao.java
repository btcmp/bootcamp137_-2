package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.HistoryPurchaseRequest;
import com.miniproject.kel2.model.PurchaseRequest;

public interface HistoryPurchaseRequestDao {

	public List<HistoryPurchaseRequest> selectAll();

	public HistoryPurchaseRequest getOne(long id);
	
	public void save(HistoryPurchaseRequest historyPr);
	
	public void update(HistoryPurchaseRequest historyPr);
	
	public void delete(HistoryPurchaseRequest historyPr);

	public List<HistoryPurchaseRequest> selectByPR(PurchaseRequest pr);
}
