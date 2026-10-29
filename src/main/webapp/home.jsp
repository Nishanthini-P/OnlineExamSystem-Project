<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String studentName = (String) session.getAttribute("studentName");
    Integer studentId = (Integer) session.getAttribute("studentId");
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Student Dashboard</title>

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
            width: 80%;
            margin: 40px auto;
        }

        .welcome {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .exam-box {
            background: white;
            margin-top: 25px;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .start-btn {
            display: inline-block;
            background: #2878f0;
            color: white;
            padding: 12px 25px;
            text-decoration: none;
            border-radius: 6px;
            margin-top: 15px;
        }

        .start-btn:hover {
            background: #155dcc;
        }

    </style>

</head>

<body>

    <div class="header">
        <h1>Online Examination System</h1>
    </div>

    <div class="container">

        <div class="welcome">

            <h2>Welcome, <%= studentName %>!</h2>

            <p>
                Student ID:
                <strong><%= studentId %></strong>
            </p>

        </div>


        <div class="exam-box">

            <h2>Java Programming Online Examination</h2>

            <p>
                <strong>Subject:</strong>
                Java Programming
            </p>

            <p>
                <strong>Total Questions:</strong>
                15
            </p>

            <p>
                <strong>Total Marks:</strong>
                15
            </p>

            <p>
                <strong>Duration:</strong>
                30 Minutes
            </p>

            <p>
                <strong>Exam Type:</strong>
                Multiple Choice Questions
            </p>

            <a href="exam.jsp" class="start-btn">
                Start Examination
            </a>

        </div>

    </div>

</body>
</html>