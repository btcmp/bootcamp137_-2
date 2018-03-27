package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.DetailAdjustmentDao;
import com.miniproject.kel2.model.DetailAdjustment;

@Service
@Transactional
public class DetailAdjustmentService {

	@Autowired
	DetailAdjustmentDao detAdjustmentDao;
	
	public List<DetailAdjustment> selectAll(){
		return detAdjustmentDao.selectAll();
	}
	
	public DetailAdjustment getOne(long id) {
		return detAdjustmentDao.getOne(id);                                   
	}
	
	public void save(DetailAdjustment detAdjustment) {
		detAdjustmentDao.save(detAdjustment);
	}
	
	public void update(DetailAdjustment detAdjustment) {
		detAdjustmentDao.update(detAdjustment);
	}
	
	public void delete(DetailAdjustment detAdjustment) {
		detAdjustmentDao.delete(detAdjustment);
	}

	public List<DetailAdjustment> searchById(long id) {
		// TODO Auto-generated method stub
		List<DetailAdjustment> detAdjustment = detAdjustmentDao.searchById(id);
		if(detAdjustment.isEmpty() ) {
			return null;
		}else {
			return detAdjustment;
		}
		
	}
}

