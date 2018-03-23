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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="DISTRICT_MP")
public class District {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private long id;
	@ManyToOne
	private Region regionId;
	@Column(length=50)
	private String name;
	@Column(name="created_by")
	private long createdBy;
	@Column(name="created_on")
	private Date createdOn;
	@Column(name="modified_by")
	private long modifiedBy;
	@Column(name="modified_on")
	private Date modifiedOn;
	@Column(nullable=false)
	private Boolean active;
	@OneToMany(fetch=FetchType.LAZY, mappedBy="districtId", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Customer> customers;
	@OneToMany(fetch=FetchType.LAZY, mappedBy="districtId", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Supplier> suppliers;
	@OneToMany(fetch=FetchType.LAZY, mappedBy="district", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Outlet> outlets;
	
	
	public List<Outlet> getOutlets() {
		return outlets;
	}
	public void setOutlets(List<Outlet> outlets) {
		this.outlets = outlets;
	}
	public List<Supplier> getSuppliers() {
		return suppliers;
	}
	public void setSuppliers(List<Supplier> suppliers) {
		this.suppliers = suppliers;
	}
	public List<Customer> getCustomers() {
		return customers;
	}
	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Region getRegionId() {
		return regionId;
	}
	public void setRegionId(Region regionId) {
		this.regionId = regionId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public Boolean getActive() {
		return active;
	}
	public void setActive(Boolean active) {
		this.active = active;
	}
	
	
}
