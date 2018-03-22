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
	
	public void delete(Category category) {
		categoryDao.delete(category);
	}
	
	public void saveAtauUpdate(Category category) {
		categoryDao.saveAtauUpdate(category);
	}
	
	/*public List<Category> getListByStatus(){
		return categoryDao.getListByStatus();
	}
	
	public void updateStatus(Category category) {
		categoryDao.updateStatus(category);
	}*/
	
	
	
}
