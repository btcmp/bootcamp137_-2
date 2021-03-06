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
import javax.persistence.JoinTable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="user_mp")
public class User {
	 
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="idUser")
	@SequenceGenerator(initialValue=1, name="idUser", sequenceName="idUser")
	private long id;
	 
	private String username;
	 
	private String password;
	 
	
	@OneToOne(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	@JoinColumn(name = "employee_id")
	private Employee employee;
	
	@ManyToOne
	private Role role;
	
	@ManyToMany
	@JoinTable(
			name = "user_roles",
			joinColumns={@JoinColumn(name="user_id")},
			inverseJoinColumns={@JoinColumn(name="role_id")}
			)
	private List<Role> roles;
	
	@Column(name="created_by", nullable=true)
	private long createdBy;
	
	@Column(name="created_on", nullable=true)
	private Date createdOn;
	
	@Column(name="modified_by", nullable=true)
	private long modifiedBy;
	
	@Column(name="modified_on", nullable=true)
	private Date modifiedOn;
	
	@Column(name="enabled", nullable=false)
	private boolean active;
	
	
	
	//getter and setter
	

	@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Customer> customersCreated;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="modifiedBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Customer> customersModified;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Supplier> suppliersCreated;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="modifiedBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Supplier> suppliersModified;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Adjustment> adjustmentsCreated;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="modifiedBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Adjustment> adjustmentsModified;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<DetailAdjustment> detAdjustmentsCreated;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="modifiedBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<DetailAdjustment> detAdjustmentsModified;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<HistoryAdjustment> hisAdjustmentsCreated;

	@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<SalesOrder> salesOrdersCreated;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="modifiedBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<SalesOrder> salesOrdersModified;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<SalesOrderDetail> salesOrderDetailsCreated;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="modifiedBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<SalesOrderDetail> salesOrderDetailsModified;
	
	
	//purchase request
	@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<PurchaseRequest> purchaseRequestsCreated;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<RequestDetail> requestDetailsCreated;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<HistoryPurchaseRequest> historyPurchaseRequestsCreated;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="modifiedBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<PurchaseRequest> purchaseRequestsModified;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="modifiedBy", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<RequestDetail> requestDetailsModified;
	
	//purchase order
		@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
		private List<PurchaseOrder> purchaseOrderCreated;
		
		@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
		private List<OrderDetail> orderDetailsCreated;
		
		@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
		private List<HistoryPurchaseOrder> historyPurchaseOrderCreated;
		
		@OneToMany(fetch=FetchType.LAZY, mappedBy="modifiedBy", cascade=CascadeType.ALL, orphanRemoval=true)
		private List<PurchaseOrder> purchaseOrderModified;
		
		@OneToMany(fetch=FetchType.LAZY, mappedBy="modifiedBy", cascade=CascadeType.ALL, orphanRemoval=true)
		private List<OrderDetail> orderDetailsModified;
		
	// TRANSFER STOCK
		@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
		private List<TransferStock> tStocksCreated;
		
		@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
		private List<TransferStockDetail> tsDetailsCreated;
		
		@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy", cascade=CascadeType.ALL, orphanRemoval=true)
		private List<HistoryTransferStock> htStocksCreated;
		
		@OneToMany(fetch=FetchType.LAZY, mappedBy="modifiedBy", cascade=CascadeType.ALL, orphanRemoval=true)
		private List<TransferStock> tStocksModified;
		
		@OneToMany(fetch=FetchType.LAZY, mappedBy="modifiedBy", cascade=CascadeType.ALL, orphanRemoval=true)
		private List<TransferStockDetail> tsDetailsModified;
		
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
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

	public List<Customer> getCustomersCreated() {
		return customersCreated;
	}

	public void setCustomersCreated(List<Customer> customersCreated) {
		this.customersCreated = customersCreated;
	}

	public List<Customer> getCustomersModified() {
		return customersModified;
	}

	public void setCustomersModified(List<Customer> customersModified) {
		this.customersModified = customersModified;
	}

	public List<Supplier> getSuppliersCreated() {
		return suppliersCreated;
	}

	public void setSuppliersCreated(List<Supplier> suppliersCreated) {
		this.suppliersCreated = suppliersCreated;
	}

	public List<Supplier> getSuppliersModified() {
		return suppliersModified;
	}

	public void setSuppliersModified(List<Supplier> suppliersModified) {
		this.suppliersModified = suppliersModified;
	}

	public List<Adjustment> getAdjustmentsCreated() {
		return adjustmentsCreated;
	}

	public void setAdjustmentsCreated(List<Adjustment> adjustmentsCreated) {
		this.adjustmentsCreated = adjustmentsCreated;
	}

	public List<Adjustment> getAdjustmentsModified() {
		return adjustmentsModified;
	}

	public void setAdjustmentsModified(List<Adjustment> adjustmentsModified) {
		this.adjustmentsModified = adjustmentsModified;
	}

	public List<DetailAdjustment> getDetAdjustmentsCreated() {
		return detAdjustmentsCreated;
	}

	public void setDetAdjustmentsCreated(List<DetailAdjustment> detAdjustmentsCreated) {
		this.detAdjustmentsCreated = detAdjustmentsCreated;
	}

	public List<DetailAdjustment> getDetAdjustmentsModified() {
		return detAdjustmentsModified;
	}

	public void setDetAdjustmentsModified(List<DetailAdjustment> detAdjustmentsModified) {
		this.detAdjustmentsModified = detAdjustmentsModified;
	}

	public List<HistoryAdjustment> getHisAdjustmentsCreated() {
		return hisAdjustmentsCreated;
	}

	public void setHisAdjustmentsCreated(List<HistoryAdjustment> hisAdjustmentsCreated) {
		this.hisAdjustmentsCreated = hisAdjustmentsCreated;
	}

	public List<SalesOrder> getSalesOrdersCreated() {
		return salesOrdersCreated;
	}

	public void setSalesOrdersCreated(List<SalesOrder> salesOrdersCreated) {
		this.salesOrdersCreated = salesOrdersCreated;
	}

	public List<SalesOrder> getSalesOrdersModified() {
		return salesOrdersModified;
	}

	public void setSalesOrdersModified(List<SalesOrder> salesOrdersModified) {
		this.salesOrdersModified = salesOrdersModified;
	}

	public List<SalesOrderDetail> getSalesOrderDetailsCreated() {
		return salesOrderDetailsCreated;
	}

	public void setSalesOrderDetailsCreated(List<SalesOrderDetail> salesOrderDetailsCreated) {
		this.salesOrderDetailsCreated = salesOrderDetailsCreated;
	}

	public List<SalesOrderDetail> getSalesOrderDetailsModified() {
		return salesOrderDetailsModified;
	}

	public void setSalesOrderDetailsModified(List<SalesOrderDetail> salesOrderDetailsModified) {
		this.salesOrderDetailsModified = salesOrderDetailsModified;
	}

	public List<PurchaseRequest> getPurchaseRequestsCreated() {
		return purchaseRequestsCreated;
	}

	public void setPurchaseRequestsCreated(List<PurchaseRequest> purchaseRequestsCreated) {
		this.purchaseRequestsCreated = purchaseRequestsCreated;
	}

	public List<RequestDetail> getRequestDetailsCreated() {
		return requestDetailsCreated;
	}

	public void setRequestDetailsCreated(List<RequestDetail> requestDetailsCreated) {
		this.requestDetailsCreated = requestDetailsCreated;
	}

	public List<HistoryPurchaseRequest> getHistoryPurchaseRequestsCreated() {
		return historyPurchaseRequestsCreated;
	}

	public void setHistoryPurchaseRequestsCreated(List<HistoryPurchaseRequest> historyPurchaseRequestsCreated) {
		this.historyPurchaseRequestsCreated = historyPurchaseRequestsCreated;
	}

	public List<PurchaseRequest> getPurchaseRequestsModified() {
		return purchaseRequestsModified;
	}

	public void setPurchaseRequestsModified(List<PurchaseRequest> purchaseRequestsModified) {
		this.purchaseRequestsModified = purchaseRequestsModified;
	}

	public List<RequestDetail> getRequestDetailsModified() {
		return requestDetailsModified;
	}

	public void setRequestDetailsModified(List<RequestDetail> requestDetailsModified) {
		this.requestDetailsModified = requestDetailsModified;
	}

	public List<PurchaseOrder> getPurchaseOrderCreated() {
		return purchaseOrderCreated;
	}

	public void setPurchaseOrderCreated(List<PurchaseOrder> purchaseOrderCreated) {
		this.purchaseOrderCreated = purchaseOrderCreated;
	}

	public List<OrderDetail> getOrderDetailsCreated() {
		return orderDetailsCreated;
	}

	public void setOrderDetailsCreated(List<OrderDetail> orderDetailsCreated) {
		this.orderDetailsCreated = orderDetailsCreated;
	}

	public List<HistoryPurchaseOrder> getHistoryPurchaseOrderCreated() {
		return historyPurchaseOrderCreated;
	}

	public void setHistoryPurchaseOrderCreated(List<HistoryPurchaseOrder> historyPurchaseOrderCreated) {
		this.historyPurchaseOrderCreated = historyPurchaseOrderCreated;
	}

	public List<PurchaseOrder> getPurchaseOrderModified() {
		return purchaseOrderModified;
	}

	public void setPurchaseOrderModified(List<PurchaseOrder> purchaseOrderModified) {
		this.purchaseOrderModified = purchaseOrderModified;
	}

	public List<OrderDetail> getOrderDetailsModified() {
		return orderDetailsModified;
	}

	public void setOrderDetailsModified(List<OrderDetail> orderDetailsModified) {
		this.orderDetailsModified = orderDetailsModified;
	}

	public List<TransferStock> gettStocksCreated() {
		return tStocksCreated;
	}

	public void settStocksCreated(List<TransferStock> tStocksCreated) {
		this.tStocksCreated = tStocksCreated;
	}

	public List<TransferStockDetail> getTsDetailsCreated() {
		return tsDetailsCreated;
	}

	public void setTsDetailsCreated(List<TransferStockDetail> tsDetailsCreated) {
		this.tsDetailsCreated = tsDetailsCreated;
	}

	public List<HistoryTransferStock> getHtStocksCreated() {
		return htStocksCreated;
	}

	public void setHtStocksCreated(List<HistoryTransferStock> htStocksCreated) {
		this.htStocksCreated = htStocksCreated;
	}

	public List<TransferStock> gettStocksModified() {
		return tStocksModified;
	}

	public void settStocksModified(List<TransferStock> tStocksModified) {
		this.tStocksModified = tStocksModified;
	}

	public List<TransferStockDetail> getTsDetailsModified() {
		return tsDetailsModified;
	}

	public void setTsDetailsModified(List<TransferStockDetail> tsDetailsModified) {
		this.tsDetailsModified = tsDetailsModified;
	}

	
	
	
	
//	getter
	
	
	
}
