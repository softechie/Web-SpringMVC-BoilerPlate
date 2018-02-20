package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springmvc.dto.Employee;

/**
 * @author sugyani
 * Controller class to resolve mapped urls
 *
 */
@Controller
//@RequestMapping("/hello")
public class HelloController {

	@RequestMapping(value="/hello", method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {

		model.addAttribute("message", "Spring MVC Hello World");
		return "hello";

	}
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public String allEmployees(Model model){
		model.addAttribute("employee", new Employee());
		return "allEmployees";
	}
	@RequestMapping(value = "/all", method = RequestMethod.POST)
    public String postEmployeeDetails(@ModelAttribute("employee") Employee employee, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            System.out.println("----There was an error");
            return "redirect:/all";
        }
        else {
        model.addAttribute("empID", employee.getEmpId());
        return "redirect:/details";
        }
    }
	@RequestMapping(value = "/details", method = RequestMethod.GET)
	public String getGmployeeDetails(Model model){
		return "employeeDetails";
	}
	
}