package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.PurchaseRequest;
import com.miniproject.kel2.model.RequestDetail;

public interface RequestPurchaseDetailDao {

	public List<RequestDetail> selectAll();

	public RequestDetail getOne(long id);
	
	public void save(RequestDetail requestDetail);
	
	public void update(RequestDetail requestDetail);
	
	public void delete(RequestDetail requestDetail);

	public List<RequestDetail> selectByRequest(PurchaseRequest pr);

	public List<RequestDetail> selectDetailByPr(PurchaseRequest pr);
}
