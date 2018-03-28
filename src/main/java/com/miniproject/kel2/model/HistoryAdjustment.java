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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="HISTORY_ADJUSTMENT_MP")
public class HistoryAdjustment {

	public HistoryAdjustment() {
		this.createdOn = new Date();
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="hisAdj")
	@SequenceGenerator(initialValue=121213, name="hisAdj", sequenceName="hisAdj")
	private long id;
	@ManyToOne
	private Adjustment adjustmentId;
	@Column(length=20)
	private String status;
	@ManyToOne
	private User createdBy;
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdOn;
	
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
