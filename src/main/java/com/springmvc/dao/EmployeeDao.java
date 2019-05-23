package com.springmvc.dao;

import com.springmvc.dto.Employee;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;

/**
 * @author mbaransln
 * This is sample DAO class to fetch the employee details. 
 * Once DB is available and tables are created, we can uncomment the below code.
 * 
 */
@Repository
public class EmployeeDao  {
    
    private JdbcTemplate jdbcTemplate;
    
    public EmployeeDao(){
        this.setJdbcTemplate(this.jdbcTemplate());
    }
    
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        
        dataSource.setDriverClassName("org.postgresql.Driver");
        dataSource.setUrl("jdbc:postgresql://localhost:5432/postgres");
        dataSource.setUsername("postgres");
        dataSource.setPassword("root");
        
        return dataSource;
    }
    public final JdbcTemplate jdbcTemplate() {
        JdbcTemplate jdbcT = new JdbcTemplate();
        jdbcT.setDataSource(dataSource());
        return jdbcT;
    }
    public final void setJdbcTemplate(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }
	
	public Employee getEmployee(String id){
                System.out.println("*************************ID: " + id);
		String sql = "Select EMPID, NAME,STATUS,TENURE,PHONE,EMAIL,JOINING_DATE,WORKLOC,CURRENTLOC,HOMELOC,ISRELOCATE,ROLEID,VERTICALID,ACCOUNTID from information_schema.employee where EMPID = ?::integer";
		Employee employee = (Employee) jdbcTemplate.queryForObject(sql, new Object[] { id }, employeeMapper);
                return employee;
	}
	
	public List<Employee> getEmployees(){
		String sql = "Select EMPID, NAME,STATUS,TENURE,PHONE,EMAIL,JOINING_DATE,WORKLOC,CURRENTLOC,HOMELOC,ISRELOCATE,ROLEID,VERTICALID,ACCOUNTID from information_schema.employee";
		return jdbcTemplate.query(sql, employeeMapper);
	}

    private static final RowMapper<Employee> employeeMapper = new RowMapper<Employee>() {
        public Employee mapRow(ResultSet rs, int rowNum) throws SQLException {
        	Employee employee = new Employee();
        	employee.setEmpId(rs.getString("EMPID"));
        	employee.setName(rs.getString("NAME"));
        	employee.setStatus(rs.getString("STATUS"));
        	employee.setTenure(rs.getString("TENURE"));
        	employee.setPhone(rs.getString("PHONE"));
        	employee.setEmail(rs.getString("EMAIL"));
        	employee.setDoj(rs.getString("JOINING_DATE"));
        	employee.setWl(rs.getString("WORKLOC"));
        	employee.setCl(rs.getString("CURRENTLOC"));
        	employee.setHl(rs.getString("HOMELOC"));
        	employee.setRmid(rs.getString("ISRELOCATE"));
        	employee.setRoleid(rs.getString("ROLEID"));
        	employee.setVertid(rs.getString("VERTICALID"));
        	employee.setAcctid(rs.getString("ACCOUNTID"));
            return employee;
        }
    };
	
	
	public void saveEmployee(final Employee employee) throws SQLException {
		String sql = "INSERT into information_schema.employee(EMPID, NAME,STATUS,TENURE,PHONE,EMAIL,JOINING_DATE,WORKLOC,CURRENTLOC,HOMELOC,ISRELOCATE,ROLEID,VERTICALID,ACCOUNTID) VALUES (? ,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,new Object[] { employee.getEmpId(), employee.getName() , employee.getStatus(),employee.getTenure(),employee.getPhone(),employee.getEmail(),employee.getDoj(),employee.getWl(),employee.getCl(),employee.getHl(),employee.getRmid(),employee.getRoleid(),employee.getVertid(),employee.getAcctid() });
    }
        
        public void deleteEmployee(final String id) throws SQLException {
            System.out.println("Deleting employee: " + id);
            String sql = "DELETE FROM information_schema.employee WHERE EMPID = ?";
            jdbcTemplate.update(sql, Integer.valueOf(id));
        }
}