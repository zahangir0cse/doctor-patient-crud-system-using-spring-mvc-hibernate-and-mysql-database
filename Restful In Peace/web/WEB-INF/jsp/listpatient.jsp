<%-- 
    Document   : listpatient
    Created on : Jul 11, 2017, 1:14:45 AM
    Author     : Zahangir Alam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Patient</title>
        <script>
            function deleteProduct(pid){
                if (confirm('Do you really want to delete this patient?')) {
                    var url = 'delete/'+pid;
                    window.location.href=url;
    
}
            }
        </script>
    </head>
    <body>
        <h3>List of Patient</h3>
    <c:if test="${!empty patientList}">
        <table border="1">
            <tr>
                <td><spring:message code="label.patientId"/></td>
                <td><spring:message code="label.patientName"/></td>
            <td><spring:message code="label.patientAge"/></td>
            <td><spring:message code="label.patientGender"/></td>
            <td><spring:message code="label.patientAddress"/></td>
            <td><spring:message code="label.patientContactNo"/></td>
            <td><spring:message code="label.patientEmail"/></td>
            <td>Action</td>
            </tr>
            <c:forEach items="${patientList}" var="p">
                <tr>
                    <td>${p.patientId}</td>
                    <td>${p.patientName}</td>
                    <td>${p.patientAge}</td>
                    <td>${p.patientGender}</td>
                    <td>${p.patientAddress}</td>
                    <td>${p.patientContactNo}</td>
                    <td>${p.patientEmail}</td>
                    <td>
                        <a href="#" onclick="javascript:deleteProduct(${p.id})">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</body>
</html>
