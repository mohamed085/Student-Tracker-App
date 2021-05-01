/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Student;

/**
 *
 * @author Mohamed
 */
public class StudentDAO {
    public void insertStudent(Student student) {
        PreparedStatement pre;
        Connection connection = DBConnection.getConnection();
        try {
            pre = connection.prepareStatement("insert into student (first_name, last_name, email)" +
                    " values (?,?,?);");
            pre.setString(1, student.getFirstName());
            pre.setString(2, student.getLastName());
            pre.setString(3, student.getEmail());
            pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public List<Student> getAllStudent() {
        List<Student> students = new ArrayList<>();
        Student student;
        PreparedStatement pre;
        Connection connection = DBConnection.getConnection();
        ResultSet rst = null;
        try {
            pre = connection.prepareStatement("select * FROM student ");
            rst = (ResultSet) pre.executeQuery();
            while(rst.next()){
                student = new Student(rst.getInt(1), rst.getString(2), rst.getString(3), rst.getString(4));
                students.add(student);
            }
            return students;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }
    
    public Student getStudent(String studentId) {
        int id;
        Student student = null;
        PreparedStatement pre;
        Connection connection = DBConnection.getConnection();
        ResultSet rst = null;
        try {
            id = Integer.parseInt(studentId);
            pre = connection.prepareStatement("select * FROM student WHERE id=?");
            pre.setInt(1, id);
            rst = (ResultSet) pre.executeQuery();
            while(rst.next()){
                student = new Student(rst.getInt(1), rst.getString(2), rst.getString(3), rst.getString(4));
            }
            return student;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }
    
    
    
    public void updateStudent(Student newStudent) {
        PreparedStatement pre;
        Connection connection = DBConnection.getConnection();
        try {
            System.out.println("SAdas");
            pre = connection.prepareStatement("UPDATE student SET first_name=?, last_name=?, email=? WHERE id=?");
            pre.setString(1, newStudent.getFirstName());
            pre.setString(2, newStudent.getLastName());
            pre.setString(3, newStudent.getEmail());
            pre.setInt(4, newStudent.getId());
            pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public void deleteStudent(int id) {
        PreparedStatement pre;
        Connection connection = DBConnection.getConnection();
        try {
            pre = connection.prepareStatement("DELETE FROM student WHERE id=?");
            pre.setInt(1, id);
            pre.executeUpdate();
        } catch(SQLException ex){
            ex.printStackTrace();
        }
}
}
