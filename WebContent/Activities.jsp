<%@page import="Test.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="Test.Business,Test.Category,Test.Center, Test.Coordinates,Test.FinalYelpObj, 
Test.Location,Test.Region,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="header">
		<img id="logo" src="plannrly.jpg"></img> <a id="Login"
			href="login.jsp">Login</a> <a id="SignUp" href="signup.jsp">Sign
			up</a>
		<div id="Profile">
			<a href="Profile.jsp">Profile</a>
		</div>
		<a id="SignOut" href="SignOut.jsp">Sign Out</a>
	</div>
	<table>
		<tr>
			<th>Activity</th>
			<th>Price</th>

		</tr>
		<%
			ArrayList<FinalYelpObj> activitiesList = (ArrayList<FinalYelpObj>) request.getAttribute("resultList");
			for (FinalYelpObj i : activitiesList) {
				for (Business j : i.getBusinesses()) {
		%>
		<p><%=j.getName() + " " + j.getPrice()%></p>
		<%
			}
			}
		%>
	</table>
</body>
</html>