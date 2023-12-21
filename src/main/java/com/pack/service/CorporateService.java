package com.pack.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pack.model.Corporate;
import com.pack.repository.CorporateRepository;

@Service
public class CorporateService {

	@Autowired
	CorporateRepository corporateRepository;
	
	public List<Corporate> viewAll() {
		return corporateRepository.findAll(); 
	}
	
	public void saveCorporate(Corporate corporate) {
		corporateRepository.save(corporate);        
	}
	
	public Optional<Corporate> getCorporateById(int corporateid) {

		System.out.println("into");
		return corporateRepository.findById(corporateid);
	}
	
	public void deleteCorporate(int corporateid)

	{
		int a=1;
		corporateRepository.deleteCorp(corporateid,a);  

	}
}
