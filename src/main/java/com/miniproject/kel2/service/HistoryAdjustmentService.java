package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.HistoryAdjustmentDao;
import com.miniproject.kel2.model.HistoryAdjustment;

@Service
@Transactional
public class HistoryAdjustmentService {

	@Autowired
	HistoryAdjustmentDao hisAdjustmentDao;
	
	public List<HistoryAdjustment> selectAll(){
		return hisAdjustmentDao.selectAll();
	}
	
	public HistoryAdjustment getOne(long id) {
		return hisAdjustmentDao.getOne(id);
	}
	
	public void save(HistoryAdjustment hisAdjustment) {
		hisAdjustmentDao.save(hisAdjustment);
	}
	
	public void update(HistoryAdjustment hisAdjustment) {
		hisAdjustmentDao.update(hisAdjustment);
	}
	
	public void delete(HistoryAdjustment hisAdjustment) {
		hisAdjustmentDao.delete(hisAdjustment);
	}

	public List<HistoryAdjustment> searchById(long id) {
		// TODO Auto-generated method stub
		return hisAdjustmentDao.searchById(id);
	}
}
