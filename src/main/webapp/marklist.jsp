<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>

<%
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String studentName =
            (String) session.getAttribute("studentName");

    Integer studentId =
            (Integer) session.getAttribute("studentId");

    List<String[]> markList =
            (List<String[]>) request.getAttribute("markList");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Student Mark List</title>

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
    width: 90%;
    margin: 40px auto;
}

.card {
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

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: #243447;
    color: white;
    padding: 12px;
}

td {
    border: 1px solid #ddd;
    padding: 12px;
    text-align: center;
}

.pass {
    color: green;
    font-weight: bold;
}

.fail {
    color: red;
    font-weight: bold;
}

.no-data {
    text-align: center;
    padding: 30px;
    color: #666;
}

.back-btn {
    display: inline-block;
    margin-top: 25px;
    padding: 12px 20px;
    background: #2878f0;
    color: white;
    text-decoration: none;
    border-radius: 6px;
}

.back-btn:hover {
    background: #155dcc;
}

</style>

</head>

<body>

<div class="header">

    <h1>Online Examination System</h1>

</div>


<div class="container">

    <div class="card">

        <h2 style="text-align:center;">
            Student Mark List
        </h2>


        <div class="student-info">

            <p>
                <strong>Student ID:</strong>
                <%= studentId %>
            </p>

            <p>
                <strong>Student Name:</strong>
                <%= studentName %>
            </p>

        </div>


        <table>

            <tr>

                <th>Exam</th>

                <th>Subject</th>

                <th>Marks</th>

                <th>Total</th>

                <th>Percentage</th>

                <th>Grade</th>

                <th>Status</th>

                <th>Date</th>

            </tr>


            <%
                if (markList != null && !markList.isEmpty()) {

                    for (String[] row : markList) {
            %>

            <tr>

                <td>
                    <%= row[0] %>
                </td>

                <td>
                    <%= row[1] %>
                </td>

                <td>
                    <%= row[2] %>
                </td>

                <td>
                    <%= row[3] %>
                </td>

                <td>
                    <%= row[4] %>%
                </td>

                <td>
                    <strong>
                        <%= row[5] %>
                    </strong>
                </td>

                <td>

                    <span class="<%= 
                        "PASS".equals(row[6])
                        ? "pass"
                        : "fail"
                    %>">

                        <%= row[6] %>

                    </span>

                </td>

                <td>
                    <%= row[7] %>
                </td>

            </tr>

            <%
                    }

                } else {
            %>

            <tr>

                <td colspan="8" class="no-data">

                    No examination results available.

                </td>

            </tr>

            <%
                }
            %>

        </table>


        <div style="text-align:center;">

            <a href="home.jsp" class="back-btn">
                Back to Home
            </a>

        </div>

    </div>

</div>

</body>

</html>