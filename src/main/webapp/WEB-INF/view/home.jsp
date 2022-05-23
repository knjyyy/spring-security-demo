<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Homepage</title>
</head>
<body>
	<h3>Welcome, new user!</h3>
	<hr>
	<security:authentication property="principal.username" />
	<br>
	<br> Role(s):
	<security:authentication property="principal.authorities" />
	<hr>

	<security:authorize access="hasRole('MANAGER')">
		<!-- Resource for manager roles  -->
		<a href="${pageContext.request.contextPath}/leaders">Leadership
			meeting (for Managers)</a>
		<hr>
	</security:authorize>

	<security:authorize access="hasRole('ADMIN')">
		<!-- Resource for manager roles  -->
		<a href="${pageContext.request.contextPath}/systems">System
			console (for Admins)</a>
		<hr>
	</security:authorize>

	<form:form action="${pageContext.request.contextPath}/logout"
		method="POST">
		<input type="submit" value="Logout">
	</form:form>
</body>
</html>