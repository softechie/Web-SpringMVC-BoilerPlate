package com.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/** Controller to handle the URL requests and map them to Get/Post Employee pages
 * @author aprieger */
@Controller
@RequestMapping(value = "/job")
public class JobWebController {
	
	/** Maps the GET request to /employee/map to get the page for the dependency tree of jobs
	 * @return jobsMap the name of the JSP page that contains the Jobs Map */
    @RequestMapping(value = "/map", method = RequestMethod.GET)
    public String getJobsMap() {
        return "jobsMap";
    }
}