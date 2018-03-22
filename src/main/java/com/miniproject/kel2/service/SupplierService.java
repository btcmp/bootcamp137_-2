package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.SupplierDao;
import com.miniproject.kel2.model.Supplier;

@Service
@Transactional
public class SupplierService {
	
	@Autowired
	SupplierDao supplierDao;
	
	public List<Supplier> selectAll(){
		return supplierDao.selectAll();
	}
	
	public void save(Supplier supplier) {
		supplierDao.save(supplier);
	}
	
	public void update(Supplier supplier) {
		supplierDao.update(supplier);
	}
	
	public void delete(Supplier supplier) {
		supplierDao.delete(supplier);
	}
	
	public Supplier getOne(long id) {
		return supplierDao.getOne(id);
	}
	
	public List<Supplier> searchByName(String name){
		return supplierDao.searchByName(name);
	}
}
