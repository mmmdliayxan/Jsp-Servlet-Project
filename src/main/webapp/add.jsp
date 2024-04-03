<%@ page import="com.example.java_servlet.Employee" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 3/11/2024
  Time: 5:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ADD-EMPLOYEE</title>

</head>
<style>
    .container{
        display: flex;
        justify-content: space-between;
    }
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        padding: 20px;
    }

    h1 {
        text-align: center;
    }

    form {
        width: 300px;
        margin: 0 auto;
        background-color: white;
        padding: 20px;
        border-radius: 5px;
    }

    label {
        display: block;
        margin-top: 10px;
        font-weight: bold;
    }

    input[type="text"] {
        width: 95%;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }

    button {
        margin-top: 10px;
        padding: 8px 16px;
        border: none;
        background-color: #374bc9;
        color: white;
        cursor: pointer;
    }

    button:hover {
        transform: scale(.96);
        cursor: pointer;
    }

</style>
<body>

<%
    HttpSession session1 = request.getSession(false);
    Boolean login = (Boolean) session1.getAttribute("login");
    if(login) {
        String name="";
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("username")) {
                name = cookie.getValue();
            }
        }
%>
<div class="container">
    <div>
    </div>
    <div>
        <p style="color: #374bc9">User:<%=name%></p>
    </div>
    <div>
        <a href="Logout">
            <button type="button" class="btn" style="font-size:15px;width: 80px; height: 30px;background-color: #374bc9; color: white">Logout</button>
        </a>
    </div>
</div>
<form action="Add" method="post">

    <label >ID:</label>
    <input type="hidden" name="employee_id" >

    <label >Name:</label>
    <input type="text" name="first_name" >

    <label >Surname:</label>
    <input type="text"  name="last_name" >

    <label >Job_Title:</label>
    <input type="text" name="job_title" >

    <label >Department_id:</label>
    <input type="text"  name="department_id" >

    <label >Birth_date:</label>
    <input type="text"  name="birth_date" >

    <label >Salary:</label>
    <input type="text"  name="salary" >
    <%
        }
    %>
    <button type="submit">Save</button>

</form>

</body>
</html>
