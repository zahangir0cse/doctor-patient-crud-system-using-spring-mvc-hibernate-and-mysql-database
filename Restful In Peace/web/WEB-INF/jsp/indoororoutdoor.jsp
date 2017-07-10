<%-- 
    Document   : admission
    Created on : Jul 10, 2017, 6:01:38 PM
    Author     : Zahangir Alam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><spring:message code="label.admissionTitle"/></title>
    </head>
    <body>
        <h1><spring:message code="label.indoorHeading"/></h1>
        <c:url var="action" value="/admission/selection"/>
        <form:form method="post" action="${action}" commandName="indoor">
            <table>
                <tr>
                    <td>
                        <form:label path="indoorDepartment">
                            <spring:message code="label.indoorDepartment"/>
                        </form:label>
                    </td>
                    <td>
                        <form:radiobutton path="indoorDepartment" value="GENERAL WARD"/>GENERAL WARD
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <form:radiobutton path="indoorDepartment" value="SEMI PRIVATE ROOM"/>SEMI PRIVATE ROOM
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <form:radiobutton path="indoorDepartment" value="PRIVATE ROOM"/>PRIVATE ROOM
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <form:radiobutton path="indoorDepartment" value="DELUXE (WITHOUT A/C)"/>DELUXE (WITHOUT A/C)
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <form:radiobutton path="indoorDepartment" value="LUXURY WITH A/C"/>LUXURY WITH A/C
                    </td>
                </tr>
                <tr>
                    <td> 
                        <input type="submit" value="<spring:message code="label.indoorSubmit"/>"/>
                    </td>
                </tr>
            </table>
        </form:form>
    </body>
</html>
