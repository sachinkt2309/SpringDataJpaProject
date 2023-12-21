package com.pack.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="Account1")
public class Account {
	@Id
	//@GeneratedValue(strategy= GenerationType.SEQUENCE)
	@Column(name = "accountNumber")
	long accountNumber;
	
	@Column(name = "CorporateId")
	int CorporateId;

	@Column(name= "AccountName")
	String AccountName;
	
	@Column(name ="Currency")
	String Currency;
	
	@Column(name ="Branch")
	String Branch;
	
	@Column(name ="AvBalance")
	double AvBalance;
	
	@Column(name ="Status")
	String status;
	
	public Account() {
		
	}
	
	
	public Account(int corporateId, long accountNumber, String accountName, String currency, String branch,
			double avBalance, String status) {
		super();
		this.CorporateId = corporateId;
		this.accountNumber = accountNumber;
		this.AccountName = accountName;
		this.Currency = currency;
		this.Branch = branch;
		this.AvBalance = avBalance;
		this.status = status;
	}


	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getCorporateId() {
		return CorporateId;
	}
	public void setCorporateId(int corporateId) {
		CorporateId = corporateId;
	}
	public long getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(long accNumber) {
		accountNumber = accNumber;
	}
	public String getAccountName() {
		return AccountName;
	}
	public void setAccountName(String accName) {
		AccountName = accName;
	}
	public String getCurrency() {
		return Currency;
	}
	public void setCurrency(String currency) {
		Currency = currency;
	}
	public String getBranch() {
		return Branch;
	}
	public void setBranch(String branch) {
		Branch = branch;
	}
	public double getAvBalance() {
		return AvBalance;
	}
	public void setAvBalance(double avBalance) {
		AvBalance = avBalance;
	}
	
	
}
