<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Exam - Login</title>
</head>

<body>

    <h2>Online Examination System</h2>
    <h3>Student Login</h3>

    <%
        String error = request.getParameter("error");

        if (error != null) {
    %>
        <p style="color:red;"><%= error %></p>
    <%
        }
    %>

    <form action="login" method="post">

        <label>Student ID:</label>
        <input type="number" name="studentId" required>
        <br><br>

        <label>Password:</label>
        <input type="password" name="password" required>
        <br><br>

        <input type="submit" value="Login">

    </form>

</body>
</html>