package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.Category;
import com.miniproject.kel2.model.Item;

public interface ItemDao {

	public void save(Item item);
	
	public List<Item> selectAll();
	
	public Item getOne(Item item);	
	
	public void update(Item item);
	
	public void delete(Item item);
	
	public void saveAtauUpdate(Item item);

	public List<Category> catSelectAll();

	public List<Item> getItemsByCategory(Category category);
	
	
}
