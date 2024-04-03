package com.example.java_servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;



@WebServlet(name="registerUser" ,value="/Register")
public class Register extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out= response.getWriter();
        String firstName= request.getParameter("firstName");
        String lastName= request.getParameter("lastName");
        String phoneNumber= request.getParameter("phoneNumber");
        int age= Integer.parseInt(request.getParameter("age"));
        String email= request.getParameter("email");
        String password= request.getParameter("password");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DBConnection.connect();
            PreparedStatement ps = connection.prepareStatement(Query.INSERT_USER);
            ps.setString(1,firstName);
            ps.setString(2,lastName);
            ps.setString(3,phoneNumber);
            ps.setInt(4,age);
            ps.setString(5,email);
            ps.setString(6,password);
           int i= ps.executeUpdate();
           if(i>0){
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
            rd.forward(request,response);}
        } catch (Exception e) {
            out.println("You don't sign up");
            RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
            rd.forward(request,response);
            e.printStackTrace();
        }
    }

}
