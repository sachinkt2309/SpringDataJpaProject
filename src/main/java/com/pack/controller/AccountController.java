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

import com.pack.exception.AccountNotFoundException;
import com.pack.model.Account;
import com.pack.service.AccountService;

@Controller
public class AccountController {

	final static Logger logger = LogManager.getLogger(CorporateController.class);

	@Autowired
    AccountService accountService;
	
	@RequestMapping("/addAccountForm")
	 public String add(Model m)  
	 {  
	     m.addAttribute("acc", new  Account());  
	     return "AccountPage/AddAccount";  
	 }
	
	 @RequestMapping(value = "/addAccount", method = RequestMethod.POST) 
	  public String addStudent(Account account) {
		 accountService.saveAccount(account);
		  return "AccountPage/AddAccount-success";
	  }
	 
	 @RequestMapping("/AccountView")    
	    public String viewAcc(Model m){    
		 List<Account> list=accountService.viewAll();
		  m.addAttribute("list",list);
	        return "AccountPage/ViewAccount";    
	    }  
	 
	 @RequestMapping("/accountDeleteView1")    
	    public String deleteAcc(Model m){      
	        return "AccountPage/CloseAccount";    
	    } 
	 
	 @RequestMapping("/DeleteAccount")    
	    public String delete(@RequestParam("accountnumber") long accountnumber,Account account,Model m){  
		 System.out.println(accountnumber);
		 accountService.deleteAccount1(accountnumber);
			 return "AccountPage/CloseAccount-success";   
	    }  
	 @RequestMapping("/accountDeleteView")    
	    public String deleteType(Model m){      
	        return "AccountPage/SearchAccount";    
	    } 
	 
	 @RequestMapping(value = "deleteAccount1", method = RequestMethod.GET)
		public String deleteAcc(@RequestParam("AccountNumber") long accountnumber, Account account, Model m) {
			String page = null;
			try {
				if (accountService.findAccountByAccountNumber(accountnumber).isPresent()) {
					account = accountService.findAccountByAccountNumber(accountnumber).get();
					accountService.deleteAccount1(accountnumber);
					page = "AccountPage/CloseAccount-success";
				} else if (accountService.findAccountByAccountNumber(accountnumber).isEmpty()) {
					System.out.println("Account " + account);
					throw new AccountNotFoundException();

				}
			} catch (AccountNotFoundException e) {
				m.addAttribute("exception", e);
				page = "AccountPage/ExceptionAccount1";

			}

			return page;

		}
	 @RequestMapping("/viewAccountDetails")    
	    public String userAccdetails(@RequestParam("accountNumber")long num,Model m){   
		 m.addAttribute("accnum",num);
	        return "ViewAccounts";    
	    }  
}
