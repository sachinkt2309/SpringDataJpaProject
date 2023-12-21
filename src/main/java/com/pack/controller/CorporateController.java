package com.pack.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pack.exception.CorporateNotFoundException;
import com.pack.model.Corporate;
import com.pack.service.CorporateService;

@Controller
public class CorporateController {

	final static Logger logger = LogManager.getLogger(CorporateController.class);
	
	@Autowired
    CorporateService corporateService;
	@RequestMapping("/HomePage")
	public String home(Model m)  
	{  
	    return "index";  
	}
	
	//Add Corporate area
	
	@RequestMapping("/addCorporateForm")
	public String add(Model m)  
	{  
	    m.addAttribute("cor", new  Corporate());  
	    return "CorporatePage/AddCorporate";  
	}
	
	@RequestMapping("/addCorporate") 
	public String addCorporate(@ModelAttribute("cor")Corporate corporate) {
		logger.info("into save");
		corporateService.saveCorporate(corporate);
		  return "CorporatePage/addCorporate-success";
	}
	
	// view Corporate area
	@RequestMapping("/viewCorporateList") 
	  public String viewemp(Model m){ 
		logger.info("into View");
		  List<Corporate> list=corporateService.viewAll();
		  m.addAttribute("list",list);
		  return "CorporatePage/viewCorporate";
		  }
	
	// Modify area 
	
	@RequestMapping("/modifyViewList1")    
	public String modifyview(Model m){  
		logger.info("into modify View");
	    return "CorporatePage/Modifyview";    
	}
	
	@RequestMapping("/modifyCorp")  
	public String edit( @RequestParam("corporateid") int corporateid,Corporate corporate, Model m){    
		logger.info("into find corporate");
		corporate = corporateService.getCorporateById(corporateid).get();
	m.addAttribute("editCorForm",corporate);
		 
		System.out.println("corporateid "+corporateid);
		 
	    return "CorporatePage/ModifyCorporate";    
	} 
	
	@RequestMapping("/modifyViewList")    
	public String modifyusr(Model m){    
	    return "CorporatePage/viewTypeCorp";    
	}
	
	
	
	 @RequestMapping("/editCorp1") 
	  public String edit( @RequestParam("corporateid") int  id,Model m,Corporate corporate)
	  {
	  
		  String page=null;
	 
	  try
	  {
	  if (corporateService.getCorporateById(id).isPresent())
		 {
			  corporate = corporateService.getCorporateById(id).get();
			  m.addAttribute("editCorForm",corporate);
			  page="CorporatePage/ModifyCorporate";
			 
		 }
		 else if (corporateService.getCorporateById(id).isEmpty())
		 {
			 
		  throw new CorporateNotFoundException();
		   
			  }
			}
			  catch(CorporateNotFoundException e)
			  {
				  m.addAttribute("exception",e);
			    	page="CorporatePage/ExceptionCorporate1";
				  
			  }

	  	return page;
	  		}
	 
	 @RequestMapping("/editCorporate") 
	  public String modify(Corporate corporate) {
	   corporateService.saveCorporate(corporate);
	   return "CorporatePage/Modify_success";
	 }
	 
	 //Delete area
	 
	 @RequestMapping("/deleteViewList1")    
	 public String deleteusr(Model m){      
	     return "CorporatePage/deleteview";    
	 } 
	 
	 @RequestMapping("/deleteCorporate")  
	 public String delete( @RequestParam("corporateid") int corporateid,Corporate corporate){    
		 //corporate = corporateService.getCorporateById(corporateid).get();
			corporateService.deleteCorporate(corporateid);
	 		  return "CorporatePage/Delete_success";
	 }
	 
	 @RequestMapping("/deleteViewList")    
	 public String deleteType(Model m){      
	     return "CorporatePage/SelectDeleteType";    
	 } 
	 
	 @RequestMapping(value="/deleteCorp1", method = RequestMethod.POST)
	  public String  delete(@RequestParam("corporateid") int id,Corporate corporate,Model m) 
	  {
			String page = null;
			try {
				if (corporateService.getCorporateById(id).isPresent()) {
					corporate = corporateService.getCorporateById(id).get();
					corporateService.deleteCorporate(id);
					page = "CorporatePage/Delete_success";
				} else if (corporateService.getCorporateById(id).isEmpty()) {
					System.out.println("cor " + corporate);
					throw new CorporateNotFoundException();

				}
			} catch (CorporateNotFoundException e) {
				m.addAttribute("exception", e);
				page = "CorporatePage/ExceptionCorporate2";

			}

			return page;

		} 
}
