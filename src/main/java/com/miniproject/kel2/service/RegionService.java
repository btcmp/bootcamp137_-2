package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.RegionDao;
import com.miniproject.kel2.model.Region;

@Service
@Transactional
public class RegionService {

	@Autowired
	RegionDao regionDao;
	
	public List<Region> selectByProvince(long id){
		return regionDao.selectByProvince(id);
	}

	public List<Region> selectAll() {
		// TODO Auto-generated method stub
		return regionDao.selectAll();
	}
}
