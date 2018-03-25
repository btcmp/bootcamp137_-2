package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.Item;
import com.miniproject.kel2.model.ItemVariant;

@Repository
public class ItemVariantDaoImpl implements ItemVariantDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(ItemVariant itemVariant) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(itemVariant);
		session.flush();
	}

	public List<ItemVariant> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(ItemVariant.class).list();
	}

	public ItemVariant getOne(ItemVariant itemVariant) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(ItemVariant.class, itemVariant.getId());
	}

	public void update(ItemVariant itemVariant) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(itemVariant);
		session.flush();
	}

	public void delete(ItemVariant itemVariant) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(itemVariant);
		session.flush();
	}

	public void saveAtauUpdate(ItemVariant itemVariant) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(itemVariant);
		session.flush();
	}

}
