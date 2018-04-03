package com.miniproject.kel2.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name="purchase_order_detail_mp")
public class OrderDetail {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="odD")
	@SequenceGenerator(initialValue=131313, name="odD", sequenceName="odD")
	private long id;
	
	@ManyToOne
	@JoinColumn(name="po_id")
	@JsonBackReference
	private PurchaseOrder po;
	
	@ManyToOne
	@JoinColumn(name="variant_id")
	private ItemVariant variant;
	
	@Column(name="request_qty")
	private int requestQty;
	
	@Column(name="unit_cost")
	private float unitCost;
	
	@Column(name="sub_total")
	private float subTotal;
	
	@ManyToOne
	@JoinColumn(name="created_By")
	private User createdBy;
	
	@Column(name="created_on")
	private Date createdOn;
	
	@ManyToOne
	@JoinColumn(name="modified_By")
	private User modifiedBy;
	
	@Column(name="modified_on")
	private Date modifiedOn;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public PurchaseOrder getPo() {
		return po;
	}

	public void setPo(PurchaseOrder po) {
		this.po = po;
	}

	public ItemVariant getVariant() {
		return variant;
	}

	public void setVariant(ItemVariant variant) {
		this.variant = variant;
	}

	public int getRequestQty() {
		return requestQty;
	}

	public void setRequestQty(int requestQty) {
		this.requestQty = requestQty;
	}

	public float getUnitCost() {
		return unitCost;
	}

	public void setUnitCost(float unitCost) {
		this.unitCost = unitCost;
	}

	public float getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(float subTotal) {
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
