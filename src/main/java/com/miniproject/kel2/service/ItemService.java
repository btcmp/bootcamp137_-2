package com.miniproject.kel2.service;

import java.util.List;

import javax.servlet.http.HttpSession;

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

	@Autowired
	HttpSession httpSession;

	public void save(Item item) {
		Outlet outlet = (Outlet) httpSession.getAttribute("outlet");
		List<ItemVariant> itemVariants = item.getItemVariants();
		List<Outlet> outlets = outletDao.selectAll();
		item.setItemVariants(null);
		item.setCreatedBy(outlet.getId());
		itemDao.save(item);

		// object itemVariant
		ItemInventory inventory;
		for (ItemVariant variant : itemVariants) {
			inventory = variant.getItemInventories().get(0);
			variant.setItemInventories(null);
			variant.setItem(item);
			variant.setCreatedBy(outlet.getId());
			itemVariantDao.save(variant);

			for (Outlet out : outlets) {
				ItemInventory invent = new ItemInventory();
				invent.setOutlet(out);
				invent.setItemVariant(variant);
				invent.setBeginning(inventory.getBeginning());
				invent.setEndingQty(inventory.getBeginning());
				invent.setAlertAtQty(inventory.getAlertAtQty());
				invent.setCreatedBy(outlet.getId());
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
		Outlet outlet = (Outlet) httpSession.getAttribute("outlet");
		List<ItemVariant> itemVariants = item.getItemVariants();
		List<Outlet> outlets = outletDao.selectAll();
		ItemInventory invent;
	//	System.out.println(outlets.size());
		item.setItemVariants(null);
		itemDao.update(item);

		ItemInventory inventory;
	//	System.out.println(itemVariants.size());
		for (ItemVariant variant : itemVariants) {

			List <ItemInventory> inv = itemInventoryDao.getItemInventoryByVariant(variant.getId());
			inventory = variant.getItemInventories().get(0);
			variant.setItemInventories(null);
			variant.setItem(item);

			if (variant.getId() == 0) {
				itemVariantDao.save(variant);
		//		System.out.println(inventory.getId() == 0);
				if (inventory.getId() == 0) {
					for (Outlet out : outlets) {
						System.out.println(out.getName());
						inventory.setItemVariant(variant);
						inventory.setOutlet(out);
						itemInventoryDao.save(inventory);
					}
				}

			} else {
				itemVariantDao.update(variant);
		//		System.out.println("update variant done");
				
				if (inventory.getId() == 0) {
					for (Outlet out : outlets) {
						invent = new ItemInventory();
					//	System.out.println(out.getName());
						invent.setAlertAtQty(inventory.getAlertAtQty());
						invent.setBeginning(inventory.getBeginning());
						invent.setEndingQty(inventory.getBeginning());
						invent.setCreatedBy(outlet.getId());
						invent.setItemVariant(variant);
						invent.setOutlet(out);
						itemInventoryDao.save(invent);
						
						/*System.out.println(out.getName());
						inventory.setAlertAtQty(inventory.getAlertAtQty());
						inventory.setBeginning(inventory.getBeginning());
						inventory.setEndingQty(inventory.getBeginning());
						inventory.setCreatedBy(outlet.getId());
						inventory.setItemVariant(variant);
						inventory.setOutlet(out);
						itemInventoryDao.save(inventory);*/
					}
					
				} else {
					for (Outlet out : outlets) {
					//	ItemInventory invent = new ItemInventory();
					//	System.out.println("up");
						inventory.setItemVariant(variant);
						inventory.setEndingQty(inventory.getBeginning());
						inventory.setCreatedBy(outlet.getId());
						inventory.setOutlet(out);
						itemInventoryDao.update(inventory);
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

	public List<Outlet> getItemsByOutlet() {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateStatus(long idItem) {
		// TODO Auto-generated method stub
		itemDao.updateStatus(idItem);
	}

	public void updateStatusVar(long idVar) {
		// TODO Auto-generated method stub
		itemDao.updateStatuVar(idVar);
	}

	/*
	 * public List<Item> searchByName(String search) { // TODO Auto-generated method
	 * stub return itemDao.searchByName(search); }
	 */
}
