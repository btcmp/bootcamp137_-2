package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.District;

@Repository
public class DistrictDaoImpl implements DistrictDao{

	@Autowired
	SessionFactory sessionFactory;

	public List<District> selectByRegion(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from District d where d.regionId.id = :idReg";
		List<District> districts = session.createQuery(hql).setParameter("idReg", id).list();
		if(districts.isEmpty()) {
			return null;
		}else {
			return districts;
		}
		
	}

	public List<District> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(District.class).list();
	}
	
	
}
