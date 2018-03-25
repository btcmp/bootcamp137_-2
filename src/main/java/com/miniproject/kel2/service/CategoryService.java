package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.CategoryDao;
import com.miniproject.kel2.model.Category;

@Service
@Transactional
public class CategoryService {

	@Autowired
	CategoryDao categoryDao;
	
	public void save(Category category) {
		categoryDao.save(category);
	}
	
	public List<Category> selectAll(){
		return categoryDao.selectAll();
	}
	
	public Category getOne(long id) {
		Category category = new Category();
		category.setId(id);
		return categoryDao.getOne(category);
	}
	
	
	public void update(Category category) {
		categoryDao.update(category);
	}
	
	/*public void delete(Category category) {
		categoryDao.delete(category);
	}*/
	
	// untuk delete data dari table
	public void delete(long id) {
		Category categories = new Category();
		categories.setId(id);
		categoryDao.delete(categories);
	}
	
	public void saveAtauUpdate(Category category) {
		categoryDao.saveAtauUpdate(category);
	}
	
	public List<Category> getListByStatus(){
		return categoryDao.getListByStatus();
	}
	
	// untuk update status di atabase menjadi 1
	public void updateStatus(Category category) {
		categoryDao.updateStatus(category);
	}
	
	// untuk search
	public List<Category> getCategoryBySearchName(String search){
		return categoryDao.getCategoryBySearchName(search);
	}
	
}
