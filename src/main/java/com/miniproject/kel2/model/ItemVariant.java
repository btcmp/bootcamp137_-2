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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import util.Currency;


@Entity
@Table (name="ITEM_VARIANT_MP")
public class ItemVariant {
	
	public ItemVariant() {
		this.createdOn = new Date();
		this.modifiedOn = new Date();
	}

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(nullable=false)
	private long id;
	@Column(nullable=false, length=255)
	private String name;
	@Column(nullable=false, length=50)
	private String sku;
	@Column(nullable=false)
	private float price;
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
	@Column(nullable=false)
	private boolean active;
	
	
	@ManyToOne
	public Item item;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "itemvar", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<RequestDetail> requestDetail;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "itemVariant", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<ItemInventory> itemInventories;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="variantId", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<DetailAdjustment> detAdjustments;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="itemVariant", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<TransferStockDetail> tsDetails;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="variantId", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<SalesOrderDetail> salesOrderDetails;
	
	public List<TransferStockDetail> getTsDetails() {
		return tsDetails;
	}
	public void setTsDetails(List<TransferStockDetail> tsDetails) {
		this.tsDetails = tsDetails;
	}
	public List<DetailAdjustment> getDetAdjustments() {
		return detAdjustments;
	}
	public void setDetAdjustments(List<DetailAdjustment> detAdjustments) {
		this.detAdjustments = detAdjustments;
	}
	
	public List<RequestDetail> getRequestDetail() {
		return requestDetail;
	}
	public void setRequestDetail(List<RequestDetail> requestDetail) {
		this.requestDetail = requestDetail;
	}
	public void setSalesOrderDetails(List<SalesOrderDetail> salesOrderDetails) {
		this.salesOrderDetails = salesOrderDetails;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	
	public List<ItemInventory> getItemInventories() {
		return itemInventories;
	}
	public void setItemInventories(List<ItemInventory> itemInventories) {
		this.itemInventories = itemInventories;
	}
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSku() {
		return sku;
	}
	public void setSku(String sku) {
		this.sku = sku;
	}
	public float getPrice() {
		return price;
	}
	
	public String getPriceFormatted() {
		return Currency.currency((double) price);
	}
	
	public void setPrice(float price) {
		this.price = price;
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
	
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	public List<SalesOrderDetail> getSalesOrderDetails() {
		return salesOrderDetails;
	}
	public void setSalesOrders(List<SalesOrderDetail> salesOrderDetails) {
		this.salesOrderDetails = salesOrderDetails;
	}
	
}
