package com.miniproject.kel2.dao;

import java.util.List;

import com.miniproject.kel2.model.Outlet;
import com.miniproject.kel2.model.Role;
import com.miniproject.kel2.model.User;

public interface UserDao {
	public User getOne(User user);
	//getAll
	public List<User> getAll();
		//save
	public void save(User user);
		//update
	public void update(User user);
		//delete
	public void delete(User user);
	
	//roleall
	public List<Role> getRoleAll();
	
	public List<Outlet> getOutletAll();
}
