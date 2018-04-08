package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.Item;
import com.miniproject.kel2.model.ItemInventory;

public interface ItemInventoryDao {

	public void save(ItemInventory itemInventory);
	
	public List<ItemInventory> selectAll();
	
	public ItemInventory getOne(ItemInventory itemInventory);	
	
	public void update(ItemInventory itemInventory);
	
	public void delete(ItemInventory itemInventory);
	
	public void saveAtauUpdate(ItemInventory itemInventory);

	public List<Object[]> searchByItemAndVariant(String word);

	public void updateInStock(int inStock, long idVar);

	public ItemInventory searchEndingQtyByLastModifiedVariant(long id);

	public List<Object[]> searchItemInventoryByName(String word);

	public List<ItemInventory> searchInventoryByItemName(String search);
	
	public ItemInventory searchInventoryByVariantAndOutletId(long id, long outletId);

	public List<ItemInventory> searchInventoryByItem(Item item);
	
	//search di item
	public List<ItemInventory> searchItemInventoryByItemName(String search);
}
