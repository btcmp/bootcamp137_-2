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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
	@ManyToOne
	@JoinColumn(name="from_outlet", nullable=false)
	private Outlet fromOutlet;
	@ManyToOne
	@JoinColumn(name="to_outlet", nullable=false)
	private Outlet toOutlet;
	@Column(length=255)
	private String notes;
	@Column(length=20, nullable=false)
	private String status;
	@ManyToOne
	@JoinColumn(name="created_by")
	private User createdBy;
	@Temporal(TemporalType.DATE)
	@Column(name="created_on")
	private Date createdOn;
	@ManyToOne
	@JoinColumn(name="modified_by")
	private User modifiedBy;
	@Temporal(TemporalType.DATE)
	@Column(name="modified_on")
	private Date modifiedOn;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "transferStock", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<TransferStockDetail> tsDetails;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "transferStock", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<HistoryTransferStock> historyTransferStock;
	
/*	@ManyToOne
	public Outlet outlet;*/
	
	public List<TransferStockDetail> getTsDetails() {
		return tsDetails;
	}
	public void setTsDetails(List<TransferStockDetail> tsDetails) {
		this.tsDetails = tsDetails;
	}
	
	public List<HistoryTransferStock> getHistoryTransferStock() {
		return historyTransferStock;
	}
	public void setHistoryTransferStock(List<HistoryTransferStock> historyTransferStock) {
		this.historyTransferStock = historyTransferStock;
	}
/*	
	public Outlet getOutlet() {
		return outlet;
	}
	public void setOutlet(Outlet outlet) {
		this.outlet = outlet;
	}*/
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
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
	public Date getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}
	public Date getModifiedOn() {
		return modifiedOn;
	}
	public void setModifiedOn(Date modifiedOn) {
		this.modifiedOn = modifiedOn;
	}
	public Outlet getFromOutlet() {
		return fromOutlet;
	}
	public void setFromOutlet(Outlet fromOutlet) {
		this.fromOutlet = fromOutlet;
	}
	public Outlet getToOutlet() {
		return toOutlet;
	}
	public void setToOutlet(Outlet toOutlet) {
		this.toOutlet = toOutlet;
	}
	public User getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(User createdBy) {
		this.createdBy = createdBy;
	}
	public User getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(User modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	
	
}
