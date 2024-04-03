<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.java_servlet.DBConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.java_servlet.Query" %>
<%@ page import="com.example.java_servlet.Employee" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 3/11/2024
  Time: 12:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
.container{
display: flex;
justify-content: space-between;
}
.btn-container{
    display: flex;
    justify-content: center;
}
.container2{
width: 400px;
margin: 50px auto;
padding: 20px;
border: 1px solid #ccc;
border-radius: 5px;
background-color: #fff;
}
.row{
display: flex;
justify-content: space-between;
align-items: center;
margin-bottom: 10px;
}
.row label {
font-weight: bold;
width: 120px;
}

.row span{
flex-grow: 1;
padding: 5px;
border: 1px solid #ccc;
border-radius: 3px;
}
button {
    margin-top: 20px;
    margin-right: 10px;
    padding: 8px 16px;
    border: none;
    background-color: #374bc9;
    color: white;
    cursor: pointer;
}
.btn:hover{
    transform: scale(.96);
    cursor: pointer;
}

</style>
<body>

<%
    HttpSession session1 = request.getSession();
    Boolean login = (Boolean) session1.getAttribute("login");
    String name = null;
    if (login) {
        Employee employee = (Employee)session1.getAttribute("employee");
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
    <div class="container2">
        <div class="row">
            <label >Id: </label>
            <span><%=employee.getEmployeeId()%></span>
        </div>
        <div class="row">
            <label >Name: </label>
            <span><%=employee.getFirstName()%></span>
        </div>
        <div class="row">
            <label >Surname: </label>
            <span><%=employee.getLastName()%></span>
        </div>
        <div class="row">
            <label >Job_title: </label>
            <span><%=employee.getJobTitle()%></span>
        </div>
        <div class="row">
            <label >Department_id: </label>
            <span><%=employee.getDepartmentId()%></span>
        </div>
        <div class="row">
            <label >Birth_date: </label>
            <span><%=employee.getBirthDate()%></span>
        </div>
        <div class="row">
            <label >Salary: </label>
            <span><%=employee.getSalary()%></span>
        </div>
    </div>
<%
    }
    else{
        response.sendRedirect("index.jsp");
    }
%>
<div class="btn-container">
    <div>
   <a href="success.jsp"><button class="btn" style="font-size:15px;width: 80px; height: 30px;background-color: #374bc9; color: white">Cancel</button></a>
    </div>
</div>
</body>
</html>
