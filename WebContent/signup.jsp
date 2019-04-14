<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<% String error = (String)request.getAttribute("error");
	if(error!=null){
		if(error == "same"){%>
			<script>alert("Error: your passwords must match!")</script>
		<%}
		else if(error == "taken"){%>
		<script>alert("Error: that username is taken!")</script>
		<%}
	}
%>
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
</script>
</head>
<link rel="stylesheet" type="text/css" href="Signup.css" />
<body>
<div id = "header"> 
<a href="/Home.jsp"><img id="logo" src = "plannrly.jpg"></img></a>
<a id="Login" href="login.jsp">Login</a>
<a id="SignUp" href = "signup.jsp">Sign up</a>
<div id="Profile"><a href="Profile.jsp">Profile</a> </div>

<a id="SignOut" href = "SignOut.jsp">Sign Out</a>
</div>


<a id="GroupCreation" href = "groupcreation.jsp">Create New Group</a>
<a id="SignOut" href = "${pageContext.request.contextPath}/ServletSignOut">Sign Out</a>
 <div id="container">
<p>Create your account:</p>
<form method = "GET" action="${pageContext.request.contextPath}/ServletSignUp">
<div class="child">
	<input type="text" name="username" placeholder="Username"><br>	</div>
		<div class="child">
	<input type="text" name = "pass" placeholder ="Password"><br></div>
	<input type="text" name ="confirmpass" placeholder ="Confirm Password"><br>
	<div class="child"><input type="submit" placeholder = "Submit"> </div>
</form>
</div>
</body>
</html>