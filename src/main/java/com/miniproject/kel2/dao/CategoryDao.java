package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.Category;

public interface CategoryDao {

	// create
	public void save(Category category);

	// read
	// jamak
	public List<Category> selectAll();

	// single
	public Category getOne(Category category);

	// update
	public void update(Category category);

	// delete
	public void delete(Category category);

	// save or update
	public void saveAtauUpdate(Category category);
	
	// getListByStatus (active = 0)
	public List<Category> getListByStatus();

	// update status di database
	public void updateStatus(Category category);
	
	// search by category name
	public List<Category> getCategoryBySearchName(String search);

	// search untuk validasi
	//public List<Category> searchByNameValidation(String search);
	
	
}
