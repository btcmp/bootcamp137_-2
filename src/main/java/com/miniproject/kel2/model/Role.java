package com.miniproject.kel2.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.GenericGenerator;

public class Role {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@GenericGenerator(name = "system-uuid", strategy = "uuid2")
	private int id;
	
	@Column(name="name", nullable=false, length=50)
	private String name;
	
	@Column(name="description", nullable=true, length=50)
	private String description;
	
	@Column(name="created_by", nullable=true)
	private long createdBy;
	
	@Column(name="created_on", nullable=true)
	private Date createdOn;
	
	@Column(name="modified_by", nullable=true)
	private long modifiedBy;
	
	@Column(name="modified_on", nullable=true)
	private Date modifiedOn;
	
	@Column(name="active", nullable=false)
	private boolean active;
	
	@ManyToOne
	private User user;
	
	

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
	
	
}
