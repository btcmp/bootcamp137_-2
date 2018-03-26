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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table (name="TRANSFER_STOCK_MP")
public class TransferStock {

	public TransferStock() {
		this.createdOn = new Date();
		this.modifiedOn = new Date();
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(nullable=false)
	private long id;
	@Column(name="from_outlet", nullable=false)
	private long fromOutlet;
	@Column(name="to_outlet", nullable=false)
	private long toOutlet;
	@Column(length=255)
	private String notes;
	@Column(length=20, nullable=false)
	private String status;
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
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "transferStock", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<TransferStockDetail> tsDetails;
	
	public List<TransferStockDetail> getTsDetails() {
		return tsDetails;
	}
	public void setTsDetails(List<TransferStockDetail> tsDetails) {
		this.tsDetails = tsDetails;
	}
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getFromOutlet() {
		return fromOutlet;
	}
	public void setFromOutlet(long fromOutlet) {
		this.fromOutlet = fromOutlet;
	}
	public long getToOutlet() {
		return toOutlet;
	}
	public void setToOutlet(long toOutlet) {
		this.toOutlet = toOutlet;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
