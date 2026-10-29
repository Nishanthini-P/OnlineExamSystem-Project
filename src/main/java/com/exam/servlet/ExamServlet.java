package com.exam.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet({"/login", "/exam", "/marklist"})
public class ExamServlet extends HttpServlet {

    // ==============================
    // DATABASE DETAILS
    // ==============================

    private static final String URL =
            "jdbc:mysql://localhost:3306/online_exam_db";

    private static final String USER = "root";

    private static final String PASSWORD =
            "Student@123";


    // ==============================
    // DATABASE CONNECTION
    // ==============================

    private Connection getConnection() throws Exception {

        Class.forName("com.mysql.cj.jdbc.Driver");

        return DriverManager.getConnection(
                URL,
                USER,
                PASSWORD
        );
    }


    // ==============================
    // GET REQUEST
    // ==============================

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletPath();

        if (path.equals("/marklist")) {

            showMarkList(request, response);
        }
    }


    // ==============================
    // POST REQUEST
    // ==============================

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletPath();

        if (path.equals("/login")) {

            login(request, response);

        } else if (path.equals("/exam")) {

            submitExam(request, response);
        }
    }


    // ==============================
    // LOGIN
    // ==============================

    private void login(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        int studentId =
                Integer.parseInt(
                        request.getParameter("studentId")
                );

        String password =
                request.getParameter("password");


        String sql =
                "SELECT * FROM students " +
                "WHERE student_id = ? AND password = ?";


        try (
                Connection con = getConnection();
                PreparedStatement ps =
                        con.prepareStatement(sql)
        ) {

            ps.setInt(1, studentId);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();


            if (rs.next()) {

                HttpSession session =
                        request.getSession();

                session.setAttribute(
                        "studentId",
                        studentId
                );

                session.setAttribute(
                        "studentName",
                        rs.getString("student_name")
                );

                response.sendRedirect("home.jsp");

            } else {

                response.sendRedirect(
                        "login.jsp?error=Invalid Login"
                );
            }


        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "login.jsp?error=Database Error"
            );
        }
    }


    // ==============================
    // SUBMIT EXAM
    // ==============================

    private void submitExam(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        HttpSession session =
                request.getSession();


        Integer studentId =
                (Integer) session.getAttribute(
                        "studentId"
                );


        if (studentId == null) {

            response.sendRedirect("login.jsp");

            return;
        }


        int examId = 1;

        int marks = 0;

        int totalMarks = 0;


        String[] answers =
                new String[15];


        // Get student's answers
        for (int i = 0; i < 15; i++) {

            answers[i] =
                    request.getParameter(
                            "q" + (i + 1)
                    );
        }


        String questionSql =
                "SELECT question_id, correct_answer, marks " +
                "FROM questions " +
                "WHERE exam_id = ? " +
                "ORDER BY question_id";


        try (
                Connection con = getConnection();
                PreparedStatement ps =
                        con.prepareStatement(questionSql)
        ) {

            ps.setInt(1, examId);

            ResultSet rs =
                    ps.executeQuery();


            int questionNumber = 0;


            while (
                    rs.next()
                    && questionNumber < 15
            ) {

                String correctAnswer =
                        rs.getString(
                                "correct_answer"
                        );


                int questionMarks =
                        rs.getInt("marks");


                totalMarks += questionMarks;


                String selectedAnswer =
                        answers[questionNumber];


                if (
                        selectedAnswer != null
                        &&
                        selectedAnswer.equalsIgnoreCase(
                                correctAnswer
                        )
                ) {

                    marks += questionMarks;
                }


                questionNumber++;
            }


            rs.close();
         // ==============================
         // SAVE STUDENT ANSWERS
         // ==============================

         String answerSql =
                 "INSERT INTO student_answers " +
                 "(student_id, exam_id, question_id, selected_answer, is_correct) " +
                 "VALUES (?, ?, ?, ?, ?)";

         try (
                 PreparedStatement answerPs =
                         con.prepareStatement(answerSql)
         ) {

             // Get question IDs again
             String idSql =
                     "SELECT question_id, correct_answer " +
                     "FROM questions " +
                     "WHERE exam_id = ? " +
                     "ORDER BY question_id";

             try (
                     PreparedStatement idPs =
                             con.prepareStatement(idSql)
             ) {

                 idPs.setInt(1, examId);

                 ResultSet idRs =
                         idPs.executeQuery();

                 int answerIndex = 0;

                 while (idRs.next() && answerIndex < 15) {

                     int questionId =
                             idRs.getInt("question_id");

                     String correctAnswer =
                             idRs.getString("correct_answer");

                     String selectedAnswer =
                             answers[answerIndex];

                     boolean isCorrect =
                             selectedAnswer != null
                             && selectedAnswer.equalsIgnoreCase(
                                     correctAnswer
                             );

                     answerPs.setInt(1, studentId);
                     answerPs.setInt(2, examId);
                     answerPs.setInt(3, questionId);

                     if (selectedAnswer != null) {
                         answerPs.setString(
                                 4,
                                 selectedAnswer
                         );
                     } else {
                         answerPs.setNull(
                                 4,
                                 java.sql.Types.CHAR
                         );
                     }

                     answerPs.setBoolean(
                             5,
                             isCorrect
                     );

                     answerPs.executeUpdate();

                     answerIndex++;
                 }

                 idRs.close();
             }
         }


            // ==============================
            // PERCENTAGE
            // ==============================

            double percentage = 0;


            if (totalMarks > 0) {

                percentage =
                        ((double) marks / totalMarks)
                        * 100;
            }


            // ==============================
            // GRADE
            // ==============================

            String grade;


            if (percentage >= 90) {

                grade = "A+";

            } else if (percentage >= 80) {

                grade = "A";

            } else if (percentage >= 70) {

                grade = "B";

            } else if (percentage >= 60) {

                grade = "C";

            } else if (percentage >= 50) {

                grade = "D";

            } else {

                grade = "F";
            }


            // ==============================
            // PASS / FAIL
            // ==============================

            String status;


            if (percentage >= 50) {

                status = "PASS";

            } else {

                status = "FAIL";
            }


            // ==============================
            // SAVE RESULT
            // ==============================

            String resultSql =
                    "INSERT INTO results " +
                    "(student_id, exam_id, " +
                    "marks_obtained, total_marks, " +
                    "percentage, grade, result_status) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?)";


            try (
                    PreparedStatement resultPs =
                            con.prepareStatement(
                                    resultSql
                            )
            ) {

                resultPs.setInt(
                        1,
                        studentId
                );

                resultPs.setInt(
                        2,
                        examId
                );

                resultPs.setInt(
                        3,
                        marks
                );

                resultPs.setInt(
                        4,
                        totalMarks
                );

                resultPs.setDouble(
                        5,
                        percentage
                );

                resultPs.setString(
                        6,
                        grade
                );

                resultPs.setString(
                        7,
                        status
                );


                resultPs.executeUpdate();
            }


            // ==============================
            // STORE RESULT IN SESSION
            // ==============================

            session.setAttribute(
                    "marks",
                    marks
            );

            session.setAttribute(
                    "totalMarks",
                    totalMarks
            );

            session.setAttribute(
                    "percentage",
                    percentage
            );

            session.setAttribute(
                    "grade",
                    grade
            );

            session.setAttribute(
                    "status",
                    status
            );


            response.sendRedirect(
                    "result.jsp"
            );


        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "exam.jsp?error=Submission Failed"
            );
        }
    }


    // ==============================
    // SHOW MARK LIST
    // ==============================

    private void showMarkList(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession();


        Integer studentId =
                (Integer) session.getAttribute(
                        "studentId"
                );


        if (studentId == null) {

            response.sendRedirect("login.jsp");

            return;
        }


        List<String[]> markList =
                new ArrayList<>();


        String sql =
                "SELECT e.exam_name, e.subject, " +
                "r.marks_obtained, r.total_marks, " +
                "r.percentage, r.grade, " +
                "r.result_status, r.exam_date " +
                "FROM results r " +
                "JOIN exams e ON r.exam_id = e.exam_id " +
                "WHERE r.student_id = ? " +
                "ORDER BY r.exam_date DESC";


        try (
                Connection con = getConnection();
                PreparedStatement ps =
                        con.prepareStatement(sql)
        ) {

            ps.setInt(1, studentId);


            ResultSet rs =
                    ps.executeQuery();


            while (rs.next()) {

                String[] row = new String[8];


                row[0] =
                        rs.getString("exam_name");

                row[1] =
                        rs.getString("subject");

                row[2] =
                        String.valueOf(
                                rs.getInt(
                                        "marks_obtained"
                                )
                        );

                row[3] =
                        String.valueOf(
                                rs.getInt(
                                        "total_marks"
                                )
                        );

                row[4] =
                        String.format(
                                "%.2f",
                                rs.getDouble(
                                        "percentage"
                                )
                        );

                row[5] =
                        rs.getString("grade");

                row[6] =
                        rs.getString(
                                "result_status"
                        );

                row[7] =
                        rs.getTimestamp(
                                "exam_date"
                        ).toString();


                markList.add(row);
            }


            request.setAttribute(
                    "markList",
                    markList
            );


            request.getRequestDispatcher(
                    "marklist.jsp"
            ).forward(
                    request,
                    response
            );


        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "home.jsp?error=Unable to load mark list"
            );
        }
    }
}
