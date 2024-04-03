
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSP-Register</title>
</head>
<style>
.container{
width: 350px;
top: 45%;
left: 50%;
transform: translate(-50%,-50%);
position: absolute;
color: #fff;
}
body{
    background: url("https://cdn.pixabay.com/photo/2015/01/08/18/25/desk-593327_1280.jpg") no-repeat;
    background-size: cover;
}
.container h1{
font-size: 40px;
text-align: center;
text-transform: uppercase;
margin: 40px 0;
}
.container input{
    font-size: 16px;
    width: 100%;
    padding: 15px 10px;
    border: 2px #6f6b6b;
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
.l{
    font-size: 20px;
}
.btn{
    height: 40px;
    width: 100%;
    font-size: 20px;
    border: none;
    border-radius: 10px;
    background-color: #374bc9;
    color: #f1efef;
    margin-bottom: 20px;
}
.btn:hover{
    background-color: white;
    color: #374bc9;
    transform: scale(.96);
    transition: 2s;
    cursor: pointer;

}
</style>
<body>
    <div class="container">
        <h1>Registration Form</h1>
        <form action="Register" method="post">
            <label class="l">First Name</label>
            <input type="text" name="firstName" placeholder="First Name">
            <label class="l">Last Name</label>
            <input type="text" name="lastName" placeholder="Last Name">
            <label class="l">Phone Number</label>
            <input type="text" name="phoneNumber" placeholder="Phone Number">
            <label class="l">Age</label>
            <input type="text" name="age" placeholder="Your age">
            <label class="l">Email Address</label>
            <input type="email" name="email" placeholder="Your Email">
            <label class="l">Password</label>
            <input type="password" name="password" placeholder="New Password">
            <button type="submit" class="btn">Sign Up</button>
        </form>
    </div>
</body>
</html>
