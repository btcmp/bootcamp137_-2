package com.miniproject.kel2.controller;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.miniproject.kel2.model.HistoryTransferStock;
import com.miniproject.kel2.model.ItemInventory;
import com.miniproject.kel2.model.Outlet;
import com.miniproject.kel2.model.TransferStock;
import com.miniproject.kel2.model.TransferStockDetail;
import com.miniproject.kel2.service.HistoryTransferStockService;
import com.miniproject.kel2.service.ItemInventoryService;
import com.miniproject.kel2.service.TransferStockDetailService;
import com.miniproject.kel2.service.TransferStockService;

@Controller
@RequestMapping("/transfer-stock")
public class TransferStockController {

	@Autowired
	TransferStockService transferStockService;
	
	@Autowired
	ItemInventoryService itemInvetoryService;
	
	@Autowired
	TransferStockDetailService tsDetailService;
	
	@Autowired
	HistoryTransferStockService htStockService;
	
	@RequestMapping
	public String index(Model model) {
		List<TransferStock> tStocks = transferStockService.selectAll();
		List<Outlet> outs = transferStockService.outSelectAll();
		List<ItemInventory> inventories = itemInvetoryService.selectAll();
//		List<TransferStockDetail> tsDetails = tsDetailService.selectAll();
		List<HistoryTransferStock> htStocks = htStockService.selectAll();
		model.addAttribute("tStocks", tStocks);
		model.addAttribute("outs", outs);
		model.addAttribute("inventories", inventories);
//		model.addAttribute("tsDetails", tsDetails);
		model.addAttribute("htStocks", htStocks);
		return "transfer-stock";
	}
	
	/*@RequestMapping(value = "/detail")
	public String indexDetail(Model model) {
		List<TransferStock> tStocks = transferStockService.selectAll();
		model.addAttribute("tStocks", tStocks);
		return "detail-transfer-stock";
	}*/
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody TransferStock tStock) {
		transferStockService.save(tStock);
	}
	
	@RequestMapping(value = "/get-one/{id}", method = RequestMethod.GET)
	@ResponseBody
	public TransferStock getOne(@PathVariable long id) {
		TransferStock tStock = transferStockService.getOne(id);
		return tStock;
		//return transferStockService.getOne(id);
	}
	
	@RequestMapping(value = "/update-status/{id}", method = RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void updateStatus(@RequestBody String newStatus, @PathVariable long id) {
		TransferStock tStock = transferStockService.getOne(id);
		tStock.setStatus(newStatus);
		transferStockService.saveUpdate(tStock);
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody TransferStock tStock) {
		transferStockService.update(tStock);
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable long id) {
		TransferStock tStock = new TransferStock();
		tStock.setId(id);
		transferStockService.delete(tStock);
		//transferStockService.delete(id);
	}
	
	@RequestMapping(value="/search-item/{word}", method = RequestMethod.GET)
	@ResponseBody
	public List<Object[]> searchByItem(@PathVariable String word){ 
		List<Object[]> inventories = itemInvetoryService.searchByItemAndVariant(word);
		System.out.println("search : "+inventories.size());
		return inventories;
	}
	
	@RequestMapping(value = "/search-outlet", method = RequestMethod.GET)
	public String indexMainSearch(Model model, @RequestParam(value="search", defaultValue="") long search) {
		List<TransferStock> tStocks = transferStockService.getByOutletId(search);
		List<Outlet> outs = transferStockService.outSelectAll();
		List<ItemInventory> inventories = itemInvetoryService.selectAll();
		model.addAttribute("tStocks", tStocks);
		model.addAttribute("outs", outs);
		model.addAttribute("inventories", inventories);
		return "transfer-stock";
	}
	
	
	@RequestMapping(value = "/get-one-item/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ItemInventory getOneItem(@PathVariable long id) {
		ItemInventory itemInventory = itemInvetoryService.getOne(id);
		return itemInventory;
	}
	
	@RequestMapping(value = "/search-transfer-stock-detail", method = RequestMethod.GET)
	@ResponseBody
	public List<TransferStockDetail> searchTSDById(@RequestParam(value="search", defaultValue="") long search) {
		List<TransferStockDetail> tsDetails = tsDetailService.getTransferStockById(search);
		return tsDetails;
	}
	
	// Detail Transfer Stock
	@RequestMapping(value="/get-detail/{id}", method=RequestMethod.GET)
	public String getDetail(@PathVariable long id, Model model) {
		TransferStock transferStock = transferStockService.getOne(id);
		List<TransferStockDetail> tsDetails = tsDetailService.searchById(id);
		List<HistoryTransferStock> htStocks = htStockService.selectAll();
		System.out.println("detail ts : "+tsDetails.size());
		System.out.println("history ts : "+htStocks.size());
		model.addAttribute("transferStock", transferStock);
		model.addAttribute("tsDetails", tsDetails);
		model.addAttribute("htStocks", htStocks);
		return "detail-transfer-stock";
	}
	
	/*@RequestMapping(value="/detail")
	public String detail() {
		return "detail-transfer-stock";
	}*/
}
