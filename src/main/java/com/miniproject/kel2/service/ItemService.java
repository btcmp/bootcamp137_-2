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
		for(ItemVariant itemVariant : itemVariants) {
			List <ItemInventory> itemInventories = itemVariant.getItemInventories();
			itemVariant.setItemInventories(null);
			itemVariant.setItem(item);
			itemVariantDao.save(itemVariant);
		
			// object itemInventory
			for(ItemInventory itemInventory : itemInventories) {
				itemInventory.setItemVariant(itemVariant);
				itemInventoryDao.save(itemInventory);
			}
		}
		
		
		/*Item itm = new Item();
		itm.setName(item.getName());
		itm.setCategory(item.getCategory());
		itemDao.save(itm);
		
		// Object Item Variant
		for (ItemVariant variant : item.getItemVariants()) {
			ItemVariant iVar = new ItemVariant ();
			iVar.setName(variant.getName());
			iVar.setPrice(variant.getPrice());
			iVar.setSku(variant.getSku());
			iVar.setItem(itm);
			itemVariantDao.save(iVar);
		}
		
		// Object Item Inventory
		for (ItemInventory inventory : variant.get)*/
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

	public List<Category> catSelectAll() {
		// TODO Auto-generated method stub
		return itemDao.catSelectAll();
	}

}
