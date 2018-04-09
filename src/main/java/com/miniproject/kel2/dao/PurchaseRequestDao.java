package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.PurchaseRequest;

public interface PurchaseRequestDao {

	public List<PurchaseRequest> selectAll();

	public PurchaseRequest getOne(long id);
	
	public void save(PurchaseRequest purchaseRequest);
	
	public void update(PurchaseRequest purchaseRequest);
	
	public void delete(PurchaseRequest purchaseRequest);

	public void approve(long id);

	public void printed(long id);

	public void created(long id);

	public void rejected(long id);

	public int jumlahPr(PurchaseRequest pr);

	public int CountPRByMonth(int bulan, int tahun);

	public int CountPrByPrNo(String prNo);
}
