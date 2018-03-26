package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.Outlet;

@Repository
public class OutletDaoImpl implements OutletDao{
	
	@Autowired
	SessionFactory sessionFactory;

	public void save(Outlet outlet) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(outlet);
		session.flush();
	}

	public List<Outlet> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Outlet.class).list();
	}

	public Outlet getOne(Outlet outlet) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Outlet.class, outlet.getId());
	}

	public void delete(Outlet outlet) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(outlet);
	}

	public void update(Outlet outlet) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(outlet);
		session.flush();
	}

	public void saveAtauUpdate(Outlet outlet) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(outlet);
		session.flush();
	}

	public Outlet getOneId(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Outlet.class, id);
	}

	public List<Outlet> searchByName(String search) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Outlet o where lower(o.search) like lower(nameOutlet)";
		List<Outlet> outlets = session.createQuery(hql).setParameter("nameOutlet", "%"+search+"%").list();
		if(outlets.isEmpty()) {
			return null;
		} else {
			return outlets;
		}
	}

}
