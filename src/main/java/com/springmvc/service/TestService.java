package com.springmvc.service;

import com.springmvc.dao.EmployeeDao;
import com.springmvc.dto.Employee;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author mbaransln
 * Add the business logic in this class if any and give a call to other services.
 */
@Service
public class TestService {
	
	/**
	 * Once Database is available, uncomment EmployeeDao class reference to get the data from DB. Currently it is retrieving 
	 * the data from the simulator class "TestDataSimulator"
	 */
	//TestDataSimulator employeeDao;
        @Autowired
	EmployeeDao employeeDao;

	/**
	 * Add the business logic if any for get Employees.
	 * @return
	 */
	public List<Employee> getEmployees() {
		return employeeDao.getEmployees();
	}

	public Employee getEmployee(String id) {
		return employeeDao.getEmployee(id);
	}	
	 
	public void saveEmployee(Employee emp) throws SQLException {
	    /* Need to implement this in simulator */  
		employeeDao.saveEmployee(emp);
	}
        
        public void deleteEmployee(String id) throws SQLException {
            employeeDao.deleteEmployee(id);
        }
}
