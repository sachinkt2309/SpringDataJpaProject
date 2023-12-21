package com.pack.repository;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.pack.model.Account;

public interface AccountRepository extends JpaRepository<Account,Long> {

	

	  @Transactional
	  @Modifying
	  @Query(value="update Account1 set status= :value  where  account_number = :accountnumber",nativeQuery = true) 
	  void deleteAccount(long accountnumber,String value);

	 
}
