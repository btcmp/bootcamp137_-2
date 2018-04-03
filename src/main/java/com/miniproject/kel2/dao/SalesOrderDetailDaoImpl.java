package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.SalesOrderDetail;

@Repository
public class SalesOrderDetailDaoImpl implements SalesOrderDetailDao{

	@Autowired
	SessionFactory sessionFactory;

	public void save(SalesOrderDetail detSO) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(detSO);
		session.flush();
	}

	public List<SalesOrderDetail> getReceiptBySalesOrder(long idSalesOrder) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from SalesOrderDetail sod where sod.soId.id = :idso";
		List<SalesOrderDetail> sods = session.createQuery(hql).setParameter("idso", idSalesOrder).list();
		if(sods.isEmpty()) {
			return null;
		}else {
			return sods;
		}
		
	}
}
