package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.Role;
import com.miniproject.kel2.model.User;

@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public User getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		
		return session.get(User.class, id);
	}

	public List<User> getAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(User.class).list();
	}

	public void save(User user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(user);
		session.flush();
	}

	public void update(User user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(user);
		session.flush();
	}

	public void delete(User user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(user);
		session.flush();
	}

	public User getOne(User user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(User.class, user.getId());
	}

	public List<Role> getRoleAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Role.class).list();
	}

}
