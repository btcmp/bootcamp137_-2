package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.Category;

@Repository
public class CategoryDaoImpl implements CategoryDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(Category category) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(category);
		session.flush();
	}

	public List<Category> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Category.class).list();
	}
	
	public Category getOne(Category category) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Category.class, category.getId());
	}

	public void update(Category category) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(category);
		session.flush();
	}

	public void delete(Category category) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(category);
		session.flush();
	}

	public void saveAtauUpdate(Category category) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(category);
		session.flush();
	}

	// menampilkan list dengan status active = 0
	public List<Category> getListByStatus() {
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

	//untuk update status di database
	public void updateStatus(Category category) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Category cat set cat.active=1 where cat.id= :id";
		session.createQuery(hql).setParameter("id", category.getId()).executeUpdate();
		session.flush();
	}

	// untuk search
	public List<Category> getCategoryBySearchName(String search) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Category cat where lower(cat.name) like :cn";
		List<Category> cats = session.createQuery(hql).setParameter("cn", "%"+search.toLowerCase()+"%").list();
		if(cats.isEmpty()) {
			return null;
		} else {
			return cats;
		}
	}

	
}
