package com.example.java_servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(value = "/Show")
public class Show extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out= response.getWriter();

        int employee_id= Integer.parseInt(request.getParameter("employee_id"));

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DBConnection.connect();
            PreparedStatement ps = connection.prepareStatement(Query.SELECTED_EMPLOYEE);
            ps.setInt(1,employee_id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Employee employee = new Employee();
                employee.setEmployeeId(rs.getInt("employee_id"));
                employee.setFirstName(rs.getString("first_name"));
                employee.setLastName(rs.getString("last_name"));
                employee.setJobTitle(rs.getString("job_title"));
                employee.setDepartmentId(rs.getInt("department_id"));
                employee.setBirthDate(rs.getDate("birth_date"));
                employee.setSalary(rs.getInt("salary"));
                HttpSession session1 = request.getSession();
                session1.setAttribute("employee",employee);
                response.sendRedirect("show.jsp");
            }
        }catch (Exception e){
            throw new RuntimeException();
        }

    }
}
