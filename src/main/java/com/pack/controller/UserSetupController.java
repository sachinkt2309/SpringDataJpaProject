package com.pack.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pack.exception.UserNotFoundException;
import com.pack.model.UserSetup;
import com.pack.service.UserSetupService;

@Controller
public class UserSetupController {

	final static Logger logger = LogManager.getLogger(UserSetupController.class);
	@Autowired
    UserSetupService userService;
	
	
	@RequestMapping("/addUserForm")
	 public String add(Model m)  
	 {  
		 logger.info("into add");
	     m.addAttribute("usr", new  UserSetup());  
	     return "UserPage/AddUser";  
	 }
	
	@RequestMapping(value = "/addUser", method = RequestMethod.POST) 
	  public String addUser(UserSetup users) {
		//System.out.println("before "+userid);
		userService.saveUser(users);
		userService.saveUserforLogin(users);
		  return "UserPage/AddUser-success";
	  }
	
	// View User area
	
	 @RequestMapping("/viewUserForm")    
	    public String viewusr(Model m){    
		 List<UserSetup> list=userService.viewAll();
		  m.addAttribute("list",list);
	        return "UserPage/ViewUser";    
	    } 
	 
	 // Modify User area
	 
	 @RequestMapping("/ModifyView1")    
	    public String modifyView(Model m){      
	        return "UserPage/UserModifyView";    
	    }
	 
	 @RequestMapping("/modifyUsr")  
	    public String edit( @RequestParam("userid") String userid, Model m){    
		 List<UserSetup> users = userService.findByName(userid);
		m.addAttribute("editUsrForm",users); 
			System.out.println("userid "+userid);
			UserSetup user1=new UserSetup();
			//m.addAttribute("userco",user1.getUserCount());
	        return "UserPage/ModifyUser";    
	    } 
	 
	 @RequestMapping("/ModifyView")    
	    public String modifyType(Model m){      
	        return "UserPage/SearchModifyUser";    
	    }
	
	 @RequestMapping("/editUser1") 
	  public String edit( @RequestParam("userid") String id,Model m,UserSetup user)
	  {
	  
		  String page=null;
	 System.out.println(id);
	  try
	  {
	  if (!userService.findByName(id).isEmpty())
		 {
			  user = userService.findByName(id).get(0);
			  m.addAttribute("editUserForm",user);
			  page="UserPage/ModifyUser";
			 
		 }
		 else if (userService.findByName(id).isEmpty())
		 {
			 
		  throw new UserNotFoundException();
		   
			  }
			}
			  catch(UserNotFoundException e)
			  {
				  m.addAttribute("exception",e);
			    	page="UserPage/ExceptionUser1";
				  
			  }

	  		return page;
	  		}
	 
	 @RequestMapping("/EditUser")
		public String modify(@RequestParam("UserId") String userid,UserSetup users)
		{
		 //users = userService.findByName(usrid).get(0);
		 System.out.println("userid "+userid);
		 userService.saveUpdate(users,userid);
				  return "UserPage/ModifyUser-success";			 
		}
	 
	 //Delete user area
	 
	 @RequestMapping("/DeleteView1")    
	    public String deleteView(Model m){     
	        return "UserPage/DeleteUser";    
	    }
	 
	 @RequestMapping("/deleteUsr")    
	    public String delete( @RequestParam("userid") String userid,UserSetup user,Model m){    
		// user = userService.findByName(userid).get(0);
		 userService.deleteUser(userid); 
		 	return "UserPage/Deleteuser-success";
	    } 
	 
	 @RequestMapping("/DeleteView")    
	    public String deletetype(Model m){     
	        return "UserPage/Deletetype";    
	    }
	 
	 @RequestMapping("/deleteUser1")
		public String deleteUser(@RequestParam("userid")String id, UserSetup user, Model m) {
			String page = null;
			try {
				if (!userService.findByName(id).isEmpty()) {
					user = userService.findByName(id).get(0);
					userService.deleteUser(id);
					page = "UserPage/Deleteuser-success";
				} else if (userService.findByName(id).isEmpty()) {
					System.out.println("user " + user);
					throw new UserNotFoundException();

				}
			} catch (UserNotFoundException e) {
				m.addAttribute("exception", e);
				page = "UserPage/ExceptionUser2";
			}
			return page;
		}
}
