<%-- 
    Document   : addpatient
    Created on : Jul 10, 2017, 1:07:24 PM
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
        <title><spring:message code="label.patientInfo"/></title>
    </head>
    <body>
        <h3></h3>
        <c:url var="action" value="/admit"/>
        <form:form method="post" action="${action}" commandName="patient">
            <table>
                <tr>
                    <td>
                        <form:label path="patientName">
                            <spring:message code="label.patientName"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="patientName"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="patientAge">
                            <spring:message code="label.patientAge"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="patientAge"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="patientGender">
                            <spring:message code="label.patientGender"/>
                        </form:label>
                    </td>
                    <td>
                        <form:radiobutton path="patientGender" value="Male"/>Male 
                        <form:radiobutton path="patientGender" value="Female"/>Female
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="patientAddress">
                            <spring:message code="label.patientAddress"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="patientAddress"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="patientContactNo">
                            <spring:message code="label.patientContactNo"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="patientContactNo"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="patientEmail">
                            <spring:message code="label.patientEmail"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="patientEmail"/>
                    </td>
                </tr>
                <tr>
                    <td> 
                            <input type="submit" value="<spring:message code="label.patientSubmit"/>"/>
                    </td>
                </tr>
            </table>
        </form:form>
    </body>
</html>
