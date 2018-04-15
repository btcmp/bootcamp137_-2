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
		ts.setCreatedBy(transferStock.getCreatedBy());
		ts.setModifiedBy(transferStock.getModifiedBy());
		transferStockDao.save(ts);
		
		for(TransferStockDetail tsd : transferStock.getTsDetails()) {
			ItemVariant iv = new ItemVariant();
			iv.setId(tsd.getItemVariant().getId());
		
			TransferStockDetail tsDetail = new TransferStockDetail();
			tsDetail.setItemVariant(iv);
		//	tsDetail.setCreatedOn(new Date());
			tsDetail.setInStock(tsd.getInStock());
			tsDetail.setTransferQty(tsd.getTransferQty());
			tsDetail.setCreatedBy(tsd.getCreatedBy());
			tsDetail.setModifiedBy(tsd.getModifiedBy());
			tsDetail.setTransferStock(ts);
			tsDetailDao.save(tsDetail);
			
		/*	ItemInventory inv = itemInventoryDao.searchEndingQtyByLastModifiedVariant(tsd.getItemVariant().getId());

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
	
	// untuk list outlet
	public List<Outlet> outSelectAll(){
		return transferStockDao.outSelectAll();
	}
	
	// untuk search
	public List<TransferStock> getByOutletId(long search) {
		// TODO Auto-generated method stub
		return transferStockDao.getByOutletId(search);
	}
	
	// untuk update status
	public void updateStatus(long id) {
		HistoryTransferStock hts = htStockDao.searchByIdTransferStock(id);
		String status = hts.getStatus();
		transferStockDao.updateStatus(status, id);
	}

	public void saveUpdateStatusAndStock(TransferStock transferStock) {
		// TODO Auto-generated method stub
		transferStockDao.saveUpdate(transferStock);
		long idToOutlet = transferStock.getToOutlet().getId();
		long idFromOutlet = transferStock.getFromOutlet().getId();
		List<TransferStockDetail> tsd = tsDetailDao.getTransferStockById(transferStock.getId());
		for (TransferStockDetail tsDetail : tsd) {
			long variantId = tsDetail.getItemVariant().getId();
			System.out.println(variantId+" "+idFromOutlet);
			ItemInventory invent = itemInventoryDao.searchInventoryByVariantAndOutletId(variantId, idFromOutlet);
			System.out.println("invent : "+invent);
			System.out.println("get ending qty : "+invent.getEndingQty());
			System.out.println("get trans qty : "+tsDetail.getTransferQty());
			invent.setEndingQty(invent.getEndingQty() - tsDetail.getTransferQty());
			invent.setTransferStockQty(invent.getTransferStockQty() + tsDetail.getTransferQty());
			invent.setModifiedOn(new Date());
			
			ItemInventory iv = itemInventoryDao.searchInventoryByVariantAndOutletId(variantId, idToOutlet);
			if (iv != null) {
				iv.setEndingQty(iv.getEndingQty() + tsDetail.getTransferQty());
				iv.setAdjustmentQty(iv.getAdjustmentQty() + tsDetail.getTransferQty());
				iv.setModifiedOn(new Date());
			} else {
				ItemInventory ivNew = new ItemInventory();
				ivNew.setAdjustmentQty(0);
				ivNew.setAlertAtQty(5);
				ivNew.setBeginning(tsDetail.getTransferQty());
				ivNew.setEndingQty(tsDetail.getTransferQty());
				ivNew.setItemVariant(tsDetail.getItemVariant());
				ivNew.setOutlet(transferStock.getToOutlet());
				ivNew.setCreatedBy(0);
				ivNew.setModifiedBy(0);
				ivNew.setPurchaseQty(0);
				ivNew.setSalesOrderQty(0);
				ivNew.setTransferStockQty(0);
				itemInventoryDao.save(ivNew);
			}
			/*for(HistoryTransferStock hts : transferStock.getHistoryTransferStock()) {
				HistoryTransferStock htStock = new HistoryTransferStock ();
				htStock.setTransferStock(transferStock);
				htStock.setCreatedOn(hts.getCreatedOn());
				htStock.setStatus(hts.getStatus());
				htStock.setCreatedBy(hts.getCreatedBy());
				htStockDao.save(htStock);
			}*/
		}
	}
	
}
