package com.miniproject.kel2.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Email;

@Entity
@Table(name="CUSTOMER_MP")
public class Customer {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="cust")
	@SequenceGenerator(initialValue=3333, name="cust", sequenceName="cust")
	private long id;
	@Column(length=50, nullable=false)
	private String name;
	@Email
	@Column(length=50)
	private String email;
	@Column(length=16)
	private String phone;
	private Date dob;
	@Column(length=255)
	private String address;
	@ManyToOne
	private Province provinceId;
	@ManyToOne
	private Region regionId;
	@ManyToOne
	private District districtId;
	@ManyToOne
	private User createdBy;
	private Date createdOn;
	@ManyToOne
	private User modifiedBy;
	private Date modifiedOn;
	@Column(nullable=false)
	private Boolean active;
	
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Province getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(Province provinceId) {
		this.provinceId = provinceId;
	}
	public Region getRegionId() {
		return regionId;
	}
	public void setRegionId(Region regionId) {
		this.regionId = regionId;
	}
	public District getDistrictId() {
		return districtId;
	}
	public void setDistrictId(District districtId) {
		this.districtId = districtId;
	}
	public User getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(User createdBy) {
		this.createdBy = createdBy;
	}
	public Date getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}
	public User getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(User modifiedBy) {
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
