package com.pack.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pack.exception.UserNotFoundException;
import com.pack.model.UserSetup;
import com.pack.repository.UserSetupRepository;

@Service
public class UserSetupService {
	@Autowired
	UserSetupRepository userRepository;
	
	public List<UserSetup> viewAll() {
		return userRepository.findAll();
	}
	
	public void saveUser(UserSetup user) {
		System.out.println("user id in service"+user.getUserId());
		userRepository.save(user);
		
	}
	
	
	  public void saveUserforLogin(UserSetup users) 
	  {
	  String name=users.getUserId(); 
	  String pass=users.getUserPassword(); 
	  String role="ROLE_USER"; 
	  int isActive=1;
	  userRepository.saveLoginUser(name,pass,role,isActive);
	  }
	 
	public List<UserSetup> findByName(String userid) {

		System.out.println("into");
		return userRepository.findByUserId(userid);
	}
	
	public void saveUpdate(UserSetup users,String userid) {
		String depart=users.getDepartment();
		String address=users.getAddress();
		long phone=users.getPhoneNumber();
		userRepository.saveUpdate(userid,depart,address,phone);
	}
	public void deleteUser(String userid)

	{
		int a=1;
		userRepository.deleteUser(userid,a);
	}

//	public UserSetup findUserByName(String userid) throws UserNotFoundException {
//		System.out.println("Finding Enitity by Id = "+userid);
//		if(userid == null)
//			throw new UserNotFoundException();
//		
//		Optional<UserSetup> findById = userRepository.findByName(userid);
//		if(findById.isPresent())
//			return findById.get();
//		
//		throw new UserNotFoundException();
//	}
}
