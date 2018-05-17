package com.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springmvc.dto.Employee;

/** Controller to handle the URL requests and map them to Get/Post Employee pages
 * @author aprieger */
@Controller
@RequestMapping( value = "/employee")
public class EmployeeWebController {
	
	/** Maps the GET request to /employee/table to get the page for the Table of Employees
	 * @param model the model of the window document to add attributes to
	 * @return employeesTable the name of the JSP page that contains the Employees Table */
	@RequestMapping(value = "/table", method = RequestMethod.GET)
	public String getEmployeesTable(Model model){
		model.addAttribute("employee", new Employee());
		return "employeesTable";
	}
	
	/** Maps the POST request to /employee/table to get the page for a single employee
	 * @param model the Model of the window document to add attributes to
	 * @param result the BindingResult that alerts if there are any errors in the request
	 * @return employeesTable the name of the JSP page that contains the Employees Table */
	@RequestMapping(value = "/table", method = RequestMethod.POST)
    public String postEmployeeDetails(@ModelAttribute("employee") Employee employee, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "employeesTable";
        }
        else {
	        model.addAttribute("empId", employee.getEmpId());
	        return "employeeDetails";
        }
    }
	
	/** Maps the GET request to /employee/map to get the page for the subway flow of employees
	 * @return employeesMap the name of the JSP page that contains the Employees Map */
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String getEmployeesMap(){
		return "employeesMap";
	}
}