package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.HistoryPurchaseRequest;
import com.miniproject.kel2.model.PurchaseRequest;
import com.miniproject.kel2.model.RequestDetail;

@Repository
public class HistoryPurchaseRequestDaoImpl implements HistoryPurchaseRequestDao {

	
	@Autowired
	SessionFactory sessionFactory;
	
	
	public List<HistoryPurchaseRequest> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(HistoryPurchaseRequest.class).list();
	}

	public HistoryPurchaseRequest getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(HistoryPurchaseRequest.class, id);
	}

	public void save(HistoryPurchaseRequest historyPr) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(historyPr);
		session.flush();
	}

	public void update(HistoryPurchaseRequest historyPr) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(historyPr);
		session.flush();
	}

	public void delete(HistoryPurchaseRequest historyPr) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(historyPr);
		session.flush();
	}

	public List<HistoryPurchaseRequest> selectByPR(PurchaseRequest pr) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<HistoryPurchaseRequest> hpr = session.createCriteria(HistoryPurchaseRequest.class)
				.add(Restrictions.eq("pr.id", pr.getId())).addOrder(Order.asc("createdOn")).list(); 
		
		if(hpr.isEmpty()) {
			return null;
		} else {
			return hpr;
		}
	}

}
