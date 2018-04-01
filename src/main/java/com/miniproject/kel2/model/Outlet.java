package com.miniproject.kel2.model;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.validator.constraints.Email;

@Entity
@Table (name="OUTLET_MP")
public class Outlet {
	
	public Outlet() {
		this.createdOn = new Date();
		this.modifiedOn = new Date();
	}
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(nullable=false)
	private long id;
	@Column(nullable=false, length=50)
	private String name;
	@Column(length=255)
	private String address;
	@Column(length=16)
	private String phone;
	@Email
	@Column(length=50)
	private String email;
	@Column(name="postal_code", length=6)
	private String postalCode;
	@Column(name="created_by")
	private long createdBy;
	@Temporal(TemporalType.DATE)
	@Column(name="created_on")
	private Date createdOn;
	@Column(name="modified_by")
	private long modifiedBy;
	@Temporal(TemporalType.DATE)
	@Column(name="modified_on")
	private Date modifiedOn;
	@Column(nullable=false)
	private boolean active;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "outlet", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<ItemInventory> itemInventories;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="outlet", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<EmpOutlet> empOutlets;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="outlet", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<PurchaseRequest> pr;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="outlet", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<TransferStock> tStocks;
	
	@ManyToOne
	public Province province;
	
	@ManyToOne
	public Region region;
	 
	@ManyToOne
	public District district;
	
	@ManyToMany(mappedBy="outlet")
	private Set<Employee> employee;
	
	public List<TransferStock> gettStocks() {
		return tStocks;
	}
	public void settStocks(List<TransferStock> tStocks) {
		this.tStocks = tStocks;
	}
	public List<EmpOutlet> getEmpOutlets() {
		return empOutlets;
	}
	public void setEmpOutlets(List<EmpOutlet> empOutlets) {
		this.empOutlets = empOutlets;
	}
	public List<ItemInventory> getItemInventories() {
		return itemInventories;
	}
	public void setItemInventories(List<ItemInventory> itemInventories) {
		this.itemInventories = itemInventories;
	}
	public Province getProvince() {
		return province;
	}
	public void setProvince(Province province) {
		this.province = province;
	}
	public Region getRegion() {
		return region;
	}
	public void setRegion(Region region) {
		this.region = region;
	}
	public District getDistrict() {
		return district;
	}
	public void setDistrict(District district) {
		this.district = district;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
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
	public Set<Employee> getEmployee() {
		return employee;
	}
	public void setEmployee(Set<Employee> employee) {
		this.employee = employee;
	}
	public List<PurchaseRequest> getPr() {
		return pr;
	}
	public void setPr(List<PurchaseRequest> pr) {
		this.pr = pr;
	}

	
	
}
