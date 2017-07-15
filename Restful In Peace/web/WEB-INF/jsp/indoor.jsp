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
        <form:errors path="indoor.*"/>
        <c:url var="action" value="/admission/goindoor"/>
        <form:form method="post" action="${action}" commandName="indoor">
            <table>
                <tr>
                    <td>
                        <form:label path="indoorDepartment">
                            <spring:message code="label.indoorDepartment"/>
                        </form:label>
                    </td>
                    <td>
                        <form:radiobutton path="indoorDepartment" value="Abdominal Radiology"/>Abdominal Radiology
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <form:radiobutton path="indoorDepartment" value="Pain Medicine"/>Pain Medicine
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <form:radiobutton path="indoorDepartment" value="Dermatology"/>Dermatology
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <form:radiobutton path="indoorDepartment" value="Radiation Oncology"/>Radiation Oncology
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <form:radiobutton path="indoorDepartment" value="Surgery-General"/>Surgery-General
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="indoorType">
                            <spring:message code="label.indoorType"/>
                        </form:label>
                    </td>
                    <td>
                        <form:radiobutton path="indoorType" value="GENERAL WARD"/>GENERAL WARD
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <form:radiobutton path="indoorType" value="SEMI PRIVATE ROOM"/>SEMI PRIVATE ROOM
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <form:radiobutton path="indoorType" value="PRIVATE ROOM"/>PRIVATE ROOM
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <form:radiobutton path="indoorType" value="DELUXE (WITHOUT A/C)"/>DELUXE (WITHOUT A/C)
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <form:radiobutton path="indoorType" value="LUXURY WITH A/C"/>LUXURY WITH A/C
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
