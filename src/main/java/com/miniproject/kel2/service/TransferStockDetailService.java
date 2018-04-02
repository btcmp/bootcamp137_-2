package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.TransferStockDetailDao;
import com.miniproject.kel2.model.TransferStockDetail;


@Service
@Transactional
public class TransferStockDetailService {

	@Autowired
	TransferStockDetailDao tsDetailDao;
	
	public void save(TransferStockDetail tsDetail) {
		tsDetailDao.save(tsDetail);
	}
	
	public List<TransferStockDetail> selectAll(){
		return tsDetailDao.selectAll();
	}
	
	/*public TransferStockDetail getOne(long id) {
		return tsDetailDao.getOne(id);
	}*/
	
	public TransferStockDetail getOne(long id) {
		TransferStockDetail tsDetail = new TransferStockDetail();
		tsDetail.setId(id);
		return tsDetailDao.getOne(tsDetail);
	}
	
	
	public void update(TransferStockDetail tsDetail) {
		tsDetailDao.update(tsDetail);
	}
	
	public void delete(TransferStockDetail tsDetail) {
		tsDetailDao.delete(tsDetail);
	}
	
	public void saveAtauUpdate(TransferStockDetail tsDetail) {
		tsDetailDao.saveAtauUpdate(tsDetail);
	}
	
	public List<TransferStockDetail> getTransferStockById(long search){
		return tsDetailDao.getTransferStockById(search);
	}
	
	public List<TransferStockDetail> searchById(long id){
		List<TransferStockDetail> tsDetail = tsDetailDao.searchById(id);
		if(tsDetail.isEmpty()) {
			return null;
		} else {
			return tsDetail;
		}
	}
	
	
}
