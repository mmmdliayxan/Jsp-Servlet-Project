<%@ page import="com.example.java_servlet.DBConnection"%>
<%@ page import="com.example.java_servlet.Query" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.rmi.RemoteException" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 3/7/2024
  Time: 11:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>JSP-SUCCESS</title>
</head>
<style>
    .container {
        display: flex;
        justify-content: space-between;
    }

    .d1 {
        width: auto;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    table {
        border-collapse: collapse;
        width: 100%;
        border: 1px solid black;
    }

    th, td {
        border: 1px solid black;
        text-align: left;
        padding: 16px;
    }
    th{
        font-size: 20px;
    }
    .d2{
        margin-top:10px;
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
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("username")) {
                name = cookie.getValue();
            }
        }
    }
%>

<div class="container">
    <div class="d1" style="font-size: 20px">
        <p style=" margin-left:20px;color: #374bc9">User:<%=name%>
        </p>
    </div>
    <div class="d1">
        <a href="Logout">
            <button type="button" class="btn" style="margin-right:10px;font-size:15px;width: 80px; height: 30px;background-color: #374bc9; color: white">Logout</button>
        </a>
    </div>
</div>
<div class="table_container">
    <table>
        <tr>
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection connection = DBConnection.connect();
                    PreparedStatement ps = connection.prepareStatement(Query.ALL_EMPLOYEE);
                    ResultSet rs = ps.executeQuery();
                    ResultSetMetaData rsm = rs.getMetaData();
                    for (int i = 1; i <= rsm.getColumnCount(); i++) {
            %>
            <th><%=
            rsm.getColumnName(i)
            %>
            </th>
            <%
                }
            %>
            <th>
                Edit
            </th>
            <th>
                Delete
            </th>
            <th>
                Show
            </th>
        </tr>
            <%
                while (rs.next()) {
            %>
           <tr>
            <td><%=rs.getInt("employee_id")%>
            </td>
            <td><%=rs.getString("first_name")%>
            </td>
            <td><%=rs.getString("last_name")%>
            </td>
            <td><%=rs.getString("job_title")%>
            </td>
            <td><%=rs.getInt("department_id")%>
            </td>
            <td><%=rs.getDate("birth_date")%>
            </td>
            <td><%=rs.getInt("salary")%>
            </td>
               <td>
                  <a href="Edit?employee_id=<%=rs.getInt("employee_id")%>&first_name=<%=rs.getString("first_name")%>&last_name=<%=rs.getString("last_name")%>&job_title=<%=rs.getString("job_title")%>&department_id=<%=rs.getInt("department_id")%>&birth_date=<%=rs.getDate("birth_date")%>&salary=<%=rs.getInt("salary")%>"
                     style="color: #374bc9">Edit</a>
               </td>
               <td>
                   <a href="#" onclick="confirmDelete(<%=rs.getInt("employee_id")%>)" style="color: #374bc9">Delete</a>
               </td>
               <td>
                   <a href="Show?employee_id=<%=rs.getInt("employee_id")%>" style="color: #374bc9">Show</a>
               </td>
           </tr>
            <%
                    }
                    connection.close();
                } catch (Exception e) {
                    throw new RemoteException();
                }%>
        <script>
            function confirmDelete(id) {
                var isConfirmed = confirm("confirm delete");

                if (isConfirmed) {
                    window.location.href = "Delete?employee_id=" + id;
                } else {
                    window.location.href = "success .jsp";
                }
            }
        </script>

    </table>
</div>
<div class="d2">
   <a href="add.jsp"><button type="button" class="btn" style="margin-left:10px;font-size:15px;width: 120px; height: 30px;background-color: #374bc9;color: white">Add Employee</button></a>
</div>
</body>
</html>
