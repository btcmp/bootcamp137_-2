package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.ItemDao;
import com.miniproject.kel2.dao.ItemInventoryDao;
import com.miniproject.kel2.dao.ItemVariantDao;
import com.miniproject.kel2.dao.OutletDao;
import com.miniproject.kel2.model.Category;
import com.miniproject.kel2.model.Item;
import com.miniproject.kel2.model.ItemInventory;
import com.miniproject.kel2.model.ItemVariant;
import com.miniproject.kel2.model.Outlet;

@Service
@Transactional
public class ItemService {

	@Autowired
	ItemDao itemDao;

	@Autowired
	ItemVariantDao itemVariantDao;

	@Autowired
	ItemInventoryDao itemInventoryDao;

	@Autowired
	OutletDao outletDao;

	public void save(Item item) {
		List<ItemVariant> itemVariants = item.getItemVariants();
		List<Outlet> outlets = outletDao.selectAll();
		item.setItemVariants(null);
		itemDao.save(item);

		// object itemVariant
		ItemInventory inventory;
		for (ItemVariant variant : itemVariants) {
			inventory = variant.getItemInventories().get(0);
			variant.setItemInventories(null);
			variant.setItem(item);
			itemVariantDao.save(variant);

			for (Outlet out : outlets) {
				ItemInventory invent = new ItemInventory();
				invent.setOutlet(out);
				invent.setItemVariant(variant);
				invent.setBeginning(inventory.getBeginning());
				invent.setEndingQty(inventory.getBeginning());
				invent.setAlertAtQty(inventory.getAlertAtQty());
				itemInventoryDao.save(invent);
			}
		}
	}

	/*
	 * Item itm = new Item(); itm.setName(item.getName());
	 * itm.setCategory(item.getCategory()); itemDao.save(itm);
	 * 
	 * // Object Item Variant for (ItemVariant variant : item.getItemVariants()) {
	 * ItemVariant var = new ItemVariant (); var.setName(variant.getName());
	 * var.setPrice(variant.getPrice()); var.setSku(variant.getSku());
	 * var.setItem(itm); itemVariantDao.save(var);
	 * 
	 * 
	 * // Object Item Inventory for (ItemInventory inventory :
	 * variant.getItemInventories) { ItemInventory invent = new ItemInventory();
	 * invent.setBeginning(inventory.getBeginning());
	 * invent.setAlertAtQty(inventory.getAlertAtQty()); invent.setItemVariant(var);
	 * itemInventoryDao.save(itemInventory); } }
	 */

	public List<Item> selectAll() {
		return itemDao.selectAll();
	}

	public Item getOne(long id) {
		Item item = new Item();
		item.setId(id);
		return itemDao.getOne(item);
	}

	public void update(Item item) {
		List<ItemVariant> itemVariants = item.getItemVariants();
		List<Outlet> outlets = outletDao.selectAll();

		item.setItemVariants(null);
		itemDao.saveAtauUpdate(item);

		ItemInventory inventory;
		System.out.println(itemVariants.size());
		for (ItemVariant variant : itemVariants) {
			inventory = variant.getItemInventories().get(0);
			variant.setItemInventories(null);
			variant.setItem(item);

			if (variant.getId() == 0) {
				itemVariantDao.save(variant);
				System.out.println(inventory.getId() == 0);
				if (inventory.getId() == 0) {
					for (Outlet out : outlets) {
						System.out.println(out.getName());
						ItemInventory invent = new ItemInventory();
						invent.setItemVariant(variant);
						invent.setAlertAtQty(inventory.getAlertAtQty());
						invent.setEndingQty(inventory.getEndingQty());
						invent.setBeginning(inventory.getBeginning());
						invent.setOutlet(out);
						itemInventoryDao.save(invent);
					}
				}
				
			} else {
				itemVariantDao.update(variant);
				System.out.println("update variant done");
				
				for(Outlet out : outlets) {
					System.out.println(out.getName());
					ItemInventory invent = new ItemInventory();
					invent.setAlertAtQty(inventory.getAlertAtQty());
					invent.setItemVariant(variant);
					
					invent.setBeginning(inventory.getBeginning());
					invent.setOutlet(out);
					if(invent.getId() == 0) {
						invent.setEndingQty(inventory.getBeginning());
						itemInventoryDao.save(invent);
					} else {
						itemInventoryDao.save(invent);
					}
				}
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

	/*public List<Item> searchByName(String search) {
		// TODO Auto-generated method stub
		return itemDao.searchByName(search);
	}*/

}
