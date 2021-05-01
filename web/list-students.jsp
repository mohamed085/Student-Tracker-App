<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Student"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Tracker App</title>
        <style>
            html, body{
                margin-left:15px; margin-right:15px; 
                padding:0px; 
                font-family:Verdana, Arial, Helvetica, sans-serif;
            }
            
            .center {
                display: flex;
                justify-content: center;
            }
            
            .center div,
            .center table{
                  text-align: center;
                  width: 800px;
            }
            
            table {   
                border-collapse:collapse;
                border-bottom:1px solid gray;
                font-family: Tahoma,Verdana,Segoe,sans-serif;
            }

            th {
                border-bottom:1px solid gray;
                background:none repeat scroll 0 0 #0775d3;
                padding:10px;
                color: #FFFFFF;
            }

            tr {
                border-top:1px solid gray;
                text-align:center;	
            }

            tr:nth-child(even) {background: #FFFFFF}
            tr:nth-child(odd) {background: #BBBBBB}	

            #wrapper { margin-top: 0px; }
            #header { background: #0775d3; margin-top: 0px; padding:15px 0px 15px 0px;}
            #header h2 { margin:auto; color: #FFFFFF;}
            #container { margin:auto}
            #container h3 {color: #000;}
            #container #content {margin-top: 20px;}

            .add-student-button {
                border: 1px solid #666; 
                border-radius: 5px; 
                padding: 4px; 
                font-size: 12px;
                font-weight: bold;
                width: 120px; 
                padding: 5px 10px; 
                margin-bottom: 15px;
                background: #cccccc;
            }
        </style>
    </head>
    <body>
        <div class="center">
            <div id="container">
                <div id="wrapper">
                    <div id="header">
                        <h2>Menofia University</h2>
                    </div>
                </div>
                <div id="content">
                    <input 
                        type="button"
                        value="Add new student"
                        onclick="window.location.href='add-student-form.jsp'; return false;"
                        class="add-student-button"
                    />
                    <table>
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Action</th>
                        </tr>
                        <c:forEach var="tempStudent" items="${Students}">
                            <c:url var="templink" value="StudentController">
                                <c:param name="command" value="LOAD"></c:param>
                                <c:param name="studentID" value="${tempStudent.id}"></c:param>
                            </c:url>
                            <tr>
                                <td> ${tempStudent.firstName} </td>
                                <td> ${tempStudent.lastName} </td>
                                <td> ${tempStudent.email} </td>
                                <td> <a href="${templink}">Update</a> </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
