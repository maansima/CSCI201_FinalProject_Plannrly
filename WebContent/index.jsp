<!-- CSCI 201 Final Project Plannrly 
Team Members: Andrew Garcia, Cathleen Yang, Giovana Da Cunha, Maansi Manchanda 
Emails: andreweg@usc.edu, cathleey@usc.edu, dacunha@usc.edu, maansima@usc.edu
 -->
 

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
	session.setAttribute("loginID", 0);
	String redirectURL = "Home.jsp";
    response.sendRedirect(redirectURL);
	
%>

</body>
</html>	