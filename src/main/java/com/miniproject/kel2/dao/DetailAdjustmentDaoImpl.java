package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.DetailAdjustment;

@Repository
public class DetailAdjustmentDaoImpl implements DetailAdjustmentDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public List<DetailAdjustment> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(DetailAdjustment.class).list();
	}

	public DetailAdjustment getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(DetailAdjustment.class, id);
	}

	public void save(DetailAdjustment detAdjustment) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(detAdjustment);
		session.flush();
	}

	public void update(DetailAdjustment detAdjustment) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(detAdjustment);
		session.flush();
	}

	public void delete(DetailAdjustment detAdjustment) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(detAdjustment);
		session.flush();
	}

	public List<DetailAdjustment> searchById(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from DetailAdjustment da where da.adjustmentId.id = :id";
		List<DetailAdjustment> detAdjustments = session.createQuery(hql).setParameter("id", id).list();
		if(detAdjustments.isEmpty()) {
			return null;
		}else {
			return detAdjustments;
		}
		
	}

}
