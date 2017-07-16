<%-- 
    Document   : miview
    Created on : Jul 16, 2017, 5:41:25 PM
    Author     : Zahangir Alam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Information</h1>
        <table>
            <tr>
                <td>Name: </td>
                <td>${name}</td>
            </tr>
            <tr>
                <td>Address: </td>
                <td>${address}</td>
            </tr>
            <tr>
                <td>Qualification: </td>
                <td>${qualification}</td>
            </tr>
            <tr>
                <td>Time: </td>
                <td>${time}</td>
            </tr>
            <tr>
                <td>Contact No: </td>
                <td>${contact}</td>
            </tr>
            <tr>
                <td>Email: </td>
                <td>${email}</td>
            </tr>
        </table>
            <p><a href="">See your Patient</a></p>
            <p><a href="/Restful_In_Peace/mi/edit/${id}">Edit your Information</a></p>
            <p><a href="/Restful_In_Peace/user/logout">logout</a></p>
    </body>
</html>
