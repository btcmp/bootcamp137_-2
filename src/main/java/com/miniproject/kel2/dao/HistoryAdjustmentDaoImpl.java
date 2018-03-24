package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.HistoryAdjustment;

@Repository
public class HistoryAdjustmentDaoImpl implements HistoryAdjustmentDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public List<HistoryAdjustment> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(HistoryAdjustment.class).list();
	}

	public HistoryAdjustment getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(HistoryAdjustment.class, id);
	}

	public void save(HistoryAdjustment hisAdjustment) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(hisAdjustment);
		session.flush();
	}

	public void update(HistoryAdjustment hisAdjustment) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(hisAdjustment);
		session.flush();
	}

	public void delete(HistoryAdjustment hisAdjustment) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(hisAdjustment);
		session.flush();
	}

}
