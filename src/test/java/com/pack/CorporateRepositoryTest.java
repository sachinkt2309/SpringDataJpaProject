package com.pack;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Optional;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;

import com.pack.model.Corporate;
import com.pack.repository.CorporateRepository;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class CorporateRepositoryTest {

	@Autowired
	CorporateRepository corporateRepository;
	
	static Corporate c;
	
	int id;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		
		  c=new Corporate("Jio","Blr",789757,0);
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}

	 

	 @Test
	 @Rollback(false) 
	public void saveCorporateTest()
	{
	
		corporateRepository.save(c);
		System.out.println(c.getCorporateId());
		 id=c.getCorporateId();
		Assertions.assertNotNull(c.getCorporateId());
		
	}
	

  @Test
  
  @Rollback(false) 
  public void findByIdTest() {
	 Optional<Corporate> corp= corporateRepository.findById(id);
     Assertions.assertEquals("Jio", c.getCorporateName());
  }
  	
}
