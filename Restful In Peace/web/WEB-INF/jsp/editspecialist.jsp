<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Specialist</title>
    </head>
    <body>
        <h3><spring:message code="label.specialistHeading"/></h3>
        <c:url var="action" value="/specialist/sedit"/>
        <form:form method="post" action="${action}" commandName="specialist">
            <table>
                    <tr>
                        <td>
                            <form:label path="specialistId">
                                <spring:message code="label.specialistId"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="specialistId"/>
                        </td>
                    </tr>
                <tr>
                    <td>
                        <form:label path="specialistName">
                            <spring:message code="label.specialistName"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="specialistName"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="specialistQualification">
                            <spring:message code="label.specialistQualification"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="specialistQualification"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="specialistSpeialty">
                            <spring:message code="label.specialistSpeialty"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="specialistSpeialty"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="specialistGender">
                            <spring:message code="label.specialistGender"/>
                        </form:label>
                    </td>
                    <td>
                        <form:radiobutton path="specialistGender" value="Male"/>Male 
                        <form:radiobutton path="specialistGender" value="Female"/>Female
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="specialistAddress">
                            <spring:message code="label.specialistAddress"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="specialistAddress"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="specialistContactNo">
                            <spring:message code="label.specialistContactNo"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="specialistContactNo"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="specialistEmail">
                            <spring:message code="label.specialistEmail"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="specialistEmail"/>
                    </td>
                </tr>
                <tr>
                    <td> 
                        <input type="submit" value="<spring:message code="label.editSpecialist"/>"/>
                    </td>
                </tr>
            </table>
        </form:form>
    </body>
</html>