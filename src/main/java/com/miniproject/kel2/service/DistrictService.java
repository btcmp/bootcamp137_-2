package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.DistrictDao;
import com.miniproject.kel2.model.District;

@Service
@Transactional
public class DistrictService {

	@Autowired
	DistrictDao districtDao;
	
	public List<District> selectByRegion(long id){
		return districtDao.selectByRegion(id);
	}

	public List<District> selectAll() {
		// TODO Auto-generated method stub
		return districtDao.selectAll();
	}
}
