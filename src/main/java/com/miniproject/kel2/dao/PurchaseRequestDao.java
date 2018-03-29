package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.PurchaseRequest;

public interface PurchaseRequestDao {

	public List<PurchaseRequest> selectAll();

	public PurchaseRequest getOne(long id);
	
	public void save(PurchaseRequest purchaseRequest);
	
	public void update(PurchaseRequest purchaseRequest);
	
	public void delete(PurchaseRequest purchaseRequest);
}