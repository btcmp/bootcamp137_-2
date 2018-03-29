package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.RequestDetail;

@Repository
public class RequestPurchaseDetailDaoImpl implements RequestPurchaseDetailDao{

	@Autowired
	SessionFactory sessionFactory;
	
	
	public List<RequestDetail> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(RequestDetail.class).list();
	}

	public RequestDetail getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(RequestDetail.class, id);
	}

	public void save(RequestDetail requestDetail) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(requestDetail);
		session.flush();
	}

	public void update(RequestDetail requestDetail) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(requestDetail);
		session.flush();
	}

	public void delete(RequestDetail requestDetail) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(requestDetail);
		session.flush();
	}

	
}
