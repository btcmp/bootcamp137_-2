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
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name="purchase_request_mp")
public class PurchaseRequest {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="idPr")
	@SequenceGenerator(initialValue=9999, name="idPr", sequenceName="idPr")
	private long id;
	
	@ManyToOne
	private Outlet outlet;
	
	@Column(name="ready_time")
	@Temporal(TemporalType.DATE)
	private Date readyTime;
	
	@Column(name = "pr_no")	
	private String prNo;
	
	@Column(name = "notes")
	private String notes;
	
	@Column(name = "status")
	private String status;
	
	@ManyToOne
	@JoinColumn(name = "created_by")
	private User createdBy;
	
	@Column(name="created_on")
	private Date createdOn;
	
	@ManyToOne
	@JoinColumn(name="modified_by")
	private User modifiedBy;
	
	@Column(name="modified_on")
	private Date modifiedOn;
	 
	@OneToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL, mappedBy="pr")
	//@LazyCollection(LazyCollectionOption.FALSE)
	@JsonManagedReference
	private List<RequestDetail> requestDetail;
	
	@OneToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL, mappedBy="pr")
	@JsonManagedReference
	private List<HistoryPurchaseRequest> historyPr;
	

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Outlet getOutlet() {
		return outlet;
	}

	public void setOutlet(Outlet outlet) {
		this.outlet = outlet;
	}

	public Date getReadyTime() {
		return readyTime;
	}

	public void setReadyTime(Date readyTime) {
		this.readyTime = readyTime;
	}

	public String getPrNo() {
		return prNo;
	}

	public void setPrNo(String prNo) {
		this.prNo = prNo;
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

	public List<RequestDetail> getRequestDetail() {
		return requestDetail;
	}

	public void setRequestDetail(List<RequestDetail> requestDetail) {
		this.requestDetail = requestDetail;
	}

	public List<HistoryPurchaseRequest> getHistoryPr() {
		return historyPr;
	}

	public void setHistoryPr(List<HistoryPurchaseRequest> historyPr) {
		this.historyPr = historyPr;
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
