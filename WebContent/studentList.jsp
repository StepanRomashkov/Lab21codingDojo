<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.stepan.*" %>
<%@ page import="java.sql.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource var="datasrc" driver="com.mysql.cj.jdbc.Driver"
    url="${DBsettings.url}" user="${DBsettings.user}" password="${DBsettings.pass}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
<title>Grant Chirpus' Code Dojo</title>

<script src="${pageContext.request.contextPath}/js/jQuery.js"></script>
<script>
$(document).ready(function(){
    $("tr").hover(function(){
        $(this).fadeTo(80, 0.8).fadeTo(80, 1);
    });
});
</script>

</head>
<body>
<header>Welcome to Grant Chirpus' Code Dojo!</header>


<div id="side">
    <form action="index.jsp" method="post">    
    	<button type="submit">Return to enroll</button>
    </form>
</div>

	<sql:query dataSource="${datasrc}" var="result">
		select student.firstName, student.lastName, student.streetAdress, 
			student.city, state.stName, student.zip, student.contactPhone, 
			student.email, bootcamp.bcName, student.birthDate 
			from student inner join state on student.state_id = state.id 
			inner join bootcamp on student.bootcamp_id = bootcamp.id	
	</sql:query> 

<div class="mainContent">
<table id="displayStudents">
	<tr>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Street Address</th>
		<th>City</th>
		<th>State</th>
		<th>Zip</th>
		<th>Contact Phone</th>
		<th>E-mail</th>
		<th>Bootcamp</th>
		<th>Birth Date</th>	
	</tr>
	
<c:forEach var="row" items="${result.rows}">
	<tr>
		<td><c:out value="${row.firstName}"/></td>
		<td><c:out value="${row.lastName}"/></td>
		<td><c:out value="${row.streetAdress}"/></td>
		<td><c:out value="${row.city}"/></td>
		<td><c:out value="${row.stName}"/></td>
		<td><c:out value="${row.zip}"/></td>
		<td><c:out value="${row.contactPhone}"/></td>
		<td><c:out value="${row.email}"/></td>
		<td><c:out value="${row.bcName}"/></td>
		<td><c:out value="${row.birthDate}"/></td>	
	</tr>
</c:forEach>
    
</table>
</div>
    
</body>
</html>