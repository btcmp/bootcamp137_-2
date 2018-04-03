package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.PurchaseOrder;
import com.miniproject.kel2.model.OrderDetail;

public interface OrderDetailDao {

	public List<OrderDetail> selectAll();

	public OrderDetail getOne(long id);
	
	public void save(OrderDetail orderDetail);
	
	public void update(OrderDetail orderDetail);
	
	public void delete(OrderDetail orderDetail);

	public List<OrderDetail> selectByOrder(PurchaseOrder po);

	public List<OrderDetail> selectDetailByPo(PurchaseOrder po);
}
