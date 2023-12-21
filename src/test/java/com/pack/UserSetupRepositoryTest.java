package com.pack;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;

import com.pack.model.UserSetup;
import com.pack.repository.UserSetupRepository;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class UserSetupRepositoryTest {


	@Autowired
	UserSetupRepository userRepository;
	
	static UserSetup u;
	
	String id;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		
		  u=new UserSetup(4,12,"kiran","kiran123","Delivery","bangalore",67844578,0,0);
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}

	 

	 @Test
	 @Rollback(false) 
	public void saveUserTest()
	{
	
		userRepository.save(u);
		System.out.println(u.getUserId());
		 id=u.getUserId();
		Assertions.assertNotNull(u.getUserId());
		
	}
	

  @Test
  @Rollback(false) 
  public void findByIdTest() {
	 List<UserSetup> user= userRepository.findByUserId(id);
     Assertions.assertEquals("kiran", u.getUserId());
  }	

}
