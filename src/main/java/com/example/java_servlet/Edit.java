package com.example.java_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

@WebServlet(value = "/Edit")
public class Edit extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int employee_id = Integer.parseInt(request.getParameter("employee_id"));
        Employee updateE = new Employee();
        String name = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String jobTitle = request.getParameter("job_title");
        int departmentId = Integer.parseInt(request.getParameter("department_id"));
        Date birthDate = Date.valueOf(request.getParameter("birth_date"));
        int salary = Integer.parseInt(request.getParameter("salary"));

        updateE.setEmployeeId(employee_id);
        updateE.setFirstName(name);
        updateE.setLastName(lastName);
        updateE.setJobTitle(jobTitle);
        updateE.setDepartmentId(departmentId);
        updateE.setBirthDate(birthDate);
        updateE.setSalary(salary);
        HttpSession session1 = request.getSession();
        session1.setAttribute("updateE",updateE);

        response.sendRedirect("edit.jsp");
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPut(req,resp);
    }

    public void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("employee_id"));
        Employee updateE = new Employee();
        updateE.setEmployeeId(id);
        updateE.setFirstName(request.getParameter("first_name"));
        updateE.setLastName(request.getParameter("last_name"));
        updateE.setJobTitle(request.getParameter("job_title"));
        updateE.setDepartmentId(Integer.parseInt(request.getParameter("department_id")));
        updateE.setBirthDate(Date.valueOf(request.getParameter("birth_date")));
        updateE.setSalary(Integer.parseInt(request.getParameter("salary")));
     try {
         Class.forName("com.mysql.jdbc.Driver");
         Connection connection = DBConnection.connect();
         PreparedStatement ps = connection.prepareStatement(Query.UPDATE_EMPLOYEE);
         ps.setString(1, updateE.getFirstName());
         ps.setString(2, updateE.getLastName());
         ps.setString(3, updateE.getJobTitle());
         ps.setInt(4, updateE.getDepartmentId());
         ps.setDate(5, updateE.getBirthDate());
         ps.setInt(6, updateE.getSalary());
         ps.setInt(7, updateE.getEmployeeId());
         ps.executeUpdate();
     } catch (Exception e) {
         e.printStackTrace();
     }
     finally {
         request.getRequestDispatcher("success.jsp").forward(request,response);
     }
 }
}

