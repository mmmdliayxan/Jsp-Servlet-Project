package com.example.java_servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(value = "/Add")
public class Add extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String jobTitle = request.getParameter("job_title");
        int departmentId = Integer.parseInt(request.getParameter("department_id"));
        Date birthDate= Date.valueOf(request.getParameter("birth_date"));
        int salary = Integer.parseInt(request.getParameter("salary"));

        try(Connection connection = DBConnection.connect();
            PreparedStatement ps = connection.prepareStatement(Query.ADD_EMPLOYEE)) {
            ps.setString(1,firstName);
            ps.setString(2,lastName);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        finally {
            request.getRequestDispatcher("success.jsp").forward(request,response);
        }


    }

}
