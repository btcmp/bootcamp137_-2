package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.Customer;
import com.miniproject.kel2.model.Supplier;

@Repository
public class CustomerDaoImpl implements CustomerDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public List<Customer> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Customer.class).list();
	}

	public Customer getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Customer.class, id);
	}

	public void save(Customer customer) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(customer);
		session.flush();
	}

	public void update(Customer customer) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(customer);
		session.flush();
	}

	public List<Customer> searchByName(String word) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Customer c where lower(c.name) like lower(:cust)";
		List<Customer> cust = session.createQuery(hql).setParameter("cust", "%"+word+"%").list();
		if(cust.isEmpty()) {
			return null;
		}else {
			return cust;
		}
	}

	public List<Customer> searchByNameValidation(String name) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Customer c where lower(c.name) like lower(:namanya)";
		List<Customer> custs = session.createQuery(hql).setParameter("namanya", name).list();
		if(custs == null) {
			Customer s = new Customer();
			custs.set(0, s);
			return custs;
		}else {
			return custs;
		}
	}

	public String searchByEmailValidation(String email) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "select c.email from Customer c where lower(c.email) like lower(:emailnya)";
		List<Object[]> custs = session.createQuery(hql).setParameter("emailnya", email).list();
		if(custs.isEmpty()) {
			String none = "";
			return none;
		}else {
			String ada = "ada";
			return ada;
		}
	}

}
