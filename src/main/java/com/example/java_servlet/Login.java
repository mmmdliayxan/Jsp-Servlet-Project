package com.example.java_servlet;

import java.io.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "loginUser", value = "/Login")
public class Login extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
       response.setContentType("text/html");
       PrintWriter out = response.getWriter();

       String username= request.getParameter("username");
       String password= request.getParameter("password");

        try {
            if(LoginCheck.login(username,password)){
               HttpSession session = request.getSession();
               session.setAttribute("login",true);

               Cookie cookie = new Cookie("username",username);
               response.addCookie(cookie);
               doGet(request,response);
            }
            else{
                out.println("<h1 style=\"font-size:15px;color:white\">"+"Password or Username is not correct!"+"</h1>");
                RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
                rs.include(request,response);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if(session!=null){
            System.out.println("Login is successfully completed");
            response.sendRedirect("success.jsp");
        }
        else{
            response.sendRedirect("index.jsp");
        }

    }

}