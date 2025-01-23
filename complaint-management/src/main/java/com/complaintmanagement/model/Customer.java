package com.complaintmanagement.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
public class Customer {
	 
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id")
	private int id;
	
	@Column(name="FirstName")
	private String firstname;
	
	@Column(name="LastName")
	private String lastname;
	
	@Column(name="UserName")
	private String username;
	
	@Column(name="EmailId")
	private String emailid;
	
	@Column(name="Password")
	private String password;
	
	@Column(name="MobileNo")
	private String mobileno;
	
	@Column(name="govtid")
	private String govtid;
	
	@Column(name="govtidtype")
	private String govtidtype;
	
	@Column(name="citizenship")
	private String citizenship;

	@Column(name="state")
	private String state;

	@Column(name="City")
	private String City;

	@Column(name="kanha")
	private String kanha;

	@Column(name="stay")
	private String stay;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmailid() {
		return emailid;
	}

	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobileno() {
		return mobileno;
	}

	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}

	public String getGovtid() {
		return govtid;
	}

	public void setGovtid(String govtid) {
		this.govtid = govtid;
	}

	public String getGovtidtype() {
		return govtidtype;
	}

	public void setGovtidtype(String govtidtype) {
		this.govtidtype = govtidtype;
	}

	public String getCitizenship() {
		return citizenship;
	}

	public void setCitizenship(String citizenship) {
		this.citizenship = citizenship;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return City;
	}

	public void setCity(String city) {
		City = city;
	}

	public String getKanha() {
		return kanha;
	}

	public void setKanha(String kanha) {
		this.kanha = kanha;
	}

	public String getStay() {
		return stay;
	}

	public void setStay(String stay) {
		this.stay = stay;
	}

	
	
}
