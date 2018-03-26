package com.miniproject.kel2.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

public class TransferStockDetail {

	public TransferStockDetail() {
		this.createdOn = new Date();
		this.modifiedOn = new Date();
	}
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(nullable=false)
	private long id;
	@Column(name="in_stock")
	private int inStock;
	@Column(name="transfer_qty", nullable=false)
	private int transferQty;
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
	
	/*@ManyToOne
	public TransferStock transferStock;
	
	@ManyToOne
	public ItemVariant itemVariant;
	
	public TransferStock getTransferStock() {
		return transferStock;
	}
	public void setTransferStock(TransferStock transferStock) {
		this.transferStock = transferStock;
	}
	
	public ItemVariant getItemVariant() {
		return itemVariant;
	}
	public void setItemVariant(ItemVariant itemVariant) {
		this.itemVariant = itemVariant;
	}
	*/
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public int getInStock() {
		return inStock;
	}
	public void setInStock(int inStock) {
		this.inStock = inStock;
	}
	public int getTransferQty() {
		return transferQty;
	}
	public void setTransferQty(int transferQty) {
		this.transferQty = transferQty;
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
	
	
}
