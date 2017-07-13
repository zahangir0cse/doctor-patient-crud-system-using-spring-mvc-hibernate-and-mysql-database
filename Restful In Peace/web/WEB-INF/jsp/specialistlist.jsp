<%-- 
    Document   : milist
    Created on : Jul 12, 2017, 1:28:59 AM
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
        <title>All Specialist</title>
        <script>
            function deleteSpecialist(sid) {
                if (confirm('Do you really want to delete this Specialist?')) {
                    var url = 'delete/' + sid;
                    window.location.href = url;

                }
            }
        </script>
    </head>
    <body>
        <h3>List of Specialist</h3>
        <c:if test="${!empty specialistList}">
            <table border="1">
                <tr>
                    <td><spring:message code="label.specialistId"/></td>
                    <td><spring:message code="label.specialistName"/></td>
                    <td><spring:message code="label.specialistQualification"/></td>
                    <td><spring:message code="label.specialistSpeialty"/></td>
                    <td><spring:message code="label.specialistAddress"/></td>
                    <td><spring:message code="label.specialistGender"/></td>
                    <td><spring:message code="label.specialistContactNo"/></td>
                    <td><spring:message code="label.specialistEmail"/></td>
                    <td>Action</td>
                </tr>
                <c:forEach items="${specialistList}" var="s">
                    <tr>
                        <td>${s.specialistId}</td>
                        <td>${s.specialistName}</td>
                        <td>${s.specialistQualification}</td>
                        <td>${s.specialistSpeialty}</td>
                        <td>${s.specialistAddress}</td>
                        <td>${s.specialistGender}</td>
                        <td>${s.specialistContactNo}</td>
                        <td>${s.specialistEmail}</td>
                        <td>
                            <a href="/Restful_In_Peace/specialist/edit/${s.specialistId}">Edit</a>
                            <a href="#" onclick="javascript:deleteSpecialist(${s.specialistId})">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>