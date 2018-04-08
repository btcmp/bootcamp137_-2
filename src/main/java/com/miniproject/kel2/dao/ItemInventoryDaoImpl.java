package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.Item;
import com.miniproject.kel2.model.ItemInventory;

@Repository
public class ItemInventoryDaoImpl implements ItemInventoryDao{
	
	@Autowired
	SessionFactory sessionFactory;

	public void save(ItemInventory itemInventory) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(itemInventory);
		session.flush();
	}

	public List<ItemInventory> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(ItemInventory.class).list();
	}

	
	public ItemInventory getOne(ItemInventory itemInventory) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(ItemInventory.class, itemInventory.getId());
	}

	public void update(ItemInventory itemInventory) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(itemInventory);
		session.flush();
	}

	public void delete(ItemInventory itemInventory) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(itemInventory);
		session.flush();
	}

	public void saveAtauUpdate(ItemInventory itemInventory) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(itemInventory);
		session.flush();
	}

	public List<Object[]> searchByItemAndVariant(String word) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "select min(i.endingQty), i.itemVariant.name, i.itemVariant.id, i.itemVariant.item.name from ItemInventory i where lower(i.itemVariant.item.name) like lower(:name) group by i.itemVariant.name, i.itemVariant.id, i.itemVariant.item.name";
		List<Object[]> inventories = session.createQuery(hql).setParameter("name", "%"+word+"%").list();
		if(inventories.isEmpty()) {
			return null;
		}else {
			return inventories;
		}
		
	}

	public void updateInStock(int inStock, long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update ItemInventory i set i.beginning = :inStock where i.itemVariant.id = :idVariant";
		session.createQuery(hql).setParameter("inStock", inStock).setParameter("idVariant", id).executeUpdate();
		session.flush();
	}

	public ItemInventory searchEndingQtyByLastModifiedVariant(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ItemInventory i where i.itemVariant.id = :id and i.modifiedOn is not null order by i.modifiedOn desc";
		List<ItemInventory> inventories = session.createQuery(hql).setParameter("id", id).list();
		ItemInventory inv = inventories.get(0);
		if(inventories.isEmpty()) {
			return null;
		}else {
			return inv;
		}
		
	}

	public List<Object[]> searchItemInventoryByName(String word) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "select i.itemVariant.item.name, i.itemVariant.id, i.itemVariant.name, i.itemVariant.price, min(i.endingQty) "
				+ "from ItemInventory i "
				+ "where lower(i.itemVariant.item.name) like lower(:item) or lower(i.itemVariant.name) like lower(:variant)"
				+ "group by i.itemVariant.item.name, i.itemVariant.id, i.itemVariant.name, i.itemVariant.price";
		List<Object[]> inventories = session.createQuery(hql).setParameter("item", "%"+word+"%").setParameter("variant", "%"+word+"%").list();
		if(inventories.isEmpty()) {
			return null;
		}else {
			return inventories;
		}
		
	}

	public List<ItemInventory> searchInventoryByItemName(String search) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql ="from ItemInventory ii where lower(ii.itemVariant.item.name) like :itemName or "
				+ "lower(ii.itemVariant.name) like :itemName or "
				+ "lower(concat(ii.itemVariant.item.name, '-', ii.itemVariant.name)) like :itemName ";
		List<ItemInventory> iinventories = session.createQuery(hql).setParameter("itemName", "%"+search.toLowerCase()+"%").list();
		if(iinventories.isEmpty()) {
			return null;
		}else {
			return iinventories;
		}
	}

	public ItemInventory searchInventoryByVariantAndOutletId(long variantId, long outletId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ItemInventory inv where inv.itemVariant.id =:variantId and inv.outlet.id =:outletId";
		List <ItemInventory> itemInventory = session.createQuery(hql).setParameter("variantId", variantId).setParameter("outletId", outletId).list();
		if (itemInventory.isEmpty()) {
			System.out.println("Kosong");
			return null;
		} else {
			System.out.println("Ada");
			return itemInventory.get(0);
		}
	}

	public List<ItemInventory> searchInventoryByItem(Item item) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from ItemInventory inv where inv.itemVariant.item = :item";
		List<ItemInventory> inventories = session.createQuery(hql).setParameter("item",  item).list();
		if(inventories.isEmpty()) {
			return null;
		} else {
			return inventories;
		}
	}
	
	// search di item
	public List<ItemInventory> searchItemInventoryByItemName(String search) {
		Session session=sessionFactory.getCurrentSession();
		String hql="from ItemInventory iv where lower(iv.itemVariant.item.name) like :itemName or "
				+ "lower(iv.itemVariant.name) like :itemName or "
				+ "lower(concat(iv.itemVariant.item.name, '-', iv.itemVariant.name)) like :itemName";
		List<ItemInventory> itemInventories = session.createQuery(hql).setParameter("itemName", "%"+search.toLowerCase()+"%").list();
		if(itemInventories.isEmpty()) {
			return null;
		}
		else {
			return itemInventories;
		}
	}
	

}
