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
		document.getElementById("GroupCreation").style.display = "none";
	}
	else if (userID!=0){
		document.getElementById("Login").style.display = "none";
		document.getElementById("SignUp").style.display = "none";
		document.getElementById("SignOut").style.display = "initial";
		document.getElementById("Profile").style.display = "initial";
		document.getElementById("GroupCreation").style.display = "initial";
	}
}

function hover(element) {
	  element.setAttribute('src', 'plannrlyPink.png');
	}

	function unhover(element) {
	  element.setAttribute('src', 'plannrly.jpg');
	}
</script>

</head>
<body>
	<div id = "header"> 
<a href="Home.jsp"><img id="logo" src = "plannrly.jpg" onmouseover="hover(this);" onmouseout="unhover(this);"></img></a>
<a id="Login" href="login.jsp">Login</a>
<a id="SignUp" href = "signup.jsp">Sign up</a>
<div id="Profile"><a href="${pageContext.request.contextPath}/ServletProfile">Profile</a> </div>
<a id="GroupCreation" href = "CreateGroup.jsp">Create New Group</a>
<a id="SignOut" href = "${pageContext.request.contextPath}/ServletSignOut">Sign Out</a>
	</div>
	<div id="errorMessage"></div>
	<table>
		<tr>
			<th>Activity</th>
			<th>Price</th>

		</tr>
		<%
			ArrayList<FinalYelpObj> activitiesList = (ArrayList<FinalYelpObj>) request.getAttribute("resultList");
			if(activitiesList != null){
			for (FinalYelpObj i : activitiesList) {
				for (Business j : i.getBusinesses()) {
					String name = j.getName().replace(" ", "*");
					String URL = "ServletResults?Value="+name;
					if((Integer)session.getAttribute("loginID") == 0){
						 URL = j.getUrl();
	
					}
					out.println("<tr>");
					out.println("<td><a href="+URL+">" + j.getName() + "</a></td>");
					out.println("<td>" + j.getPrice() + "</td>");
					out.println("</tr>");
				}
			}
			}
		%>
	</table>
</body>
</html>