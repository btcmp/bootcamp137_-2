package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.OutletDao;
import com.miniproject.kel2.model.Outlet;

@Service
@Transactional
public class OutletService {

	@Autowired
	OutletDao outletDao;
	
	public void save(Outlet outlet) {
		outletDao.save(outlet);
	}
	public List<Outlet> selectAll(){
		return outletDao.selectAll();
	}
	public Outlet getOne(long id) {
		Outlet outlet = new Outlet();
		outlet.setId(id);
		return outletDao.getOne(outlet);
	}
	public void update(Outlet outlet) {
		outletDao.update(outlet);
	}
	public void delete(Outlet outlet) {
		outletDao.delete(outlet);
	}
	public void saveAtauUpdate(Outlet outlet) {
		outletDao.saveAtauUpdate(outlet);
	}
}
