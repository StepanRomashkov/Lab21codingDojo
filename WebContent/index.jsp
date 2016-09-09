<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.stepan.*" %>
<%@ page import="java.sql.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
<title>Grant Chirpus' Code Dojo</title>

<script src="${pageContext.request.contextPath}/js/jQuery.js"></script>
<script>
$(document).ready(function(){
    $("#regButton").click(function(){
        $("#regForm").fadeToggle(300);
    });
});
</script>
</head>

<body>
    <header>Welcome to Grant Chirpus' Code Dojo!</header>

    <sql:setDataSource var="datasrc" driver="com.mysql.cj.jdbc.Driver"
    url="${DBsettings.url}" user="${DBsettings.user}" password="${DBsettings.pass}" />

    <div id="side">
        <button id="regButton">Enroll to DoJo</button>
    <form action="studentList.jsp" method="post">    
    	<button type="submit">Display students</button>
    </form>
    </div>

    <sql:query dataSource="${datasrc}" var="result">
        SELECT * FROM state;
    </sql:query> 

    <form class="mainContent" id="regForm" action="enrollResult.jsp" method="post" hidden="true">
        <label class="formElems"> First Name:
            <input type="text" name="fName" >
        </label>
        
        <label class="formElems"> Last Name:
            <input type="text" name="lName" >
        </label>
        
        <label class="formElems"> Street Address:
            <input type="text" name="stAddress" >
        </label>
        
        <label class="formElems"> City:
            <input type="text" name="city" >
        </label>
        
        <label class="formElems">State:
        <select name="state">
            <c:forEach var="row" items="${result.rows}">
                <option value="${row.id}">${row.stName}</option>
            </c:forEach>
        </select>
        </label>

        <label class="formElems"> Zip:
            <input type="text" name="zip" size="5" pattern="[0-9]+">
        </label>
        
        <label class="formElems">Birthday:
            <input type="date" name="bday">
        </label>        

        <label class="formElems"> Phone:
            <input type="text" name="contactPhone" >
        </label>

        <label class="formElems"> E-mail:
            <input type="email" name="email" >
        </label>
        
        <div id="radioBoot" class="formElems">
        Which bootcamp you want to enroll?<br>
        <input type="radio" name="bootcamp" value="1" checked>Java<br>
        <input type="radio" name="bootcamp" value="2">Front-end<br>
        <input type="radio" name="bootcamp" value="3">.NET (C#)<br>
        <input type="radio" name="bootcamp" value="4">Python<br>
        </div>
        
        <button id="submitForm" type="submit">Enroll</button>
    </form>
    <br>

    
</body>
</html>