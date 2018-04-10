package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.Customer;

public interface CustomerDao {

	public List<Customer> selectAll();
	
	public Customer getOne(long id);
	
	public void save(Customer customer);
	
	public void update(Customer customer);

	public List<Customer> searchByName(String word);

	public List<Customer> searchByNameValidation(String name);

	public String searchByEmailValidation(String email);
	
}
