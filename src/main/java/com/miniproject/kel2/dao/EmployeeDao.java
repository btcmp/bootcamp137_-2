package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.Employee;
import com.miniproject.kel2.model.User;

public interface EmployeeDao {

	//getOne
	public Employee getOne(Employee emp);
	//getAll
	public List<Employee> getAll();
		//save
	public void save(Employee emp);
		//update
	public void update(Employee emp);
		//delete
	public void delete(Employee emp);
}