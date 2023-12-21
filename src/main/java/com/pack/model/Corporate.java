package com.pack.model;


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity  
@Table(name="Corporate1")
public class Corporate {
	
@Id  
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name ="CorporateId")	
int CorporateId;

@Column(name= "CorporateName")
String CorporateName;

@Column(name ="Address")
String Address;

@Column(name ="PhoneNumber")
long phoneNumber;

@Column(name ="DeleteStatus")
int DeleteStatus;

public Corporate() {
	
}
public Corporate(String corporateName,String address, long phoneNumber, int deleteStatus) {
	super();
	this.CorporateName = corporateName;
	this.Address = address;
	this.phoneNumber = phoneNumber;
	this.DeleteStatus = deleteStatus;
}

public int getDeleteStatus() {
	return DeleteStatus;
}
public void setDeleteStatus(int deleteStatus) {
	DeleteStatus = deleteStatus;
}
public int getCorporateId() {
	return CorporateId;
}
public void setCorporateId(int corporateId) {
	CorporateId = corporateId;
}
public String getCorporateName() {
	return CorporateName;
}
public void setCorporateName(String corporateName) {
	CorporateName = corporateName;
}
public String getAddress() {
	return Address;
}
public void setAddress(String address) {
	Address = address;
}
public long getPhoneNumber() {
	return phoneNumber;
}
public void setPhoneNumber(long phoneNumber) {
	this.phoneNumber = phoneNumber;
}

}
