<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- CAN ONLY BE ACCESSED BY GROUP LEADER TO ADD MEMBERS AND CREATE GROUP NAME -->
<head>
<meta charset="UTF-8">
<title>Group Creating Page</title>
<script>
	window.onload = function() {
		var userID =
<%=session.getAttribute("loginID")%>
	if (userID == 0) {
			document.getElementById("SignOut").style.display = "none";
			document.getElementById("Profile").style.display = "none";
		} else if (userID != 0) {
			document.getElementById("Login").style.display = "none";
			document.getElementById("SignUp").style.display = "none";
			document.getElementById("SignOut").style.display = "initial";
			document.getElementById("Profile").style.display = "initial";
		}
	}
</script>
</head>
<link rel="stylesheet" type="text/css" href="CreateGroup.css" />
<body>
	<div id="header">
		<a href="Home.jsp"><img id="logo" src="plannrly.jpg"></img></a> <a
			id="Login" href="login.jsp">Login</a> <a id="SignUp"
			href="signup.jsp">Sign up</a>
		<div id="Profile">
			<a href="Profile.jsp">Profile</a>
		</div>
		<a id="SignOut" href="${pageContext.request.contextPath}/ServletSignOut">Sign Out</a>
	</div>
	<img id="group" src="group.png"></img>
	<div id="container">
		<form action="groupCreation" method="GET">
			<div id="nameField" class="child">
				Group Name<br> <input type="text" name="name">
			</div>
			<div id="memberField" class="child">
				Member Names<br> <input type="text" name="members" placeholder="Member 1, Member 2, ..."/>
			</div>
			<div id="cityField" class="child">
				Where do you want to go?<br> <input name="cityName" type="text"
					placeholder="Location"></input>
			</div>
			<div id="acitvityField" class="child">
				What do you want to do?<br> <select name="activityType">
					<option value="food">Food</option>
					<option value="bars">Bars</option>
					<option value="active">Active</option>
					<option value="arts">Arts</option>
				</select>
			</div>
			<div id="priceField" class="child">
				How much do you want to spend?<br> <select name="price">
					<option value="$">$</option>
					<option value="$$">$$</option>
					<option value="$$$">$$$</option>
					<option value="$$$$">$$$$</option>
				</select>
			</div>
			<div id="submitButton" class="child">
				<input type="submit">
			</div>
		</form>
	</div>
</body>
</html>