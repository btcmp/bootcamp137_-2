package com.miniproject.kel2.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name="History_pr_mp")
public class HistoryPurchaseRequest {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="HistoryId")
	@SequenceGenerator(initialValue=111111, name="HistoryId", sequenceName="HistoryId")
	private long id;
	
	@ManyToOne
	@JoinColumn(name="pr_id")
	@JsonBackReference
	private PurchaseRequest pr;
	
	@Column(name="status")
	private String status;
	
	@ManyToOne
	@JoinColumn(name="created_By")
	private User createdBy;
	
	@Column(name="created_on")
	private Date createdOn;

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
	
	

}
