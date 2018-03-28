package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.ItemVariantDao;
import com.miniproject.kel2.model.ItemVariant;

@Service
@Transactional
public class ItemVariantService {

	@Autowired
	ItemVariantDao itemVariantDao;
	
	public void save(ItemVariant itemVariant) {
		itemVariantDao.save(itemVariant);
	}
	
	public List<ItemVariant> selectAll(){
		return itemVariantDao.selectAll();
	}
	
	public ItemVariant getOne(long id) {
		ItemVariant itemVariant = new ItemVariant();
		itemVariant.setId(id);
		return itemVariantDao.getOne(itemVariant);
	}
	
	public void update(ItemVariant itemVariant) {
		itemVariantDao.update(itemVariant);
	}
	
	public void delete(ItemVariant itemVariant) {
		itemVariantDao.delete(itemVariant);
	}
	
	public void saveAtauUpdate(ItemVariant itemVariant) {
		itemVariantDao.saveAtauUpdate(itemVariant);
	}
	
}
