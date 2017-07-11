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
        <title>Mi doctor</title>
    </head>
    <body>
        <h3><spring:message code="label.miHeading"/></h3>
        <c:url var="action" value="/mi/add"/>
        <form:form method="post" action="${action}" commandName="mi">
            <table>
                <tr>
                    <td>
                        <form:label path="miName">
                            <spring:message code="label.miName"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="miName"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="miQualification">
                            <spring:message code="label.miQualification"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="miQualification"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="miGender">
                            <spring:message code="label.miGender"/>
                        </form:label>
                    </td>
                    <td>
                        <form:radiobutton path="miGender" value="Male"/>Male 
                        <form:radiobutton path="miGender" value="Female"/>Female
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="miAddress">
                            <spring:message code="label.miAddress"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="miAddress"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="miContactNo">
                            <spring:message code="label.miContactNo"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="miContactNo"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="miEmail">
                            <spring:message code="label.miEmail"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="miEmail"/>
                    </td>
                </tr>
                <tr>
                    <td> 
                            <input type="submit" value="<spring:message code="label.miSubmit"/>"/>
                    </td>
                </tr>
            </table>
        </form:form>
    </body>
</html>
