package com.miniproject.kel2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.EmployeeDao;
import com.miniproject.kel2.dao.UserDao;
import com.miniproject.kel2.dao.EmpoutDao;
import com.miniproject.kel2.model.EmpOutlet;
import com.miniproject.kel2.model.Employee;
import com.miniproject.kel2.model.Outlet;
import com.miniproject.kel2.model.Role;
import com.miniproject.kel2.model.User;

@Service
@Transactional
public class EmpUserService {

	@Autowired
	EmployeeDao empDao;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	EmpoutDao	empoutDao;
	
	
	public void Save(Employee emp) {
		
		
		Employee pegawai = new Employee();
		pegawai.setId(emp.getId());
		pegawai.setFirstName(emp.getFirstName());
		pegawai.setLastName(emp.getLastName());
		pegawai.setEmail(emp.getEmail());
		pegawai.setTitle(emp.getTitle());
		pegawai.setActive(emp.isActive());
		pegawai.setHaveAccount(emp.isHaveAccount());
		empDao.save(pegawai);
		
		
		if(emp.getEmpOutlets() != null) {
			for(EmpOutlet empout : emp.getEmpOutlets()) {
				EmpOutlet eo = new EmpOutlet();
				eo.setEmployee(pegawai);
				eo.setOutlet(empout.getOutlet());
				
				empoutDao.save(eo);
			}
		}
		
		if(emp.getUser() != null) {
			User user = new User();
			user.setEmployee(pegawai);
			user.setUsername(emp.getUser().getUsername());
			user.setPassword(emp.getUser().getPassword());
			user.setRoles(emp.getUser().getRoles());
			user.setRole(emp.getUser().getRole());
			user.setActive(emp.getUser().isActive());
			
			userDao.save(user);	
		}
		
		
		
	}
	
	public void empUpdate(Employee emp) {
		empDao.update(emp);
	}
	
	public void empDelete(Employee emp) {
		empDao.delete(emp);
	}
	
	public Employee empGetOne(long id) {
		Employee emp = new Employee();
		emp.setId(emp.getId());
		emp.setActive(true);
		emp.setFirstName("sbka");
		emp.setLastName("cnsalk");
		emp.setHaveAccount(true);
		return empDao.getOne(emp);
	}
	
	

	public List<Employee> showActiveEmp(Employee emp) {
		// TODO Auto-generated method stub
		Employee employee = new Employee();
		employee.setActive(true);
		return empDao.showActive(emp); 
	}
	
	 
	public void inactive(Employee emp) {
		// TODO Auto-generated method stub
		Employee empl = new Employee();
		
		empl.setId(emp.getId());
		empl.setActive(false);
		empl.setFirstName("  ");
		empl.setLastName("  ");
		empl.setHaveAccount(false);
		
		empDao.update(empl);
	}
	
	public List<Employee> empGetAll(){
		return empDao.getAll();
	}
	
	public void userUpdate(User user) {
		userDao.update(user);
	}
	
	public void userDelete(User user) {
		userDao.delete(user);
	}
	
	public User userGetOne(long id) {
		User user = new User();
		user.setId(id);
		return userDao.getOne(user);
	}
	
	public List<User> userGetAll(){
		return userDao.getAll();
	}

	public List<Role> roleGetaAll() {
		// TODO Auto-generated method stub
		return userDao.getRoleAll();
	}

	public List<Outlet> outletGetAll() {
		// TODO Auto-generated method stub
		return userDao.getOutletAll();
	}

	




}
