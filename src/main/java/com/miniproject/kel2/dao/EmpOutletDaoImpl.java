package com.miniproject.kel2.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.EmpOutlet;

@Repository
public class EmpOutletDaoImpl implements EmpoutDao {

	
	@Autowired
	SessionFactory sessionFactory;
	
	public void save(EmpOutlet eo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(eo);
		session.flush();
	}

}
