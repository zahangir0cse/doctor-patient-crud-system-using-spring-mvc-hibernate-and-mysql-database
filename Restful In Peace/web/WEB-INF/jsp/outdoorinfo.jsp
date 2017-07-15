<%-- 
    Document   : outdoorinfo
    Created on : Jul 15, 2017, 5:50:08 AM
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
        <h1 align="center">Your Information</h1>
        <table>
            <tr>
                <td>Patient Name</td>
                <td>${pname}</td>
            </tr>
            <tr>
                <td>Mi Name</td>
                <td>${mname}</td>
            </tr>
            <tr>
                <td>Time</td>
                <td>${time}</td>
            </tr>
            <tr>
                <td>Serial No</td>
                <td>${serial}</td>
            </tr>
        </table>
    </body>
</html>
