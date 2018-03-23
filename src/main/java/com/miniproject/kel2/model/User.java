package com.miniproject.kel2.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;




@Entity
@Table(name="user_mp")
public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="idUser")
	@SequenceGenerator(initialValue=3333, name="idUser", sequenceName="idUser")
	private long id;
	 
	private String username;
	 
	private String password;
	 
	@ManyToMany
	@JoinTable(
			name = "user_roles",
			joinColumns={@JoinColumn(name="user_id")},
			inverseJoinColumns={@JoinColumn(name="role_id")}
			)
	private List<Role> roles;
	
	
	@ManyToOne
	private Employee employee;
	
	@Column(name="created_by", nullable=true)
	private long createdBy;
	
	@Column(name="created_on", nullable=true)
	private Date createdOn;
	
	@Column(name="modified_by", nullable=true)
	private long modifiedBy;
	
	@Column(name="modified_on", nullable=true)
	private Date modifiedOn;
	
	@Column(name="enabled", nullable=false)
	private boolean active;
	
	//getter and setter
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Customer> customersCreated;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="modifiedBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Customer> customersModified;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Supplier> suppliersCreated;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="modifiedBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Supplier> suppliersModified;

	
	public List<Supplier> getSuppliersCreated() {
		return suppliersCreated;
	}

	public void setSuppliersCreated(List<Supplier> suppliersCreated) {
		this.suppliersCreated = suppliersCreated;
	}

	public List<Supplier> getSuppliersModified() {
		return suppliersModified;
	}

	public void setSuppliersModified(List<Supplier> suppliersModified) {
		this.suppliersModified = suppliersModified;
	}
	
	public List<Customer> getCustomersCreated() {
		return customersCreated;
	}

	public void setCustomersCreated(List<Customer> customersCreated) {
		this.customersCreated = customersCreated;
	}

	public List<Customer> getCustomersModified() {
		return customersModified;
	}

	public void setCustomersModified(List<Customer> customersModified) {
		this.customersModified = customersModified;
	}

	public long getId() {
		return id;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public void setId(long id) {
		this.id = id;
	}

	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(long createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public long getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(long modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public Date getModifiedOn() {
		return modifiedOn;
	}

	public void setModifiedOn(Date modifiedOn) {
		this.modifiedOn = modifiedOn;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	
	
}
