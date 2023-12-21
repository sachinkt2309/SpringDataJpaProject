package com.pack;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Optional;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;

import com.pack.model.Account;
import com.pack.repository.AccountRepository;

import org.junit.jupiter.api.BeforeAll;

import org.junit.jupiter.api.Test;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class AccountRepositoryTest {

	@Autowired
	AccountRepository accountRepository;

	static Account a;

	long id;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {

		a = new Account(1,562314,"IBMA2", "Rupees", "mumbai",1000.0,"Active");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}

	@Test
	@Rollback(false)
	public void saveCorporateTest() {

		accountRepository.save(a);
		System.out.println(a.getAccountNumber());
		id = a.getAccountNumber();
		Assertions.assertNotNull(a.getAccountNumber());

	}

	@Test

	@Rollback(false)
	public void findByIdTest() {
		Optional<Account> acc = accountRepository.findById(id);
		Assertions.assertEquals("IBMA2", a.getAccountName());
	}

}
