package com.miniproject.kel2.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table (name="ITEM_INVENTORY_MP")
public class ItemInventory {

	public ItemInventory() {
		this.createdOn = new Date();
		this.modifiedOn = new Date();
	}
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(nullable=false)
	private long id;
	@Column(name="variant_id")
	private long variantId;
	@Column(name="outlet_id", nullable=false)
	private long OutletId;
	@Column(nullable=false)
	private int beginning;
	@Column(name="purchase_qty")
	private int purchaseQty;
	@Column(name="sales_order_qty")
	private int salesOrderQty;
	@Column(name="transfer_stock_qty")
	private int transferStockQty;
	@Column(name="adjustment_qty")
	private int adjustmentQty;
	@Column(name="ending_qty", nullable=false)
	private int endingQty;
	@Column(name="alert_at_qty", nullable=false)
	private int alertAtQty;
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
	
}
