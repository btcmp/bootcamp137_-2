package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.ItemDao;
import com.miniproject.kel2.dao.ItemInventoryDao;
import com.miniproject.kel2.dao.ItemVariantDao;
import com.miniproject.kel2.model.Category;
import com.miniproject.kel2.model.Item;
import com.miniproject.kel2.model.ItemInventory;
import com.miniproject.kel2.model.ItemVariant;

@Service
@Transactional
public class ItemService {
	
	@Autowired
	ItemDao itemDao;
	
	@Autowired
	ItemVariantDao itemVariantDao;
	
	@Autowired
	ItemInventoryDao itemInventoryDao;
	
	public void save(Item item) {
		List <ItemVariant> itemVariants = item.getItemVariants();
		item.setItemVariants(null);
		itemDao.save(item);
		
		// object itemVariant
		ItemInventory inventory;
		for(ItemVariant variant : itemVariants) {
			inventory = variant.getItemInventories().get(0);
			variant.setItemInventories(null);
			variant.setItem(item);
			itemVariantDao.save(variant);
		
			inventory.setItemVariant(variant);
			inventory.setEndingQty(inventory.getBeginning());
			itemInventoryDao.save(inventory);
			}
		}
		
		/*Item itm = new Item();
		itm.setName(item.getName());
		itm.setCategory(item.getCategory());
		itemDao.save(itm);
		
		// Object Item Variant
		for (ItemVariant variant : item.getItemVariants()) {
			ItemVariant var = new ItemVariant ();
			var.setName(variant.getName());
			var.setPrice(variant.getPrice());
			var.setSku(variant.getSku());
			var.setItem(itm);
			itemVariantDao.save(var);
		
		
		// Object Item Inventory
		for (ItemInventory inventory : variant.getItemInventories) {
			ItemInventory invent = new ItemInventory();
			invent.setBeginning(inventory.getBeginning());
			invent.setAlertAtQty(inventory.getAlertAtQty());
			invent.setItemVariant(var);
			itemInventoryDao.save(itemInventory);
		}
		}*/

	
	public List<Item> selectAll(){
		return itemDao.selectAll();
	}
	
	public Item getOne(long id) {
		Item item = new Item();
		item.setId(id);
		return itemDao.getOne(item);
	}
	
	public void update(Item item) {
		List<ItemVariant> itemVariants = item.getItemVariants();
			item.setItemVariants(null);
			itemDao.update(item);
			
			ItemInventory inventory;
			for(ItemVariant variant : itemVariants) {
				inventory = variant.getItemInventories().get(0);
				variant.setItemInventories(null);
				variant.setItem(item);
				if(variant.getId()==0) {
					itemVariantDao.save(variant);
					inventory.setItemVariant(variant);
					inventory.setEndingQty(inventory.getBeginning());
					itemInventoryDao.save(inventory);
				} 
				else {
					itemVariantDao.update(variant);
					inventory.setItemVariant(variant);
					inventory.setEndingQty(inventory.getBeginning());
					itemInventoryDao.update(inventory);
				
				}
			}
			
	}
	
	public void delete(Item item) {
		itemDao.delete(item);
	}
	
	public void saveAtauUpdate(Item item) {
		itemDao.saveAtauUpdate(item);
	}

	public List<Category> catSelectAll() {
		// TODO Auto-generated method stub
		return itemDao.catSelectAll();
	}

}
