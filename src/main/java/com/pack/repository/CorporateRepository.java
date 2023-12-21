package com.pack.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.pack.model.Corporate;

@Repository
public interface CorporateRepository extends JpaRepository<Corporate,Integer> {

	
	@Transactional
	@Modifying
	@Query(value="update corporate1 set delete_status= :a where corporate_id= :corporateid",nativeQuery = true)
	void deleteCorp(int corporateid, int a);	
}
