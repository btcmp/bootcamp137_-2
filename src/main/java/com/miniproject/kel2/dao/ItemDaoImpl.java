package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.Category;
import com.miniproject.kel2.model.Item;

@Repository
public class ItemDaoImpl implements ItemDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(Item item) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(item);
		session.flush();
	}

	public List<Item> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Item.class).list();
	}
	
	public Item getOne(Item item) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Item.class, item.getId());
	}

	public void update(Item item) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(item);
		session.flush();
	}

	public void delete(Item item) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(item);
		session.flush();
	}

	public void saveAtauUpdate(Item item) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(item);
		session.flush();
	}

	public List<Category> catSelectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Category cat where cat.active=0";
		List<Category> categories = session.createQuery(hql).list();
		if(categories.isEmpty()) {
			return null;
		} else {
			return categories;
		}
	}

	public List<Item> getItemsByCategory(Category category) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Item i where i.category = :category";
		List<Item> items = session.createQuery(hql).setParameter("category", category).list();
		if(items.isEmpty()) {
			return null;
		}
		return items;
	}

}
