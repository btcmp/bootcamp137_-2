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

@Entity
@Table(name="SALES_ORDER_DETAIL_MP")
public class SalesOrderDetail {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="sod")
	@SequenceGenerator(initialValue=70000, name="sod", sequenceName="sod")
	private long id;
	@ManyToOne
	private SalesOrder soId;
	@ManyToOne
	private ItemVariant variantId;
	private int qty;
	@Column(name="unit_price")
	private Double unitPrice;
	@Column(name="sub_total")
	private Double subTotal;
	@ManyToOne
	private User createdBy;
	private Date createdOn;
	@ManyToOne
	private User modifiedBy;
	private Date modifiedOn;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public SalesOrder getSoId() {
		return soId;
	}
	public void setSoId(SalesOrder soId) {
		this.soId = soId;
	}
	public ItemVariant getVariantId() {
		return variantId;
	}
	public void setVariantId(ItemVariant variantId) {
		this.variantId = variantId;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public Double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public Double getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(Double subTotal) {
		this.subTotal = subTotal;
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
	
	
}
