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
@Table(name="product_request_detail_mp")
public class RequestDetail {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="idPrD")
	@SequenceGenerator(initialValue=101010, name="idPrD", sequenceName="idPrD")
	private long id;
	
	@ManyToOne
	private PurchaseRequest pr;
	
	@ManyToOne
	private ItemVariant itemvar;
				
	@Column(name="request_qty")
	private int requestQty;
	
	@Column(name="created_by")
	private long createdBy;
	
	@Column(name="created_on")
	private Date createdOn;
	
	@Column(name="modified_by")
	private long modifiedBy;
	
	@Column(name="modified_on")
	private Date modifiedOn;
	

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public PurchaseRequest getPr() {
		return pr;
	}

	public void setPr(PurchaseRequest pr) {
		this.pr = pr;
	}

	public ItemVariant getItemvar() {
		return itemvar;
	}

	public void setItemvar(ItemVariant itemvar) {
		this.itemvar = itemvar;
	}

	public int getRequestQty() {
		return requestQty;
	}

	public void setRequestQty(int requestQty) {
		this.requestQty = requestQty;
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
