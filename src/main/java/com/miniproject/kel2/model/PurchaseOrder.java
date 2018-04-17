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
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import util.Currency;

@Entity
@Table(name="purchase_order_mp")
public class PurchaseOrder {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="idPo")
	@SequenceGenerator(initialValue=121212, name="idPo", sequenceName="idPo")
	private long id;
	
	@OneToOne
	@JoinColumn(name="pr_id")
	private PurchaseRequest pr;
	
	@ManyToOne
	@JoinColumn(name="outlet_id")
	private Outlet outlet;
	
	@ManyToOne
	@JoinColumn(name="supplier_id")
	private Supplier supplier;
	
	
	@Column(name="po_No")
	private String poNo;
	
	@Column(name="notes")
	private String notes;
	
	@Column(name="Grand_Total")
	private float grandTotal;
	
	@Column(name="status")
	private String status;
	
	@ManyToOne
	@JoinColumn(name="created_By")
	private User createdBy;
	

	@Column(name="created_on")
	private Date createdOn;
	
	@ManyToOne
	@JoinColumn(name="modified_by")
	private User modifiedBy;
	

	@Column(name="modified_on")
	private Date modifiedOn;

	@OneToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL, mappedBy="po")
	@JsonManagedReference
	private List<OrderDetail> detail;
	
	@OneToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL, mappedBy="po")
	@JsonManagedReference
	private List<HistoryPurchaseOrder> history;

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


	public Outlet getOutlet() {
		return outlet;
	}


	public void setOutlet(Outlet outlet) {
		this.outlet = outlet;
	}


	public Supplier getSupplier() {
		return supplier;
	}


	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}


	public String getPoNo() {
		return poNo;
	}


	public void setPoNo(String poNo) {
		this.poNo = poNo;
	}


	public String getNotes() {
		return notes;
	}


	public void setNotes(String notes) {
		this.notes = notes;
	}


	public float getGrandTotal() {
		return grandTotal;
	}

	public String getGrandTotalFormatted() {
		return Currency.currency((double) grandTotal);
	}

	public void setGrandTotal(float grandTotal) {
		this.grandTotal = grandTotal;
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


	public List<OrderDetail> getDetail() {
		return detail;
	}


	public void setDetail(List<OrderDetail> detail) {
		this.detail = detail;
	}


	public List<HistoryPurchaseOrder> getHistory() {
		return history;
	}


	public void setHistory(List<HistoryPurchaseOrder> history) {
		this.history = history;
	}

	
	
}
