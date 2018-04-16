package com.miniproject.kel2.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;

import com.miniproject.kel2.model.Category;
import com.miniproject.kel2.model.Item;
import com.miniproject.kel2.model.ItemInventory;
import com.miniproject.kel2.model.ItemVariant;
import com.miniproject.kel2.model.Outlet;
import com.miniproject.kel2.service.ItemInventoryService;
import com.miniproject.kel2.service.ItemService;
import com.miniproject.kel2.service.ItemVariantService;

@Controller
@RequestMapping("/item")
public class ItemController {

	@Autowired
	ItemService itemService;
	
	@Autowired
	ItemVariantService itemVariantService;
	
	@Autowired
	ItemInventoryService itemInventoryService;
	
	@Autowired 
	ServletContext servletContext;
	
	@Autowired
	HttpSession httpSession;
	
	@RequestMapping
	public String index (Model model) {
		Outlet outlet = (Outlet) httpSession.getAttribute("outlet");
		long outId = outlet.getId();
		List<Item> items = itemService.selectAll();
		List<Category> cats = itemService.catSelectAll();
		List<ItemVariant> variants = itemVariantService.selectAll();
	//	List<ItemInventory> inventories = itemInventoryService.selectAll();
		List<ItemInventory> inventories = itemInventoryService.getItemInventoryByOutlet(outId);
		model.addAttribute("items", items);
		model.addAttribute("cats", cats);
		model.addAttribute("variants", variants);
		model.addAttribute("inventories", inventories);
		model.addAttribute("outlet", outlet);
		return "item";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	//@ResponseStatus(HttpStatus.CREATED)
	@ResponseBody
	public Item save(@RequestBody Item item) {
		itemService.save(item);
		return item;
	}

	/*@RequestMapping(value = "/get-one/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Item getOne(@PathVariable long id) {
		return itemService.getOne(id);
	}*/
	
	@RequestMapping(value="/get-one/{id}")
	@ResponseBody
	public List<ItemInventory> getOne (@PathVariable Long id,Model model) {
		Item item = itemService.getOne(id);
		List<ItemInventory> inventories = itemInventoryService.searchInventoryByItem(item);
		model.addAttribute("item", item);
		model.addAttribute("inventories", inventories);
		return inventories;
	}

	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Item item) {
		itemService.update(item);
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable long id) {
		Item item = new Item();
		item.setId(id);
		itemService.delete(item);
	}
	
	@RequestMapping(value = "/delete-inventory/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void deleteInventory(@PathVariable long id) {
		ItemInventory itemInventory = new ItemInventory();
		itemInventory.setId(id);
		itemInventoryService.delete(itemInventory);
	}
	
	/*@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String indexBySearch(@RequestParam(value="search", defaultValue="") String search, Model model){
		List<Item> items = itemService.searchByName(search);
		List<ItemVariant> variants = itemVariantService.searchByName(search);
		model.addAttribute("items", items);
		model.addAttribute("variants", variants);
		System.out.println("search item : " + items.size());
		System.out.println("search variant : " + variants.size());
		return "item";
	}*/
	
	@RequestMapping(value="/search",method=RequestMethod.GET)
	@ResponseBody
	public List<ItemInventory> searchItem(@RequestParam(value="search", defaultValue="") String search){
		List<ItemInventory> itemInventories = itemInventoryService.searchItemInventoryByItemName(search);
		List<ItemInventory> invent = new ArrayList<ItemInventory>();
		Outlet outlet = (Outlet) httpSession.getAttribute("outlet");
		long outId = outlet.getId();
		if(itemInventories != null) {
			for (ItemInventory ivt : itemInventories) {
				if(ivt.getOutlet().getId() == outId) {
					invent.add(ivt);
				}
			}
		}
		
		return invent;
	}
	
	
	// untuk upload gambar
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	@ResponseBody
	public String upload(@RequestParam("image") MultipartFile file) {
			String name="";
			try {
				String fName = file.getOriginalFilename().toString();
				String[] type = fName.split("\\.");
				int len = type.length;
				name = (System.currentTimeMillis())+"."+type[len-1];
				BufferedImage src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
			    File destination = new File(servletContext.getRealPath("/resources/img/"+name));
			    ImageIO.write(src, type[len-1], destination);
			    
			    } catch(Exception e) {
			        e.printStackTrace();
			    }
			return name;
	}
	
	//update status
	@RequestMapping(value="/update-status/{idItem}", method=RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void updateStatus(@PathVariable long idItem) {
		itemService.updateStatus(idItem); 
	}
	
	@RequestMapping(value="/getOne/{id}", method=RequestMethod.PUT)
	@ResponseBody
	public List<ItemInventory> getOneItem(@PathVariable long id,Model model, Item item) {
		List<ItemInventory> inventories = itemInventoryService.searchInventoryByItem(item);
		model.addAttribute("inventories", inventories);
		return inventories;
	}
}
