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
        <h3>User Login</h3>
        <c:url var="action" value="/user/check"/>
        <form:form method="post" action="${action}" commandName="user">
            <table>
                    <td>
                        <form:label path="userEmail">
                            <spring:message code="label.userEmail"/>
                        </form:label>
                    </td>
                    <td>
                        <input type="text" name="userEmail" value=""/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="userPassword">
                            <spring:message code="label.userPassword"/>
                        </form:label>
                    </td>
                    <td>
                        <input type="password" name="userPassword" value="">                
                    </td>
                </tr>
                <tr>
                    <td> 
                        <input type="submit" value="Login"/>
                    </td>
                </tr>
            </table>
        </form:form>
    </body>
</html>

