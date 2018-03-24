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
@Table(name="DETAIL_ADJUSTMENT_MP")
public class DetailAdjustment {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="detAdj")
	@SequenceGenerator(initialValue=121212, name="detAdj", sequenceName="detAdj")
	private long id;
	@ManyToOne
	private Adjustment adjustmentId;
	@ManyToOne
	private ItemVariant variantId;
	@Column(name="in_stock")
	private int inStock;
	@Column(name="actual_stock")
	private int actualStock;
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
	public Adjustment getAdjustmentId() {
		return adjustmentId;
	}
	public void setAdjustmentId(Adjustment adjustmentId) {
		this.adjustmentId = adjustmentId;
	}
	public ItemVariant getVariantId() {
		return variantId;
	}
	public void setVariantId(ItemVariant variantId) {
		this.variantId = variantId;
	}
	public int getInStock() {
		return inStock;
	}
	public void setInStock(int inStock) {
		this.inStock = inStock;
	}
	public int getActualStock() {
		return actualStock;
	}
	public void setActualStock(int actualStock) {
		this.actualStock = actualStock;
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
