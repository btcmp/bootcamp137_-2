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
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Email;

@Entity
@Table(name="SUPPLIER_MP")
public class Supplier {
	
	public Supplier() {
		this.createdOn = new Date();
		this.active = false;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="supp")
	@SequenceGenerator(initialValue=4444, name="supp", sequenceName="supp")
	private Long id;
	@NotNull
	@Column(nullable=false, length=50)
	private String name;
	@Column(length=255)
	private String address;
	@Column(length=16)
	private String phone;
	@Email
	private String email;
	@ManyToOne
	private Province provinceId;
	@ManyToOne
	private Region regionId;
	@ManyToOne
	private District districtId;
	@Column(name="postal_code", length=50)
	private String postalCode;
	@ManyToOne
	private User createdBy;
	private Date createdOn;
	@ManyToOne
	private User modifiedBy;
	private Date modifiedOn;
	private Boolean active;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
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
	public Province getProvinceId() {
		return provinceId;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public District getDistrictId() {
		return districtId;
	}
	public void setDistrictId(District districtId) {
		this.districtId = districtId;
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
	public District getDisrictId() {
		return districtId;
	}
	public void setDisrictId(District disrictId) {
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
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
