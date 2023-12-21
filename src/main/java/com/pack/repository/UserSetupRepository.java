package com.pack.repository;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.pack.model.UserSetup;

public interface UserSetupRepository extends JpaRepository<UserSetup,String> {
	
	@Transactional
	@Modifying
	@Query(value="update user_setup1 set delete_status= :value  where  user_id = :userid",nativeQuery = true)
	public void deleteUser(String userid,int value);

	public List<UserSetup> findByUserId(String userid);

	@Transactional
	@Modifying
	@Query(value="insert into user(user_name,password,roles,is_Active) values(:name,:pass,:role,:isActive)",nativeQuery = true)
	public void saveLoginUser(String name, String pass, String role, int isActive);
	

	@Transactional
	@Modifying
	@Query(value="update user_setup1 set department= :depart,address= :address,phone_number= :phone where user_id= :userid",nativeQuery = true)
	public void saveUpdate(String userid, String depart, String address, long phone);

	
}
