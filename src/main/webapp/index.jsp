<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Login</title>
</head>
<style>
    body{
        background: url("https://static.vecteezy.com/system/resources/previews/024/483/708/non_2x/blurred-office-workspace-in-the-evening-interior-ai-generated-free-photo.jpg") no-repeat;
        background-size: cover;
    }
    .container{
        width: 350px;
        top: 45%;
        left: 50%;
        transform: translate(-50%,-50%);
        position: absolute;
        color: #fff;
    }
    .container h1{
        font-size: 40px;
        text-align: center;
        text-transform: uppercase;
        margin: 40px 0;
    }
    .container p{
        font-size: 20px;
        margin: 15px 0;
    }
    .container input{
        font-size: 16px;
        width: 95%;
        padding: 15px 10px;
        border: 0;
        outline: none;
        border-radius: 5px;
    }
    .container button{
        font-size: 18px;
        font-weight: bold;
        margin: 20px 0;
        padding: 10px 15px;
        width: 100%;
        border-radius: 5px;
        border: 0;
    }
    .container a{
        color: white;
    }
    .a1:hover{
        color: #374bc9;
    }
    .b:hover{
        transform: scale(.96);
        cursor: pointer;
    }

</style>
<body>
<div class="container">
    <h1>Login Form</h1>
    <form action="${pageContext.request.contextPath}/Login" method="post">
        <p>Username</p>
        <input type="text" name="username" placeholder="Username">
        <p>Password</p>
        <input type="password" name="password" placeholder="Password">
        <button type="submit" class="b">Login</button>
    </form>
    <p class="p1">Don't have an account? <a class="a1" href="register.jsp">Sign up</a></p>

</div>
</body>
</html>