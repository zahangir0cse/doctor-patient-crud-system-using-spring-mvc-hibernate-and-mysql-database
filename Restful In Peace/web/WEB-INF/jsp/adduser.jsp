<%-- 
    Document   : adduser
    Created on : Jul 14, 2017, 3:54:23 AM
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
        <title>User</title>
    </head>
    <body>
        <h3>User Registration</h3>
        <c:url var="action" value="/user/regsuccess"/>
        <form:errors path="user.*"/>
        <p>${invalid}</p>
        <form:form method="post" action="${action}" commandName="user">
            <table>
                <tr>
                    <td>
                        <form:label path="userName">
                            <spring:message code="label.userName"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="userName"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="userRole">
                            <spring:message code="label.userRole"/>
                        </form:label>
                    </td>
                    <td>
                        <form:select path="userRole">
                            <form:option value="" label="----Select Role----"/>
                            <form:options items="${roleList}"/>
                        </form:select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="userAddress">
                            <spring:message code="label.userAddress"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="userAddress"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="userContactNo">
                            <spring:message code="label.userContactNo"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="userContactNo"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="userEmail">
                            <spring:message code="label.userEmail"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="userEmail"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="userPassword">
                            <spring:message code="label.userPassword"/>
                        </form:label>
                    </td>
                    <td>
                        <form:password path="userPassword"/>                
                    </td>
                </tr>
                <tr>
                    <td> 
                        <input type="submit" value="<spring:message code="label.userSubmit"/>"/>
                    </td>
                </tr>
            </table>
        </form:form>
    </body>
</html>

