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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;



@Entity
@Table(name="employee_mp")
public class Employee {
	

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="idEmp")
	@SequenceGenerator(initialValue=100, name="idEmp", sequenceName="idEmp")
	private long id;
	
	@Column(name="first_name", nullable=false, length=50)
	private String firstName;
	
	@Column(name="last_name", nullable=false, length=50)
	private String lastName;
	
	
	@Column(name="email", nullable=true, length=50)
	private String email;
	
	@Column(name="title", nullable=true, length=50)
	private String title;
	
	@Column(name="have_account", nullable=false)
	private boolean haveAccount;
	
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
	
	@OneToOne(fetch=FetchType.LAZY, mappedBy="employee", cascade=CascadeType.ALL)
	private User user;
	
	@ManyToMany
	@JoinTable(
			name = "employee_outlet",
			joinColumns={@JoinColumn(name="employee_id")},
			inverseJoinColumns={@JoinColumn(name="outlet_id")}
			)
	private List<Outlet> outlet;
	
	//kurang relasi ke tabel employee outlet
		
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) { 
		this.user = user;
	}

	

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	

	public boolean isHaveAccount() {
		return haveAccount;
	}
	public void setHaveAccount(boolean haveAccount) {
		this.haveAccount = haveAccount;
	}
	
	
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	public List<Outlet> getOutlet() {
		return outlet;
	}
	public void setOutlet(List<Outlet> outlet) {
		this.outlet = outlet;
	}

	
	

	
	

}
