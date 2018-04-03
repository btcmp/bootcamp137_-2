package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.HistoryPurchaseOrder;
import com.miniproject.kel2.model.HistoryPurchaseRequest;
import com.miniproject.kel2.model.PurchaseOrder;

@Repository
public class HistoryPurchaseOrderDaoImpl implements HistoryPurchaseOrderDao{

	@Autowired
	SessionFactory sessionFactory;

	public List<HistoryPurchaseOrder> selectAll() {
		// TODO Auto-generated method stub

		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(HistoryPurchaseRequest.class).list();
	}

	public HistoryPurchaseOrder getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(HistoryPurchaseOrder.class, id);
	}

	public void save(HistoryPurchaseOrder historyPo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(historyPo);
		session.flush();
	}

	public void update(HistoryPurchaseOrder historyPo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(historyPo);
		session.flush();
	}

	public void delete(HistoryPurchaseOrder historyPo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(historyPo);
		session.flush();
	}

	public List<HistoryPurchaseOrder> selectByPo(PurchaseOrder po) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<HistoryPurchaseOrder> hpo = session.createCriteria(HistoryPurchaseOrder.class)
				.add(Restrictions.eq("po.id", po.getId())).addOrder(Order.asc("createdOn")).list(); 
		
		if(hpo.isEmpty()) {
			return null;
		} else {
			return hpo;
		}
	}
}
