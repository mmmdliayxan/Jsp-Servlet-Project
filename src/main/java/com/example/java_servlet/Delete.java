package com.example.java_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(value = "/Delete")
public class Delete extends HttpServlet {

    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        doDelete(request,response);
    }

    public void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        int employee_id= Integer.parseInt(request.getParameter("employee_id"));

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DBConnection.connect();
            PreparedStatement ps = connection.prepareStatement(Query.DELETE_EMPLOYEE);
            ps.setInt(1,employee_id);
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            request.getRequestDispatcher("success.jsp").forward(request, response);
        }

    }
}
