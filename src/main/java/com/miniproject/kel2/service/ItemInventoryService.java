package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.ItemInventoryDao;
import com.miniproject.kel2.model.Item;
import com.miniproject.kel2.model.ItemInventory;
import com.miniproject.kel2.model.Outlet;

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
	public List<Object[]> searchByItemAndVariant(String word, long idOutlet){
		return itemInventoryDao.searchByItemAndVariant(word, idOutlet);
	}

	public List<Object[]> searchItemInventoryByName(String word, long idOutlet) {
		// TODO Auto-generated method stub
		return itemInventoryDao.searchItemInventoryByName(word, idOutlet);
	}

	public List<ItemInventory> searchInventoryByItemName(String search) {
		// TODO Auto-generated method stub
		return itemInventoryDao.searchInventoryByItemName(search);
	}
	
	// untuk di item
	public List<ItemInventory> searchInventoryByItem(Item item){
		return itemInventoryDao.searchInventoryByItem(item);
	}
	
	// untuk search di item
	public List<ItemInventory> searchItemInventoryByItemName(String search) {
		return itemInventoryDao.searchItemInventoryByItemName(search);
	}

	//search item di TS
	public List<Object[]> searchByItemAndVariantTS(String word){
		return itemInventoryDao.searchByItemAndVariantTS(word);
	}

	public List<ItemInventory> getItemInventoryByOutlet(long outId) {
		// TODO Auto-generated method stub
		return itemInventoryDao.getItemInventoryByOutlet(outId);
	}


	
}
