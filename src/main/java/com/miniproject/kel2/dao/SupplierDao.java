package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.Supplier;


public interface SupplierDao {

	public List<Supplier> selectAll();
	
	public Supplier getOne(long id);
	
	public List<Supplier> searchByName(String name);
	
	public void update(Supplier supplier);
	
	public void delete(Supplier supplier);
	
	public void save(Supplier supplier);

	public List<Supplier> searchByNameValidation(String nama);

	public String searchByEmailValidation(String email);

	public List<Supplier> searchByNameValidationEdit(String name, long id);

	public String searchByEmailValidationEdit(String email, long id);
	
}
