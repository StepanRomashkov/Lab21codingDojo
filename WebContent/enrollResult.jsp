<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.stepan.*" %>
<%@ page import="java.sql.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource var="datasrc" driver="com.mysql.cj.jdbc.Driver"
    url="${DBsettings.url}" user="${DBsettings.user}" password="${DBsettings.pass}" />

<sql:update dataSource="${datasrc}">
	INSERT INTO `students`.`student` 
		(`firstName`, `lastName`, `streetAdress`, `city`, `state_id`, `zip`, 
		 `contactPhone`, `email`, `bootcamp_id`, `birthDate`) 
		VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
	<sql:param value="${param.fName}" />
	<sql:param value="${param.lName}" />
	<sql:param value="${param.stAddress}" />
	<sql:param value="${param.city}" />
	<sql:param value="${param.state}" />
	<sql:param value="${param.zip}" />
	<sql:param value="${param.contactPhone}" />
	<sql:param value="${param.email}" />
	<sql:param value="${param.bootcamp}" />
	<sql:param value="${param.bday}" />
</sql:update>

<sql:query dataSource="${datasrc}" var="stateName">
	select stName from state where id="${param.state}"
</sql:query>

<sql:query dataSource="${datasrc}" var="bootcampName">
	select bcName from bootcamp where id="${param.bootcamp}"
</sql:query>

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
    $("p").hover(function(){
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
    <form action="studentList.jsp" method="post">    
    	<button type="submit">Display students</button>
    </form>
</div>

<div class="mainContent">
<p>Enrolled successfully!</p>
<br>
<p>First Name: <c:out value="${param.fName}"/></p>
<p>Last Name: <c:out value="${param.lName}"/></p>
<p>Street Address: <c:out value="${param.stAddress}"/></p>
<p>City: <c:out value="${param.city}"/></p>
<p>State: <c:out value="${stateName.rowsByIndex[0][0]}"/></p>
<p>Zip: <c:out value="${param.zip}"/></p>
<p>Contact Phone: <c:out value="${param.contactPhone}"/></p>
<p>E-mail: <c:out value="${param.email}"/></p>
<p>Bootcamp: <c:out value="${bootcampName.rowsByIndex[0][0]}"/></p>
<p>Birth Date: <c:out value="${param.bday}"/></p>
</div>
    
</body>
</html>