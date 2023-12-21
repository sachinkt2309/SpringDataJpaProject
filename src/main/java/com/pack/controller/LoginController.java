package com.pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pack.model.Corporate;

@Controller
public class LoginController {
	
	@RequestMapping("/admin")
	public String admin()
	{
		return "index";
	}
	
	@RequestMapping(value="/user")
	public String usercurrentUserName(Model m) {
//		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		String username="";
//		if (principal instanceof UserDetails) {
//		username = username+((UserDetails)principal).getUsername();
//		} else {
//		username = username+principal.toString();
//		}
//        	System.out.println("name in login "+username);
//        	m.addAttribute("userid",username);
		return "FrontOfficeHomepage";
	}

//	@RequestMapping(value="/user", method = RequestMethod.GET)
//	public String currentUserName(Authentication authentication,Model m) {
//        String name="";
//        int i=1;
//        if(i==1) {
//        		name=name+authentication.getName();
//        		System.out.println("name is login "+name);
//        		
//        }
//        System.out.println("outside if "+name);
//        m.addAttribute("userid",name);
//		return "FrontOfficeHomepage";
}
