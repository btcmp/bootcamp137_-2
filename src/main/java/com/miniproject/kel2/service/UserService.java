package com.miniproject.kel2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.UserDao;
import com.miniproject.kel2.model.User;

@Service
@Transactional
public class UserService {

	@Autowired
	UserDao userDao;
	
	public User getOne(long id) {
		User user = new User();
		user.setId(id);
		return userDao.getOne(user);
	}
}
