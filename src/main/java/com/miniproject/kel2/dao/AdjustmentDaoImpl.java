package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.Adjustment;

@Repository
public class AdjustmentDaoImpl implements AdjustmentDao{
	
	@Autowired
	SessionFactory sessionFactory;

	public List<Adjustment> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Adjustment.class).list();
	}

	public Adjustment getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Adjustment.class, id);
	}

	public void save(Adjustment adjustment) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(adjustment);
		session.flush();
	}

	public void update(Adjustment adjustment) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(adjustment);
		session.flush();
	}

	public void delete(Adjustment adjusment) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(adjusment);
		session.flush();
	}

}
