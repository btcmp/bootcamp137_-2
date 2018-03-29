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
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="SALES_ORDER_MP")
public class SalesOrder {
	
	public SalesOrder() {
		this.createdOn = new Date();
	}

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="so")
	@SequenceGenerator(initialValue=7000, name="so", sequenceName="so")
	private long id;
	@ManyToOne
	private Customer customer;
	@Column(name="grand_total", nullable=false)
	private Double grandTotal;
	@ManyToOne
	private User createdBy;
	private Date createdOn;
	@ManyToOne
	private User modifiedBy;
	private Date modifiedOn;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="soId", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<SalesOrderDetail> sods;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Double getGrandTotal() {
		return grandTotal;
	}
	public void setGrandTotal(Double grandTotal) {
		this.grandTotal = grandTotal;
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
	public List<SalesOrderDetail> getSods() {
		return sods;
	}
	public void setSods(List<SalesOrderDetail> sods) {
		this.sods = sods;
	}
	
	
	
}
