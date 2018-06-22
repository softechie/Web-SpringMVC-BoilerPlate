package com.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springmvc.dto.File;

@Controller
@RequestMapping( value = "/file")
public class FileWebController {
	
	
	@RequestMapping(value = "/table", method=RequestMethod.GET)
	public String getFilesTable(Model model) {
		model.addAttribute("file", new File());
		return "filesTable";
		
	}
	
	//maps to form page to add a new file
		@RequestMapping(value = "/add", method = RequestMethod.GET)
		public String getFileForm(Model model){
			model.addAttribute("file", new File());
			return "newFile";
		}
	

}