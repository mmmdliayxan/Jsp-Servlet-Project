package com.example.java_servlet;

public interface Query {
 String FIND_USER= "Select * from hr.users where first_name=? and password=?";
 String INSERT_USER="insert into hr.users (first_name, last_name, phone_number, age, email, password) values (?,?,?,?,?,?)";
 String ALL_EMPLOYEE = "Select * from hr.employee";
 String SELECTED_EMPLOYEE="Select * from hr.employee where employee_id=?";
 String DELETE_EMPLOYEE="Delete from hr.employee where employee_id=?";
 String UPDATE_EMPLOYEE="Update hr.employee " +
         " set first_name=?,last_name=?,job_title=?,department_id=?,birth_date=?,salary=? " +
         " where employee_id=?";

 String ADD_EMPLOYEE="insert into hr.employee (first_name,last_name,job_title,department_id,birth_date,salary) value(?,?,?,?,?,?)";
}
