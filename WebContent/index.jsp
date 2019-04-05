<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*, java.net.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome To Plannerly!</title>

</head>
<body>
<%
	session.setAttribute("loginID", 1);
	String redirectURL = "Home.jsp";
    response.sendRedirect(redirectURL);

%>

</body>
</html>