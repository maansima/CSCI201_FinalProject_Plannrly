<!-- CSCI 201 Final Project Plannrly 
Team Members: Andrew Garcia, Cathleen Yang, Giovana Da Cunha, Maansi Manchanda 
Emails: andreweg@usc.edu, cathleey@usc.edu, dacunha@usc.edu, maansima@usc.edu
 -->
 

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<%
	String error = (String) request.getAttribute("error");
	if (error != null) {
		if (error == "same") {
%>
<script>
	alert("Error: your passwords must match!")
</script>
<%
	} else if (error == "taken") {
%>
<script>
	alert("Error: that username is taken!")
</script>
<%
	}
	}
%>
<script>
	window.onload = function() {
		var userID =
<%=session.getAttribute("loginID")%>
	if (userID == 0) {
			document.getElementById("SignOut").style.display = "none";
			document.getElementById("Profile").style.display = "none";
			document.getElementById("GroupCreation").style.display = "none";
		} else if (userID != 0) {
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
		function hover2(element) {
			  element.setAttribute('src', 'userPinkk.png');
			}

			function unhover2(element) {
			  element.setAttribute('src', 'user.png');
			}
</script>
</head>
<link rel="stylesheet" type="text/css" href="Signup.css" />
<body>

<div id = "header"> 
<a href="Home.jsp"><img id="logo" src = "plannrly.jpg" onmouseover="hover(this);" onmouseout="unhover(this);"></img></a>
<a id="Login" href="login.jsp">Login</a>
<a id="SignUp" href = "signup.jsp">Sign up</a>
<div id="Profile"><a href="ServletProfile">Profile</a> </div>
<a id="GroupCreation" href = "CreateGroup.jsp">Create New Group</a>
<a id="SignOut" href = "SignOut.jsp">Sign Out</a>
</div>

	<div id="container">
	<p>Create your account:</p>
	<img id="icon" src="user.png" width="30%" onmouseover="hover2(this);" onmouseout="unhover2(this);">
		<div id = "form" >
		
		<form method="GET"
			action="${pageContext.request.contextPath}/ServletSignUp">
			<div class="child">
				Username<br>
				<input type="text" name="username"><br>
			</div>
			<div class="child">
				Password<br>
				<input type="password" name="pass"><br>
			</div>
			<div class="child">
				Confirm Password<br>
				<input type="password" name="confirmpass"><br>
			</div>
			<div class="child">
				<input type="submit" id="button" placeholder="Submit">
			</div>
		</form>
		</div>
	</div>
</body>
</html>