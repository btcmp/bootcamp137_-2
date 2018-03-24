package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.Supplier;


@Repository
public class SupplierDaoImpl implements SupplierDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public List<Supplier> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Supplier.class).list();
	}

	public Supplier getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Supplier.class, id);
	}

	public List<Supplier> searchByName(String name) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Supplier s where lower(s.name) like lower(:namenya)";
		List<Supplier> suppliers = session.createQuery(hql).setParameter("namenya", "%"+name+"%").list();
		if(suppliers.isEmpty()) {
			return null;
		}else {
			return suppliers;
		}
	}

	public void update(Supplier supplier) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(supplier);
		session.flush();
	}

	public void delete(Supplier supplier) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(supplier);
		session.flush();
	}

	public void save(Supplier supplier) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(supplier);
		session.flush();
	}

}
