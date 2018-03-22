package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.EmployeeDao;
import com.miniproject.kel2.dao.UserDao;
import com.miniproject.kel2.model.Employee;
import com.miniproject.kel2.model.User;

@Service
@Transactional
public class EmpUserService {

	@Autowired
	EmployeeDao empDao;
	
	@Autowired
	UserDao userDao;
	
	public void empSave(Employee emp) {
		empDao.save(emp);
	}
	
	public void empUpdate(Employee emp) {
		empDao.update(emp);
	}
	
	public void empDelete(Employee emp) {
		empDao.delete(emp);
	}
	
	public Employee empGetOne(long id) {
		Employee emp = new Employee();
		emp.setId(id);
		return empDao.getOne(emp);
	}
	
	public List<Employee> empGetAll(){
		return empDao.getAll();
	}
	
	public void userSave(User user ) {
		userDao.save(user);
	}
	
	public void userUpdate(User user) {
		userDao.update(user);
	}
	
	public void userDelete(User user) {
		userDao.delete(user);
	}
	
	public User userGetOne(long id) {
		User user = new User();
		user.setId(id);
		return userDao.getOne(user);
	}
	
	public List<User> userGetAll(){
		return userDao.getAll();
	}
}
