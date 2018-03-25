package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.EmptySqlParameterSource;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.Employee;

@Repository
public class EmployeeDaoImpl implements EmployeeDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public Employee getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Employee.class, id);
	}

	public List<Employee> getAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Employee.class).list();
	}

	public void save(Employee emp) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(emp);
		session.flush();
	}

	public void update(Employee emp) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(emp);
		session.flush();
	}

	public void delete(Employee emp) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(emp);
		session.flush();
	}

	public Employee getOne(Employee emp) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Employee.class, emp.getId());
	}

	public List<Employee> showActive(Employee emp) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Employee emp where emp.active = 1";
		List<Employee> empl = session.createQuery(hql).list();
		
		if(empl.isEmpty())
			return null;
		else
		return empl;
	}

}
