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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="ADJUSTMENT_MP")
public class Adjustment {
	
	public Adjustment() {
		this.createdOn = new Date();
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="adj")
	@SequenceGenerator(initialValue=1212, name="adj", sequenceName="adj")
	private long id;
	@ManyToOne
	private Outlet outletId;
	@Column(length=255)
	private String notes;
	@Column(length=20, nullable=false)
	private String status;
	@ManyToOne
	private User createdBy;
	@Temporal(TemporalType.DATE)
	private Date createdOn;
	@ManyToOne
	private User modifiedBy;
	@Temporal(TemporalType.DATE)
	private Date modifiedOn;
	@OneToMany(fetch=FetchType.LAZY, mappedBy="adjustmentId", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<DetailAdjustment> detAdjustments;
	@OneToMany(fetch=FetchType.LAZY, mappedBy="adjustmentId", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<HistoryAdjustment> hisAdjustments;
	
	
	public List<HistoryAdjustment> getHisAdjustments() {
		return hisAdjustments;
	}
	public void setHisAdjustments(List<HistoryAdjustment> hisAdjustments) {
		this.hisAdjustments = hisAdjustments;
	}
	public List<DetailAdjustment> getDetAdjustments() {
		return detAdjustments;
	}
	public void setDetAdjustments(List<DetailAdjustment> detAdjustments) {
		this.detAdjustments = detAdjustments;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Outlet getOutletId() {
		return outletId;
	}
	public void setOutletId(Outlet outletId) {
		this.outletId = outletId;
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
