package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.PurchaseRequest;


@Repository
public class PurchaseRequestDaoImpl implements PurchaseRequestDao {

	
	@Autowired
	SessionFactory sessionFactory;
	
	public List<PurchaseRequest> selectAll() {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(PurchaseRequest.class).list();
	}

	public PurchaseRequest getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(PurchaseRequest.class, id);
	}

	public void save(PurchaseRequest purchaseRequest) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.clear();
		session.saveOrUpdate(purchaseRequest);
		session.flush();
	}

	public void update(PurchaseRequest purchaseRequest) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.clear();
		session.update(purchaseRequest);
		session.flush();
	}

	public void delete(PurchaseRequest purchaseRequest) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(purchaseRequest);
		session.flush();
	}

}
