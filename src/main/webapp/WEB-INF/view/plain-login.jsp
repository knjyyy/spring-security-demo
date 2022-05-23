<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>

<link rel="stylesheet" type="text/css" href="css/demo.css">
</head>
<body>
	<h3>User Login</h3>
	<form:form method="POST"
		action="${pageContext.request.contextPath}/authenticateUser">
		
		<c:if test="${param.error != null}" >
			<i class="failed">Invalid credentials!</i>
		</c:if>
		
		<c:if test="${param.logout != null}" >
			<i>User has been logged out</i>
		</c:if>
		<p>
			Username: <input type="text" name="username">
		</p>
		<p>
			Password: <input type="password" name="password">
		</p>
		<input type="submit" value="Login">
	</form:form>
</body>
</html>