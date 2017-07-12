<%-- 
    Document   : outdoor
    Created on : Jul 12, 2017, 6:25:47 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <h1><spring:message code="label.outdoorHeading"/></h1>
        <c:url var="action" value="/admission/gooutdoor"/>
       <form:form method="post" action="${action}" commandName="outdoor">
            <table>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <form:label path="outdoorTime">
                            <spring:message code="label.outdoorTime"/>
                        </form:label>
                    </td>
                    <td>
                        <form:select path="outdoorTime">
                            <form:option value="" label="----Select Time----"/>
                            <form:options items="${timeList}"/>
                        </form:select>
                    </td>
                </tr>
                <tr>
                    <td> 
                        <input type="submit" value="<spring:message code="label.outdoorSubmit"/>"/>
                    </td>
                </tr>
            </table>
        </form:form>
    </body>
</html>
