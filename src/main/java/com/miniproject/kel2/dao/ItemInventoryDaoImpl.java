package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
