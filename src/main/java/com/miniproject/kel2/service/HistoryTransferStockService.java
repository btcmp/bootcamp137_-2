package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.HistoryTransferStockDao;
import com.miniproject.kel2.model.HistoryTransferStock;
import com.miniproject.kel2.model.TransferStockDetail;

@Service
@Transactional
public class HistoryTransferStockService {

	@Autowired
	HistoryTransferStockDao htStockDao;
	
	public void save(HistoryTransferStock htStock) {
		htStockDao.save(htStock);
	}
	
	public List<HistoryTransferStock> selectAll(){
		return htStockDao.selectAll();
	}
	
	public HistoryTransferStock getOne(long id) {
		return htStockDao.getOne(id);
	}
	
	public void update(HistoryTransferStock htStock) {
		htStockDao.update(htStock);
	}
	
	public void delete(long id) {
		HistoryTransferStock htStocks = new HistoryTransferStock();
		htStocks.setId(id);
		htStockDao.delete(htStocks);
	}
	
	public void saveAtauUpdate(HistoryTransferStock htStock) {
		htStockDao.saveAtauUpdate(htStock);
	}

	public List<HistoryTransferStock> getByTsId(long id) {
		// TODO Auto-generated method stub
		List<HistoryTransferStock> htStock = htStockDao.getByTsId(id);
		if(htStock.isEmpty()) {
			return null;
		} else {
			return htStock;
		}
	}

	

	
}
