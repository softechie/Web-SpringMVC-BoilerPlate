package com.springmvc.controller;

import com.springmvc.dao.EmployeeDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springmvc.dto.Employee;
import java.sql.SQLException;
import java.util.List;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

/** Controller to handle the URL requests and map them to Get/Post Employee pages
 * @author aprieger */
@Controller
@RequestMapping( value = "/employee")
public class EmployeeWebController {
    
        EmployeeDao empDao;
	
	private static final Logger log = LoggerFactory.getLogger(EmployeeWebController.class);
	
	/** Maps the GET request to /employee/table to get the page for the Table of Employees
	 * @param model the model of the window document to add attributes to
	 * @return employeesTable the name of the JSP page that contains the Employees Table */
	@RequestMapping(value = "/table", method = RequestMethod.GET)
	public String getEmployeesTable(Model model){
                System.out.println("****************Inside GET request****************");
                empDao = new EmployeeDao();
                List<Employee> empList = empDao.getEmployees();
		model.addAttribute("empList", empList);
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
                empDao = new EmployeeDao();
                Employee emp = empDao.getEmployee(employee.getEmpId());
	        model.addAttribute("empId", emp.getEmpId());
                model.addAttribute("empName", emp.getName());
                model.addAttribute("empTenure", emp.getTenure());
                model.addAttribute("empStatus", emp.getStatus());
                model.addAttribute("empPhone", emp.getPhone());
                model.addAttribute("empEmail", emp.getEmail());
                model.addAttribute("empAcctId", emp.getAcctid());
	        return "employeeDetails";
        }
    }
	
	/** Maps the GET request to /employee/map to get the page for the subway flow of employees
	 * @return employeesMap the name of the JSP page that contains the Employees Map */
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String getEmployeesMap(){
		return "employeesMap";
	}
	
	//maps to form page to add a new employee
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String getEmployeeForm(Model model){
		model.addAttribute("employee", new Employee());
		log.info("Navigating to new employee form...");
		return "newEmployee";
	}
	
	//prints the data entered in the form
	@RequestMapping(value = "/add", method = RequestMethod.POST)
    public String postNewEmployeeDetails(@ModelAttribute("employee") Employee employee, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "newEmployee";
        }
        else {
	        model.addAttribute("employee", employee);
	        return "printNewEmployee";
        }
    }
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteEmployee(@RequestParam("id")String id, @ModelAttribute("employee") Employee employee, BindingResult result, Model model) throws SQLException{
        empDao = new EmployeeDao();
        System.out.println("*******Deleting Record: " + id);
        empDao.deleteEmployee(id);
        List<Employee> empList = empDao.getEmployees();
        model.addAttribute("empList", empList);
        model.addAttribute("employee", new Employee());
        return "employeesTable";
    }
}