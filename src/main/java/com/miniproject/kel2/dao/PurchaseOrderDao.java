package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.PurchaseOrder;

public interface PurchaseOrderDao {

	public List<PurchaseOrder> selectAll();

	public PurchaseOrder getOne(long id);
	
	public void save(PurchaseOrder purchaseOrder);
	
	public void update(PurchaseOrder purchaseOrder);
	
	public void delete(PurchaseOrder purchaseOrder);

	public void approve(long id);

	public void rejected(long id);

	public void process(long id);

	public void Print(long id);

	public List<PurchaseOrder> searchByStatus(PurchaseOrder po);

	public int CountPRByMonth(int bulan, int tahun);

	public int CountPrByPrNo(String poNo);

	public void submit(long id);

	public List<PurchaseOrder> getAllByOutletId(long idOut);
}
