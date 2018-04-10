package com.miniproject.kel2.service;

import java.util.List;

import org.hibernate.id.uuid.CustomVersionOneStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.CustomerDao;
import com.miniproject.kel2.model.Customer;

@Service
@Transactional
public class CustomerService {

	@Autowired
	CustomerDao customerDao;
	
	public List<Customer> selectAll(){
		return customerDao.selectAll();
	}
	
	public Customer getOne(long id) {
		return customerDao.getOne(id);
	}
	
	public void save(Customer customer) {
		customerDao.save(customer);
	}
	
	public void update(Customer customer) {
		customerDao.update(customer);
	}

	public List<Customer> searchByName(String word) {
		// TODO Auto-generated method stub
		return customerDao.searchByName(word);
	}

	public List<Customer> searchByNameValidation(String name) {
		// TODO Auto-generated method stub
		return customerDao.searchByNameValidation(name);
	}

	public String searchByEmailValidation(String email) {
		// TODO Auto-generated method stub
		return customerDao.searchByEmailValidation(email);
	}
}
