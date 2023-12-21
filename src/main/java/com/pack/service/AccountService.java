package com.pack.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pack.model.Account;
import com.pack.repository.AccountRepository;

@Service
public class AccountService {

	@Autowired
	AccountRepository accountRepository;
	
	public List<Account> viewAll() {
		return accountRepository.findAll();
	}
	
	public void saveAccount(Account account) {
		accountRepository.save(account);
	}
	
	public Optional<Account> findAccountByAccountNumber(long accountnumber) {

		//System.out.println("into");
		return accountRepository.findById(accountnumber);
	}
	
	/*
	 * public void deleteAccount(Account account) {
	 * accountRepository.delete(account); }
	 */
	public void deleteAccount1(long accountnumber) {
		String value="Closed";
		accountRepository.deleteAccount(accountnumber,value);
	}



	
}
