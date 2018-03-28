package com.miniproject.kel2.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.miniproject.kel2.dao.EmployeeDao;
import com.miniproject.kel2.dao.UserDao;
import com.miniproject.kel2.dao.EmpoutDao;
import com.miniproject.kel2.dao.OutletDao;
import com.miniproject.kel2.model.EmpOutlet;
import com.miniproject.kel2.model.Employee;
import com.miniproject.kel2.model.Outlet;
import com.miniproject.kel2.model.Role;
import com.miniproject.kel2.model.User;

import javassist.compiler.ast.ArrayInit;

@Service
@Transactional
public class EmpUserService {

	@Autowired
	EmployeeDao empDao;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	EmpoutDao	empoutDao;
	
	@Autowired
	OutletDao outletDao;
	
	
	public void Save(Employee emp) {
		
		//many to many
		emp.setOutlet(getAssignedOutlet(emp.getOutlet()));
		if(emp.getUser() != null) {
			emp.getUser().setEmployee(emp);
		}
		
		empDao.save(emp);
		
		//yang pake one to many
		
		/*User user = new User();
		
		Employee pegawai = new Employee();
		pegawai.setId(emp.getId());
		pegawai.setFirstName(emp.getFirstName());
		pegawai.setLastName(emp.getLastName());
		pegawai.setEmail(emp.getEmail());
		pegawai.setTitle(emp.getTitle());
		pegawai.setActive(emp.isActive());
		pegawai.setHaveAccount(emp.isHaveAccount());
		pegawai.setEmpOutlets(emp.getEmpOutlets());
		//pegawai.setOutlet(getAssignedOutlet(emp.getOutlet()));
		pegawai.setUser(user);
		
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
			user.setEmployee(pegawai);
			user.setUsername(emp.getUser().getUsername());
			user.setPassword(emp.getUser().getPassword());
			user.setRoles(emp.getUser().getRoles());
			user.setRole(emp.getUser().getRole());
			user.setActive(emp.getUser().isActive());
			
			userDao.save(user);	
		}
		*/	
	}
	
	private List<Outlet> getAssignedOutlet(List<Outlet> outlet) {
		// TODO Auto-generated method stub
		
		List<Outlet> listOutlet = new ArrayList<Outlet>();
		
		for(int i = 0; i < outlet.size(); i++) {
			listOutlet.add(outletDao.getOneId(outlet.get(i).getId()));
		}
		return listOutlet;
	}
	

	public void empUpdate(Employee emp) {
	
		emp.setOutlet(getAssignedOutlet(emp.getOutlet()));
		User user;
		
		if(emp.getUser() != null) {
			user = userDao.getUserByEmployee(emp);
			if (user != null) {
				//untuk set id user yang diambil dari tabel user.employee_id
				emp.getUser().setId(user.getId());
			}
			emp.getUser().setEmployee(emp);
			} 
		else {
			user = userDao.getUserByEmployee(emp);
			if (user != null) {
				user.setActive(false);
				emp.setUser(user);
			}
			emp.getUser().setEmployee(emp);
			} 
		
		empDao.update(emp);
	}
	
	public void empDelete(Employee emp) {
		empDao.delete(emp);
	}
	
	public Employee empGetOne(long id) {
		return empDao.getOne(id);
	}
	
	

	public List<Employee> showActiveEmp(Employee emp) {
		// TODO Auto-generated method stub
		Employee employee = new Employee();
		employee.setActive(true);
		return empDao.showActive(emp); 
	}
	
	 
	public void inactive(Employee emp) {
		// TODO Auto-generated method stub
		
		
		emp.setId(emp.getId());
		emp.setActive(false);
		emp.setFirstName("sdhjkf");
		emp.setLastName("daskl");
		emp.setHaveAccount(emp.isHaveAccount());
		emp.setActive(emp.isActive());
		emp.setEmail(emp.getEmail());
		emp.setTitle(emp.getTitle());
		empDao.update(emp); 
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
