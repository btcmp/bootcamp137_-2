package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.ItemDao;
import com.miniproject.kel2.model.Item;

@Service
@Transactional
public class ItemService {
	
	@Autowired
	ItemDao itemDao;
	
	public void save(Item item) {
		itemDao.save(item);
	}
	
	public List<Item> selectAll(){
		return itemDao.selectAll();
	}
	
	public Item getOne(long id) {
		Item item = new Item();
		item.setId(id);
		return itemDao.getOne(item);
	}
	
	public void update(Item item) {
		itemDao.update(item);
	}
	
	public void delete(Item item) {
		itemDao.delete(item);
	}
	
	public void saveAtauUpdate(Item item) {
		itemDao.saveAtauUpdate(item);
	}
}
