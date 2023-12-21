package com.pack.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="UserSetup1")
public class UserSetup {
	
@Id
@GeneratedValue(strategy = GenerationType.SEQUENCE)
@Column(name = "userCount")
int userCount;

@Column(name = "CorporateId")
int CorporateId;

@Column(name= "userId")
String userId;

@Column(name ="UserPassword")
String UserPassword;

@Column(name ="Department")
String Department;

@Column(name ="Address")
String Address;

@Column(name ="PhoneNumber")
long PhoneNumber;

@Column(name ="DeleteStatus")
int DeleteStatus;

@Column(name ="NewUser")
int NewUser;


public UserSetup() {
	
}


public UserSetup(int userCount,int corporateId, String userId, String userPassword, String department, String address,
		long phoneNumber, int deleteStatus, int newUser) {
	super();
	this.userCount=userCount;
	this.CorporateId = corporateId;
	this.userId = userId;
	this.UserPassword = userPassword;
	this.Department = department;
	this.Address = address;
	this.PhoneNumber = phoneNumber;
	this.DeleteStatus = deleteStatus;
	this.NewUser = newUser;
}

public int getUserCount() {
	return userCount;
}


public void setUserCount(int userCount) {
	this.userCount = userCount;
}


public int getNewUser() {
	return NewUser;
}
public void setNewUser(int newUser) {
	NewUser = newUser;
}
public int getCorporateId() {
	return CorporateId;
}
public void setCorporateId(int corporateId) {
	CorporateId = corporateId;
}
public String getUserId() {
	return userId;
}
public void setUserId(String userId1) {
	userId = userId1;
}
public String getUserPassword() {
	return UserPassword;
}
public void setUserPassword(String userPassword) {
	UserPassword = userPassword;
}
public String getDepartment() {
	return Department;
}
public void setDepartment(String department) {
	Department = department;
}
public String getAddress() {
	return Address;
}
public void setAddress(String address) {
	Address = address;
}
public long getPhoneNumber() {
	return PhoneNumber;
}
public void setPhoneNumber(long phoneNumber) {
	PhoneNumber = phoneNumber;
}
public int getDeleteStatus() {
	return DeleteStatus;
}
public void setDeleteStatus(int deleteStatus) {
	DeleteStatus = deleteStatus;
}

}
