<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // Check whether student is logged in
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Get student details from session
    String studentName =
            (String) session.getAttribute("studentName");

    Integer studentId =
            (Integer) session.getAttribute("studentId");

    // Get result details from session
    Integer marks =
            (Integer) session.getAttribute("marks");

    Integer totalMarks =
            (Integer) session.getAttribute("totalMarks");

    Double percentage =
            (Double) session.getAttribute("percentage");

    String grade =
            (String) session.getAttribute("grade");

    String status =
            (String) session.getAttribute("status");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Exam Result</title>

<style>

body {
    font-family: Arial, sans-serif;
    background: #f4f6f8;
    margin: 0;
}

.header {
    background: #243447;
    color: white;
    padding: 20px;
    text-align: center;
}

.container {
    width: 70%;
    margin: 40px auto;
}

.result-card {
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.student-info {
    background: #f1f5f9;
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 25px;
}

.result-table {
    width: 100%;
    border-collapse: collapse;
}

.result-table th,
.result-table td {
    border: 1px solid #ddd;
    padding: 15px;
    text-align: center;
}

.result-table th {
    background: #243447;
    color: white;
}

.result-table td {
    font-size: 18px;
}

.status {
    font-size: 22px;
    font-weight: bold;
    text-align: center;
    margin: 25px;
}

.pass {
    color: green;
}

.fail {
    color: red;
}

.buttons {
    text-align: center;
    margin-top: 25px;
}

.btn {
    display: inline-block;
    padding: 12px 20px;
    margin: 5px;
    background: #2878f0;
    color: white;
    text-decoration: none;
    border-radius: 6px;
}

.btn:hover {
    background: #155dcc;
}

</style>

</head>

<body>

<div class="header">

    <h1>Online Examination System</h1>

</div>


<div class="container">

<div class="result-card">

    <h2 style="text-align:center;">
        Examination Result
    </h2>


    <!-- Student Information -->

    <div class="student-info">

        <p>
            <strong>Student ID:</strong>
            <%= studentId %>
        </p>

        <p>
            <strong>Student Name:</strong>
            <%= studentName %>
        </p>

        <p>
            <strong>Subject:</strong>
            Java Programming
        </p>

    </div>


    <!-- Result Table -->

    <table class="result-table">

        <tr>
            <th>Result Details</th>
            <th>Value</th>
        </tr>

        <tr>
            <td>Marks Obtained</td>

            <td>
                <%= marks %> / <%= totalMarks %>
            </td>
        </tr>

        <tr>
            <td>Percentage</td>

            <td>
                <%= String.format("%.2f", percentage) %>%
            </td>
        </tr>

        <tr>
            <td>Grade</td>

            <td>
                <strong><%= grade %></strong>
            </td>
        </tr>

    </table>


    <!-- Pass / Fail -->

    <div class="status <%= "PASS".equals(status) ? "pass" : "fail" %>">

        Result: <%= status %>

    </div>


    <!-- Buttons -->

    <div class="buttons">

        <a href="home.jsp" class="btn">
            Back to Home
        </a>

        <a href="marklist" class="btn">
            View Mark List
        </a>

    </div>

</div>

</div>

</body>

</html>