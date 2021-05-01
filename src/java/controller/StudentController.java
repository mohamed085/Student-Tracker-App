/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.StudentDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Student;

/**
 *
 * @author Mohamed
 */
public class StudentController extends HttpServlet {
    private StudentDAO studentDAO = new StudentDAO();
    
    @Override
    public void init() throws ServletException {
       super.init();
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String theCommand = request.getParameter("command");
            if (theCommand == null){
                theCommand = "LIST";
            }
            switch (theCommand) {
                case "LIST":
                    studentList(request, response);
                    break;
                case "ADD":
                    addStudent(request, response);
                    break;
                case "LOAD":
                    updateStudent(request, response);
                    break;
                default:
                    studentList(request, response);
            }
        } catch (Exception e) {
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    private void studentList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Student> students = studentDAO.getAllStudent();
        request.setAttribute("Students", students);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/list-students.jsp");
        dispatcher.forward(request, response);
    }
    
    private void addStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Student student = new Student(request.getParameter("firstName"), request.getParameter("lastName"), request.getParameter("email"));
        studentDAO.insertStudent(student);
        studentList(request, response);
    }
    
    private void updateStudent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentId = request.getParameter("studentId");
        Student s = studentDAO.getStudent(studentId);
        request.setAttribute("Student", s); 
        RequestDispatcher dispatcher = request.getRequestDispatcher("/update-student.jsp");
        dispatcher.forward(request, response); 

    }
}
