<%@page import="Test.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="Test.Business,Test.Category,Test.Center, Test.Coordinates,Test.FinalYelpObj, 
Test.Location,Test.Region,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Activities.css" />
<meta charset="UTF-8">
<title>Activities!</title>
<script>
window.onload= function(){
	var userID = <%= session.getAttribute("loginID") %>
	if(userID == 0){
		document.getElementById("SignOut").style.display = "none";
		document.getElementById("Profile").style.display = "none";
	}
	else if (userID!=0){
		document.getElementById("Login").style.display = "none";
		document.getElementById("SignUp").style.display = "none";
		document.getElementById("SignOut").style.display = "initial";
		document.getElementById("Profile").style.display = "initial";
	}
}

</script>
</head>
<body>
	<div id="header">
	<a href="Home.jsp"><img id="logo" src = "plannrly.jpg"></img></a>
		<a id="Login"
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
					out.println("<tr>");
					out.println("<td><a href="+j.getUrl()+">" + j.getName() + "</a></td>");
					out.println("<td>" + j.getPrice() + "</td>");
					out.println("</tr>");
				}
			}
		%>
	</table>
</body>
</html>