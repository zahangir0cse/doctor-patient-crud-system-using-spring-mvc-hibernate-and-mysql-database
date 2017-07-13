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
        <title>All Mi</title>
        <script>
            function deleteMi(mid) {
                if (confirm('Do you really want to delete this Mi doctor?')) {
                    var url = 'delete/' + mid;
                    window.location.href = url;

                }
            }
        </script>
    </head>
    <body>
        <h3>List of Mi</h3>
        <c:if test="${!empty miList}">
            <table border="1">
                <tr>
                    <td><spring:message code="label.miId"/></td>
                    <td><spring:message code="label.miName"/></td>
                    <td><spring:message code="label.miQualification"/></td>
                    <td><spring:message code="label.miAddress"/></td>
                    <td><spring:message code="label.miGender"/></td>
                    <td><spring:message code="label.miContactNo"/></td>
                    <td><spring:message code="label.miEmail"/></td>
                    <td><spring:message code="label.miTime"/></td>
                    <td>Action</td>
                </tr>
                <c:forEach items="${miList}" var="m">
                    <tr>
                        <td>${m.miId}</td>
                        <td>${m.miName}</td>
                        <td>${m.miQualification}</td>
                        <td>${m.miAddress}</td>
                        <td>${m.miGender}</td>
                        <td>${m.miContactNo}</td>
                        <td>${m.miEmail}</td>
                        <td>${m.miTime}</td>
                        <td>
                            <a href="/Restful_In_Peace/mi/edit/${m.miId}">Edit</a>
                            <a href="#" onclick="javascript:deleteMi(${m.miId})">Delete</a>
                        </td>
                    </tr>
                    <a href="milist.jsp"></a>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>
