package com.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springmvc.dto.Job;

@Controller
@RequestMapping( value = "/job")
public class JobWebController {
	@RequestMapping(value = "/table", method = RequestMethod.GET)
	public String getJobsTable(Model model){
		model.addAttribute("job", new Job());
		return "jobsTable";
	}
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String getJobsOrder(Model model){
		model.addAttribute("job", new Job());
		return "jobsOrder";
	}
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String getJobsMap(){
		return "jobsMap";
	}
}