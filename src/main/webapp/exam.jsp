<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Java Programming Examination</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
        }

        .header {
            background: #243447;
            color: white;
            padding: 18px;
            text-align: center;
        }

        .exam-info {
            background: white;
            width: 85%;
            margin: 20px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .timer {
            position: fixed;
            right: 25px;
            top: 20px;
            background: #e74c3c;
            color: white;
            padding: 12px 18px;
            border-radius: 8px;
            font-weight: bold;
        }

        .question {
            background: white;
            width: 85%;
            margin: 20px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .question h3 {
            margin-top: 0;
        }

        .option {
            display: block;
            margin: 12px 0;
            padding: 8px;
        }

        .submit-btn {
            display: block;
            margin: 30px auto;
            background: #2878f0;
            color: white;
            border: none;
            padding: 14px 35px;
            font-size: 16px;
            border-radius: 7px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background: #155dcc;
        }

    </style>

</head>

<body>

<div class="header">

    <h1>Java Programming Online Examination</h1>

</div>

<div class="timer">

    Time Left:
    <span id="timer">30:00</span>

</div>


<div class="exam-info">

    <h2>Exam Instructions</h2>

    <p>Subject: Java Programming</p>

    <p>Total Questions: 15</p>

    <p>Total Marks: 15</p>

    <p>Duration: 30 Minutes</p>

    <p>Each question carries 1 mark.</p>

</div>


<form action="exam" method="post">


<!-- Question 1 -->

<div class="question">

    <h3>1. Which keyword is used to inherit a class in Java?</h3>

    <label class="option">
        <input type="radio" name="q1" value="A" required>
        extends
    </label>

    <label class="option">
        <input type="radio" name="q1" value="B">
        implements
    </label>

    <label class="option">
        <input type="radio" name="q1" value="C">
        inherits
    </label>

    <label class="option">
        <input type="radio" name="q1" value="D">
        super
    </label>

</div>


<!-- Question 2 -->

<div class="question">

    <h3>2. Which method is the entry point of a Java program?</h3>

    <label class="option">
        <input type="radio" name="q2" value="A" required>
        start()
    </label>

    <label class="option">
        <input type="radio" name="q2" value="B">
        run()
    </label>

    <label class="option">
        <input type="radio" name="q2" value="C">
        main()
    </label>

    <label class="option">
        <input type="radio" name="q2" value="D">
        execute()
    </label>

</div>


<!-- Question 3 -->

<div class="question">

    <h3>3. Which of the following is used for database connectivity in Java?</h3>

    <label class="option">
        <input type="radio" name="q3" value="A" required>
        JDBC
    </label>

    <label class="option">
        <input type="radio" name="q3" value="B">
        HTML
    </label>

    <label class="option">
        <input type="radio" name="q3" value="C">
        CSS
    </label>

    <label class="option">
        <input type="radio" name="q3" value="D">
        XML
    </label>

</div>


<!-- Question 4 -->

<div class="question">

    <h3>4. Which collection does not allow duplicate elements?</h3>

    <label class="option">
        <input type="radio" name="q4" value="A" required>
        List
    </label>

    <label class="option">
        <input type="radio" name="q4" value="B">
        Set
    </label>

    <label class="option">
        <input type="radio" name="q4" value="C">
        ArrayList
    </label>

    <label class="option">
        <input type="radio" name="q4" value="D">
        Vector
    </label>

</div>


<!-- Question 5 -->

<div class="question">

    <h3>5. Which keyword is used to create an object in Java?</h3>

    <label class="option">
        <input type="radio" name="q5" value="A" required>
        class
    </label>

    <label class="option">
        <input type="radio" name="q5" value="B">
        object
    </label>

    <label class="option">
        <input type="radio" name="q5" value="C">
        new
    </label>

    <label class="option">
        <input type="radio" name="q5" value="D">
        create
    </label>

</div>


<!-- Question 6 -->

<div class="question">

    <h3>6. Which keyword is used to define a class in Java?</h3>

    <label class="option">
        <input type="radio" name="q6" value="A" required>
        class
    </label>

    <label class="option">
        <input type="radio" name="q6" value="B">
        define
    </label>

    <label class="option">
        <input type="radio" name="q6" value="C">
        struct
    </label>

    <label class="option">
        <input type="radio" name="q6" value="D">
        object
    </label>

</div>


<!-- Question 7 -->

<div class="question">

    <h3>7. Which data type is used to store true or false values?</h3>

    <label class="option">
        <input type="radio" name="q7" value="A" required>
        int
    </label>

    <label class="option">
        <input type="radio" name="q7" value="B">
        char
    </label>

    <label class="option">
        <input type="radio" name="q7" value="C">
        boolean
    </label>

    <label class="option">
        <input type="radio" name="q7" value="D">
        float
    </label>

</div>


<!-- Question 8 -->

<div class="question">

    <h3>8. Which symbol is used to end a statement in Java?</h3>

    <label class="option">
        <input type="radio" name="q8" value="A" required>
        .
    </label>

    <label class="option">
        <input type="radio" name="q8" value="B">
        :
    </label>

    <label class="option">
        <input type="radio" name="q8" value="C">
        ;
    </label>

    <label class="option">
        <input type="radio" name="q8" value="D">
        ,
    </label>

</div>


<!-- Question 9 -->

<div class="question">

    <h3>9. Which concept allows the same method name with different parameters?</h3>

    <label class="option">
        <input type="radio" name="q9" value="A" required>
        Inheritance
    </label>

    <label class="option">
        <input type="radio" name="q9" value="B">
        Encapsulation
    </label>

    <label class="option">
        <input type="radio" name="q9" value="C">
        Polymorphism
    </label>

    <label class="option">
        <input type="radio" name="q9" value="D">
        Abstraction
    </label>

</div>


<!-- Question 10 -->

<div class="question">

    <h3>10. Which package contains the Scanner class?</h3>

    <label class="option">
        <input type="radio" name="q10" value="A" required>
        java.io
    </label>

    <label class="option">
        <input type="radio" name="q10" value="B">
        java.util
    </label>

    <label class="option">
        <input type="radio" name="q10" value="C">
        java.sql
    </label>

    <label class="option">
        <input type="radio" name="q10" value="D">
        java.lang
    </label>

</div>


<!-- Question 11 -->

<div class="question">

    <h3>11. Which keyword is used to handle exceptions?</h3>

    <label class="option">
        <input type="radio" name="q11" value="A" required>
        try
    </label>

    <label class="option">
        <input type="radio" name="q11" value="B">
        check
    </label>

    <label class="option">
        <input type="radio" name="q11" value="C">
        error
    </label>

    <label class="option">
        <input type="radio" name="q11" value="D">
        exception
    </label>

</div>


<!-- Question 12 -->

<div class="question">

    <h3>12. Which JDBC object is used to execute SQL queries?</h3>

    <label class="option">
        <input type="radio" name="q12" value="A" required>
        Connection
    </label>

    <label class="option">
        <input type="radio" name="q12" value="B">
        PreparedStatement
    </label>

    <label class="option">
        <input type="radio" name="q12" value="C">
        Driver
    </label>

    <label class="option">
        <input type="radio" name="q12" value="D">
        ResultSet
    </label>

</div>


<!-- Question 13 -->

<div class="question">

    <h3>13. Which interface represents a connection to a database?</h3>

    <label class="option">
        <input type="radio" name="q13" value="A" required>
        Driver
    </label>

    <label class="option">
        <input type="radio" name="q13" value="B">
        Connection
    </label>

    <label class="option">
        <input type="radio" name="q13" value="C">
        Statement
    </label>

    <label class="option">
        <input type="radio" name="q13" value="D">
        ResultSet
    </label>

</div>


<!-- Question 14 -->

<div class="question">

    <h3>14. Which JDBC method is used for INSERT, UPDATE and DELETE operations?</h3>

    <label class="option">
        <input type="radio" name="q14" value="A" required>
        executeQuery()
    </label>

    <label class="option">
        <input type="radio" name="q14" value="B">
        executeUpdate()
    </label>

    <label class="option">
        <input type="radio" name="q14" value="C">
        execute()
    </label>

    <label class="option">
        <input type="radio" name="q14" value="D">
        runQuery()
    </label>

</div>


<!-- Question 15 -->

<div class="question">

    <h3>15. Which technology is mainly used to create dynamic web pages in Java?</h3>

    <label class="option">
        <input type="radio" name="q15" value="A" required>
        JSP
    </label>

    <label class="option">
        <input type="radio" name="q15" value="B">
        CSS
    </label>

    <label class="option">
        <input type="radio" name="q15" value="C">
        SQL
    </label>

    <label class="option">
        <input type="radio" name="q15" value="D">
        XML
    </label>

</div>


<button type="submit" class="submit-btn">
    Submit Examination
</button>

</form>


<script>

    let time = 30 * 60;

    let timer = setInterval(function() {

        let minutes = Math.floor(time / 60);

        let seconds = time % 60;

        seconds = seconds < 10 ? "0" + seconds : seconds;

        document.getElementById("timer").innerHTML =
            minutes + ":" + seconds;

        time--;

        if (time < 0) {

            clearInterval(timer);

            alert("Time is over! Your exam will be submitted.");

            document.querySelector("form").submit();

        }

    }, 1000);

</script>

</body>
</html>