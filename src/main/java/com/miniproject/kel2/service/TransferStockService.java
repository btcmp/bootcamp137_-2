package com.miniproject.kel2.service;
 
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.HistoryTransferStockDao;
import com.miniproject.kel2.dao.ItemInventoryDao;
import com.miniproject.kel2.dao.TransferStockDao;
import com.miniproject.kel2.dao.TransferStockDetailDao;
import com.miniproject.kel2.model.Adjustment;
import com.miniproject.kel2.model.DetailAdjustment;
import com.miniproject.kel2.model.HistoryAdjustment;
import com.miniproject.kel2.model.HistoryTransferStock;
import com.miniproject.kel2.model.ItemInventory;
import com.miniproject.kel2.model.ItemVariant;
import com.miniproject.kel2.model.Outlet;
import com.miniproject.kel2.model.TransferStock;
import com.miniproject.kel2.model.TransferStockDetail;

@Service
@Transactional
public class TransferStockService {
	
	@Autowired
	TransferStockDao transferStockDao;
	
	@Autowired 
	ItemInventoryDao itemInventoryDao;
	
	@Autowired
	TransferStockDetailDao tsDetailDao;
	
	@Autowired
	HistoryTransferStockDao htStockDao;
	
	/*public void save(TransferStock transferStock) {
		TransferStock ts = new TransferStock();
		ts.setCreatedOn(new Date());
		ts.setFromOutlet(transferStock.getFromOutlet());
		ts.setToOutlet(transferStock.getToOutlet());
		ts.setNotes(transferStock.getNotes());
		ts.setStatus(transferStock.getStatus());
		transferStockDao.save(ts);
		
		for(HistoryTransferStock hts : transferStock.getHistoryTransferStock()) {
			HistoryTransferStock htStock = new HistoryTransferStock();
			htStock.setTransferStock(ts); 
			htStock.setCreatedOn(new Date());
			htStock.setStatus(hts.getStatus());
			htStockDao.save(htStock);
		}
		
		for(TransferStockDetail tsd : transferStock.getTsDetails()) {
			TransferStockDetail tsDetail = new TransferStockDetail();
			tsDetail.setTransferStock(ts);
			tsDetail.setInStock(tsd.getInStock());
			tsDetail.setCreatedOn(new Date());
			tsDetail.setItemVariant(tsd.getItemVariant());
			tsDetailDao.save(tsDetail);
			
		ItemInventory inv = itemInventoryDao.searchEndingQtyByLastModifiedVariant(tsd.getItemVariant().getId());

		ItemInventory ii = new ItemInventory();
		ii.setItemVariant(tsd.getItemVariant());
		ii.setEndingQty(tsd.getInStock());
		ii.setTransferStockQty(tsd.getTransferQty());
		ii.setModifiedOn(new Date());
		if (inv != null) {
			ii.setAlertAtQty(inv.getAlertAtQty());
			ii.setBeginning(inv.getEndingQty());
		} else {
			ii.setAlertAtQty(5);
			ii.setBeginning(50);
		}
		itemInventoryDao.save(ii);
		}
	}*/
	
	public void save(TransferStock transferStock) {
		TransferStock ts = new TransferStock();
	//	ts.setCreatedOn(new Date());
		ts.setFromOutlet(transferStock.getFromOutlet());
		ts.setToOutlet(transferStock.getToOutlet());
		ts.setNotes(transferStock.getNotes());
		ts.setStatus(transferStock.getStatus());
		transferStockDao.save(ts);
		
		for(TransferStockDetail tsd : transferStock.getTsDetails()) {
			ItemVariant iv = new ItemVariant();
			iv.setId(tsd.getItemVariant().getId());
		
			TransferStockDetail tsDetail = new TransferStockDetail();
			tsDetail.setItemVariant(iv);
		//	tsDetail.setCreatedOn(new Date());
			tsDetail.setInStock(tsd.getInStock());
			tsDetail.setTransferQty(tsd.getTransferQty());
			tsDetail.setTransferStock(ts);
			tsDetailDao.save(tsDetail);
			
			/*ItemInventory inv = itemInventoryDao.searchEndingQtyByLastModifiedVariant(tsd.getItemVariant().getId());

			ItemInventory ii = new ItemInventory();
			ii.setItemVariant(tsd.getItemVariant());
			ii.setEndingQty(tsd.getInStock());
			ii.setTransferStockQty(tsd.getTransferQty());
			ii.setModifiedOn(new Date());
			if (inv != null) {
				ii.setAlertAtQty(inv.getAlertAtQty());
				ii.setBeginning(inv.getEndingQty());
			} else {
				ii.setAlertAtQty(5);
				ii.setBeginning(50);
			}
			itemInventoryDao.save(ii);*/
		}
		
		for(HistoryTransferStock hts : transferStock.getHistoryTransferStock()) {
			HistoryTransferStock htStock = new HistoryTransferStock ();
			htStock.setTransferStock(ts);
			htStock.setCreatedOn(hts.getCreatedOn());
			htStock.setStatus(hts.getStatus());
			htStock.setCreatedBy(hts.getCreatedBy());
			htStockDao.save(htStock);
		}
	}
	
	public List<TransferStock> selectAll(){
		return transferStockDao.selectAll();
	}
	
	/*public TransferStock getOne(long id) {
		return transferStockDao.getOne(id);
	}*/
	
	public TransferStock getOne(long id) {
		TransferStock transferStock = new TransferStock();
		transferStock.setId(id);
		return transferStockDao.getOne(transferStock);
	}
	
	public void update(TransferStock transferStock) {
		transferStockDao.update(transferStock);
	}
	
	/*public void delete(long id) {
		TransferStock tStocks = new TransferStock();
		tStocks.setId(id);
		transferStockDao.delete(tStocks);
	}*/
	
	public void delete(TransferStock transferStock) {
		transferStockDao.delete(transferStock);
	}
	
	public void saveUpdate(TransferStock transferStock) {
		transferStockDao.saveUpdate(transferStock);
	}
	
	public List<Outlet> outSelectAll(){
		return transferStockDao.outSelectAll();
	}
	
	public List<TransferStock> getByOutletId(long search) {
		// TODO Auto-generated method stub
		return transferStockDao.getByOutletId(search);
	}
	
}
