package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.ItemVariant;

public interface ItemVariantDao {

	public void save(ItemVariant itemVariant);
	
	public List<ItemVariant> selectAll();
	
	public ItemVariant getOne(ItemVariant itemVariant);	
	
	public void update(ItemVariant itemVariant);
	
	public void delete(ItemVariant itemVariant);
	
	public void saveAtauUpdate(ItemVariant itemVariant);
	
	
}
