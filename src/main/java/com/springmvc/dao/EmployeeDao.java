package com.springmvc.dao;

import com.springmvc.dto.Employee;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;

/**
 * @author andrew diamond 
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
       
            try {
                PreparedStatement ps = jdbcTemplate.getDataSource().getConnection().prepareStatement("select * from information_schema.employee where empid = ?");
                ps.setInt(1, Integer.parseInt(id));
                
                Employee e = new Employee();
                
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    e.setEmpId(rs.getString("EMPID"));
                    e.setName(rs.getString("NAME"));
                    e.setStatus(rs.getString("STATUS"));
                    e.setTenure(rs.getString("TENURE"));
                    e.setPhone(rs.getString("PHONE"));
                    e.setEmail(rs.getString("EMAIL"));
                    e.setDoj(rs.getString("JOINING_DATE"));
                    e.setWl(rs.getString("WORKLOC"));
                    e.setCl(rs.getString("CURRENTLOC"));
                    e.setHl(rs.getString("HOMELOC"));
                    e.setRmid(rs.getString("ISRELOCATE"));
                    e.setRoleid(rs.getString("ROLEID"));
                    e.setVertid(rs.getString("VERTICALID"));
                    e.setAcctid(rs.getString("ACCOUNTID"));
                }
                return e;
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
            }
            Employee e2 = new Employee();
            return e2;
	}
	
	public List<Employee> getEmployees(){
            try {
                PreparedStatement ps = jdbcTemplate.getDataSource().getConnection().prepareStatement("select * from information_schema.employee");
                List<Employee> employees = new ArrayList();
                
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    Employee e = new Employee();
                    e.setEmpId(rs.getString("EMPID"));
                    e.setName(rs.getString("NAME"));
                    e.setStatus(rs.getString("STATUS"));
                    e.setTenure(rs.getString("TENURE"));
                    e.setPhone(rs.getString("PHONE"));
                    e.setEmail(rs.getString("EMAIL"));
                    e.setDoj(rs.getString("JOINING_DATE"));
                    e.setWl(rs.getString("WORKLOC"));
                    e.setCl(rs.getString("CURRENTLOC"));
                    e.setHl(rs.getString("HOMELOC"));
                    e.setRmid(rs.getString("ISRELOCATE"));
                    e.setRoleid(rs.getString("ROLEID"));
                    e.setVertid(rs.getString("VERTICALID"));
                    e.setAcctid(rs.getString("ACCOUNTID"));
                    employees.add(e);
                }
                
                System.out.println(rs.toString());
                return employees;
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
            }
            List<Employee> employees2 = new ArrayList();
            return employees2;
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
             SimpleJdbcCall c = new SimpleJdbcCall(jdbcTemplate).withProcedureName("deleteEmployee");
            SqlParameterSource in = new MapSqlParameterSource().addValue("id",id);
            c.execute(in);
            //String sql = "DELETE FROM information_schema.employee WHERE EMPID = ?::integer";
            //jdbcTemplate.update(sql, Integer.valueOf(id));
        }
}