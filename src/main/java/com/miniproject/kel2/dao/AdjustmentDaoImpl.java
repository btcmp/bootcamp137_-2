package com.miniproject.kel2.dao;


import java.util.Date;
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

	public void updateStatusAdjustment(String status, long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Adjustment a set a.status = :status where a.id = :id";
		session.createQuery(hql).setParameter("status", status).setParameter("id", id).executeUpdate();
		session.flush();
	}

	public List<Adjustment> searchByDateRange(Date tglFrom, Date tglTo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Adjustment a where a.createdOn between :from and :to";
		List<Adjustment> adjustments = session.createQuery(hql).setParameter("from", tglFrom).setParameter("to", tglTo).list();
		if(adjustments.isEmpty()) {
			return null;
		}else {
			return adjustments;
		}
	}

	public List<Adjustment> selectAllByOutlet(long i) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Adjustment a where a.outletId.id = :idOutlet";
		List<Adjustment> adj = session.createQuery(hql).setParameter("idOutlet", i).list();
		if(adj.isEmpty()) {
			return null;
		}else {
			return adj;
		}
		
	}

}
