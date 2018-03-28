package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.ItemInventoryDao;
import com.miniproject.kel2.model.ItemInventory;

@Service
@Transactional
public class ItemInventoryService {

	@Autowired
	ItemInventoryDao itemInventoryDao;
	
	public void save(ItemInventory itemInventory) {
		itemInventoryDao.save(itemInventory);
	}
	
	public List<ItemInventory> selectAll(){
		return itemInventoryDao.selectAll();
	}
	
	public ItemInventory getOne(long id) {
		ItemInventory itemInventory = new ItemInventory();
		itemInventory.setId(id);
		return itemInventoryDao.getOne(itemInventory);
	}
	
	public void update(ItemInventory itemInventory) {
		itemInventoryDao.update(itemInventory);
	}
	
	public void delete(ItemInventory itemInventory) {
		itemInventoryDao.delete(itemInventory);
	}
	
	public void saveAtauUpdate(ItemInventory itemInventory) {
		itemInventoryDao.saveAtauUpdate(itemInventory);
	}
	
	//search item inventory by item-variant
	public List<Object[]> searchByItemAndVariant(String word){
		return itemInventoryDao.searchByItemAndVariant(word);
	}

	
}
