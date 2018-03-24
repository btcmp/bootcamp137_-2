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
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="user_mp")
public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="idUser")
	@SequenceGenerator(initialValue=1, name="idUser", sequenceName="idUser")
	private long id;
	 
	private String username;
	 
	private String password;
	 
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "employee_id")
	private Employee employee;
	
	@ManyToOne
	private Role role;
	
	@ManyToMany
	@JoinTable(
			name = "user_roles",
			joinColumns={@JoinColumn(name="user_id")},
			inverseJoinColumns={@JoinColumn(name="role_id")}
			)
	private List<Role> roles;
	
	@Column(name="created_by", nullable=true)
	private long createdBy;
	
	@Column(name="created_on", nullable=true)
	private Date createdOn;
	
	@Column(name="modified_by", nullable=true)
	private long modifiedBy;
	
	@Column(name="modified_on", nullable=true)
	private Date modifiedOn;
	
	@Column(name="enabled", nullable=false)
	private int active;
	
	
	
	//getter and setter
	

	@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Customer> customersCreated;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="modifiedBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Customer> customersModified;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Supplier> suppliersCreated;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="modifiedBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Supplier> suppliersModified;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Adjustment> adjustmentsCreated;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="modifiedBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Adjustment> adjustmentsModified;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<DetailAdjustment> detAdjustmentsCreated;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="modifiedBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<DetailAdjustment> detAdjustmentsModified;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<HistoryAdjustment> hisAdjustmentsCreated;

	public long getId() {
		return id;
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

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
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

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
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

	public List<Adjustment> getAdjustmentsCreated() {
		return adjustmentsCreated;
	}

	public void setAdjustmentsCreated(List<Adjustment> adjustmentsCreated) {
		this.adjustmentsCreated = adjustmentsCreated;
	}

	public List<Adjustment> getAdjustmentsModified() {
		return adjustmentsModified;
	}

	public void setAdjustmentsModified(List<Adjustment> adjustmentsModified) {
		this.adjustmentsModified = adjustmentsModified;
	}

	public List<DetailAdjustment> getDetAdjustmentsCreated() {
		return detAdjustmentsCreated;
	}

	public void setDetAdjustmentsCreated(List<DetailAdjustment> detAdjustmentsCreated) {
		this.detAdjustmentsCreated = detAdjustmentsCreated;
	}

	public List<DetailAdjustment> getDetAdjustmentsModified() {
		return detAdjustmentsModified;
	}

	public void setDetAdjustmentsModified(List<DetailAdjustment> detAdjustmentsModified) {
		this.detAdjustmentsModified = detAdjustmentsModified;
	}

	public List<HistoryAdjustment> getHisAdjustmentsCreated() {
		return hisAdjustmentsCreated;
	}

	public void setHisAdjustmentsCreated(List<HistoryAdjustment> hisAdjustmentsCreated) {
		this.hisAdjustmentsCreated = hisAdjustmentsCreated;
	}
	
//	getter
	
	
	
}
