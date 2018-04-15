package com.miniproject.kel2.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table (name="HISTORY_TRANSFER_STOCK_MP")
public class HistoryTransferStock {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(nullable=false)
	private long id;
	@Column(length=20, nullable=false)
	private String status;
	@ManyToOne
	@JoinColumn(name="created_by")
	private User createdBy;
	
	@Column(name="create_on")
	private Date createdOn;
	
	@ManyToOne 
	public TransferStock transferStock;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public TransferStock getTransferStock() {
		return transferStock;
	}

	public void setTransferStock(TransferStock transferStock) {
		this.transferStock = transferStock;
	}
	
}
